" Global vim configuration: vimrc
" Umit Kablan <gmail: umitkablan>
"
" Note that the configuration is designed for a Turkish QWERTY keyboard and
" that supporting ~/.Xmodmap is really helpful for productivity.  Such modmap
" shall map <AltGr>-hjkl to corresponding arrow keys, and Turkish local keys
" ş/ı to Enter/Backspace. 1st is vital (and sounds pretty for a system wide
" vim-like movements), 2nd is recommended for faster coding without switching
" to EN_us keyboard layout (but the actual keyboard layout should be
" considered; the idea is simply choose closest key to hjkl and do not move
" your hand to press enter-backspace as it is forced by most "general-purpose"
" keyboards.).

"Global Vim configuration
"***************** {{{
set nocompatible
filetype plugin on
filetype indent on
syntax on
let mapleader = "ğ"
let maplocalleader = ","
"set term color to 256 for some colorschemes to work.
set t_Co=256
"show statusbar all the time
set laststatus=2
set noruler
"set the terminal title
set title
" highlight the search, don't start from beginning when you reach end.
set hlsearch
set nowrapscan
" case sensitivity: smart
set ignorecase
set smartcase
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"i am a software craftsman. want to see line numbers!
set number
set relativenumber
" highlight current line
set cul "cursorline
set wmw=0 "minimum window height
set cmdheight=2
set history=450
"move the viminfo file to .vim to avoid the vim-related rubbish outside .vim/.
set viminfo+=n~/.vim/var/viminfo
" astyle is artistic style program working like gnu indent.
" set equalprg=astyle
" uncrustify is a sophisticated code beautifier.
" set formatprg=uncrustify
set matchpairs+=<:>
" those indent values will be overridden by an automatic indent finder. (like
" yaifa)
set tabstop=4
set shiftwidth=4
set expandtab
" clear tags n path; use some other technique to decide
set tags=
set path=
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*.bak,*.exe
" can leave a buffer without saving
set hidden
" backup and temp dirs
set backup
set backupdir=~/.vim/var/backup
set directory=~/.vim/var/tmp
set updatetime=5000
"make a little max-delay between keypad *touches*
set timeout timeoutlen=540 ttimeoutlen=100
" set notimeout ttimeout ttimeoutlen=200
" keep cursor always at the middle
" set scrolloff=9999
autocmd FileType text set wrap linebreak
autocmd TabLeave * stopinsert
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/','%','g'), '\','%','g'),  ':','','g').'~'
"**************** }}}

"personal maps: maps that does not need plugins
"************* {{{
nmap <silent> ZZ :q<CR>
nmap <silent> ZZA :qa<CR>
nnoremap Q gQ
nnoremap qq <Nop>
" Always falling to that typo while commanding to edit.
cnoremap <expr> E<Space> (getcmdtype()==':' && getcmdpos()==1) ? 'e ' : 'E '
nnoremap oo o<Esc>o
nnoremap OO O<Esc>O
imap <C-BS> <C-W>
" swap comma (,) and semicolon (;) because my keyboard is comma-privileged
noremap , ;
noremap ; ,
onoremap , ;
onoremap ; ,
" behave like C and D counterparts (default is yy, which yanks line(s))
map Y y$
" nnoremap / q/i
" nnoremap : q:i
" nnoremap ? q?i
" autocmd CmdwinEnter * map <silent> <buffer> <Esc><Esc> <C-c>
" map arrow keys to move whole window up/down
noremap <Down> <C-E>
noremap <Up>   <C-Y>
" clearing @/ is really useful: last search's highlight distracts me more than rarely
nnoremap <silent> \ :let @/=""<CR>
" saving stuff
if has("gui_running")
  nnoremap <silent> <C-s> :update<CR>
  vmap <C-s> <Esc><C-s>gv
  imap <C-s> <C-o><C-s>
endif
if has("gui")
  set guioptions-=T
  set guioptions-=r
  set guioptions+=c " Use console dialogs where possible"
  "set guioptions-=m
endif
nnoremap <silent> <Tab><space> :update<CR>
nnoremap <silent> <Tab><space> :w<CR>
" using TAB instead of ^W is easier
nnoremap <silent> <Tab>l <C-W>l
nnoremap <silent> <Tab>h <C-W>h
nnoremap <silent> <Tab>j <C-W>j
nnoremap <silent> <Tab>k <C-W>k
nnoremap <silent> <Tab><Tab>l :tabnext<CR>
nnoremap <silent> <Tab><Tab>h :tabprev<CR>
" full redraw
nnoremap <silent> <c-l> :redraw!<CR>
nnoremap <silent> HH :hide<CR>
nnoremap <silent> ĞCD :cd %:p:h<CR>
nnoremap <silent> <Leader>rc :sp .lvimrc<CR>
nnoremap <silent> ĞRC :tabnew ~/.vim/vimrc<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <Leader>> >a}
nnoremap <Leader>< <a}
"nnoremap <silent> gf :sp <cfile><CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
" vnoremap <c-j> @='jojo'<cr>
" vnoremap <expr> <c-j> 'jo'.v:count1.'jo'
" vnoremap <c-k> @='koko'<cr>
" vnoremap <expr> <c-k> 'ko'.v:count1.'ko'
inoremap <C-j> <C-X><C-O>
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"

au FileType qf nnoremap <buffer> o <CR><C-W>p

call pathogen#infect()
autocmd BufWritePost ~/.vim/** Helptags
call ipi#inspect()

" personal plugin maps
" --------------------
" Adjust maps according to language: some languages are semicolon driven.
augroup semicolon_langs
  au!
  au FileType c,cpp,java,javascript imap <buffer> <space><space> ;
  " Adjust maps according to tags status: some filetypes are tags-driven.
  " Tried Tselect (TSelect.vim) and TS (exPlugin) exclusively:
  " <CR>        --:> :TS <C-R><C-W><CR>
  " <Backspace> --:> :PopTagStack<CR>
  au FileType c,cpp,java,javascript,python nmap <silent> <buffer> <CR> :Tselect <C-R><C-W><CR>
  au FileType c,cpp,java,javascript,python nmap <buffer> <Backspace> <C-T>
  " au FileType c,cpp,java,javascript,python nmap <buffer> <CR> UniteWithCursorWord -immediately tag<CR>
  " au FileType * if stridx("c,cpp,java", &ft)>=0| call CSyntaxAfter()|endif
  " au BufWritePost * if stridx("c,cpp,java,javascript", &ft)>=0| call s:RainbowParanthesisEnableAll_RC()|endif
  au FileType help :set nonumber
augroup END

augroup preprocessor_langs
  au!
  au FileType c,cpp vmap out "zdmzO#if 0<ESC>"zp'zi#endif<CR><ESC>
augroup END

" submode didn't work for my aim
" call submode#enter_with('window-walk', 'n', '', '<C-W><C-W>', '<C-W><C-W>')
" call submode#map('window-walk', 'n', '', 'j', '<C-W>j')
" call submode#map('window-walk', 'n', '', 'k', '<C-W>k')
" call submode#map('window-walk', 'n', '', 'h', '<C-W>h')
" call submode#map('window-walk', 'n', '', 'l', '<C-W>l')
let g:loaded_fonts=1
nnoremap <silent> <Leader>a :A<CR>
nnoremap <silent> <Leader>1 :Sscratch<CR>
nnoremap <silent> <space><space><space> :ResizeWinMaxHV<CR>
nnoremap <silent> ĞSH :VimShellPop<CR>
nnoremap <silent> <Leader>sh :ConqueTermSplit bash<CR>
nnoremap <silent> <Leader><Leader>sh :ConqueTerm bash<CR>
nnoremap <silent> <Leader>p2 :ConqueTermSplit ipython2<CR>
nnoremap <silent> <Leader>p3 :ConqueTermSplit python3<CR>
nnoremap <silent> <Leader>p12 :ConqueTermSplit python2<CR>
nnoremap <silent> ĞĞE :Exp<CR>
nnoremap <silent> ĞE :call OpenExplore()<CR>
nnoremap <silent> <Leader>e :Unite -start-insert file<CR>
" nnoremap <silent> <Leader>e :CommandT<CR>
nnoremap <silent> <Leader><Leader>u :Utl<CR>
vnoremap <silent> <Leader><Leader>u :Utl<CR>
nnoremap ĞUU :Underline<space>
nnoremap <silent> <Leader>w :call WinWalkerMenu()<CR>
nnoremap <silent> TT :TagbarOpenAutoClose<CR>
nnoremap <silent> ĞTS :ExtsSelectToggle<CR>
nnoremap <silent> ĞTT :ExtsStackToggle<CR>
nnoremap <silent> <C-P> :Unite -start-insert source<CR>
nnoremap <silent> <Leader>b :Unite -start-insert bookmark<CR>
nnoremap <silent> <C-B> :Unite -start-insert buffer<CR>
nnoremap <silent> MRU :Unite -start-insert file_mru directory_mru<CR>
nnoremap <silent> <Leader>t  :FufBufferTag<CR>
nnoremap <silent> <Leader><Leader>cd :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> ĞĞCD :FufDirWithFullCwd<CR>
nnoremap <silent> <Leader>sc :SingleCompile<CR>
nnoremap <silent> ĞSC :SingleCompileRun<CR>
nnoremap <silent> TDD :call Tdd_RunTest()<CR>
nnoremap '! :Clam<space>
" nmap <silent> <C-z> <Plug>QAnotherWin
" nmap <Leader>t :Shell make test<CR><CR>
" nnoremap <unique> <silent> <Leader><Leader><Leader>tasaasd :call MakeGreen()<CR>
" nnoremap <silent> <Leader>b  :FufBuffer<CR>
" nmap <silent> <unique> <Leader>b <Plug>SelectBuf
nmap <silent> <Tab><Tab> :call ToggleIndGuides_RC()<CR>
nmap CAL  <Plug>CalendarV
nmap HCAL <Plug>CalendarH
nmap VCAL <Plug>CalendarV
vmap <Space><Space>  <Plug>MarkSet
nmap <Space><Space>  <Plug>MarkSet
nmap <Space>*  <Plug>MarkSearchNext
nmap <Space>#  <Plug>MarkSearchPrev
nmap NOTUSED<Leader># <Plug>MarkSearchCurrentPrev
nmap NOTUSED<Leader>* <Plug>MarkSearchCurrentNext
nmap NOTUSED?  <Plug>MarkSearchAnyPrev
nmap NOTUSED/  <Plug>MarkSearchAnyNext
nmap <Space>nn <Plug>MarkAllClear
nmap <Space>n  <Plug>MarkClear
nmap <Space>r <Plug>MarkRegex
vmap <Space>r <Plug>MarkRegex
nmap gr  <Plug>ReplaceMotion
nmap grr <Plug>ReplaceLine
vmap gr  <Plug>ReplaceVisual
" fallback to speeddating when SwapIt cannot success
nmap <Plug>SwapItFallbackIncrement <Plug>SpeedDatingUp
nmap <Plug>SwapItFallbackDecrement <Plug>SpeedDatingDown
imap <expr> <TAB> neocomplcache#sources#snippets_complete#expandable() ?
          \ "\<Plug>(neocomplcache_snippets_expand)" : "\<Plug>SuperTabForward"
" Disable Luc Hermitte's maps
vmap <unique> NOTUSED<c-x>v <Plug>RefactorExtractVariable
vmap <unique> NOTUSED<c-x>t <Plug>RefactorExtractType
nmap <unique> NOTUSED<c-x>P <Plug>RefactorPutLastUp
nmap <unique> NOTUSED<c-x>p <Plug>RefactorPutLastDown
nmap <unique> NOTUSED<c-x>g <Plug>RefactorExtractGetter
nmap <unique> NOTUSED<c-x>s <Plug>RefactorExtractSetter
imap <unique> NOTUSED<c-space> <Plug>PreviewWord
nmap <unique> NOTUSED<c-space> <Plug>PreviewWord
imap <unique> NOTUSED<c-F10> <Plug>ClosePreviewWindow
nmap <unique> NOTUSED<c-F10> <Plug>ClosePreviewWindow
imap <unique> NOTUSED<c-x>i <Plug>CompleteIncludes
nmap <unique> NOTUSED<c-x>i <Plug>OpenIncludes
nmap <silent> NOTUSED<F9> <Plug>ToggleBrackets
imap <silent> NOTUSED<F9> <Plug>ToggleBrackets
nmap <unique> NOTUSED<M-Insert> <Plug>MarkersMark
vmap <unique> NOTUSED<M-Insert> <Plug>MarkersMark
imap <unique> NOTUSED<M-Insert> <Plug>MarkersMark
imap <unique> NOTUSED<M-Del> <Plug>MarkersJumpF
map  <unique> NOTUSED<M-Del> <Plug>MarkersJumpF
imap <unique> NOTUSED<M-S-Del> <Plug>MarkersJumpB
map  <unique> NOTUSED<M-S-Del> <Plug>MarkersJumpB
function! s:Lh_Cpp_Hate()
  nmap <buffer> NOTUSED]m <Plug>NextFunctionStart
  nmap <buffer> NOTUSED[m <Plug>PrevFunctionStart
  nmap <buffer> NOTUSED]M <Plug>NextFunctionEnd
  nmap <buffer> NOTUSED[M <Plug>PrevFunctionEnd
  nmap <buffer> NOTUSED;GI <Plug>GotoImpl
  nmap <buffer> NOTUSED<M-LeftMouse>  <LeftMouse><Plug>GotoImpl<CR>
  nmap <buffer> NOTUSED;PI <Plug>PasteImpl
  nmap <buffer> NOTUSED<M-RightMouse> <LeftMouse><Plug>PasteImpl
  nmap <buffer> NOTUSED;MI <Plug>MoveToImpl
  imap <buffer> NOTUSED<C-X>GI <Plug>GotoImpl
  imap <buffer> NOTUSED<M-LeftMouse>  <LeftMouse><Plug>GotoImpl
  imap <buffer> NOTUSED<C-X>PI <Plug>PasteImpl
  imap <buffer> NOTUSED<M-RightMouse> <LeftMouse><Plug>PasteImpl
  imap <buffer> NOTUSED<C-X>MI <Plug>MoveToImpl
endfunction
au BufReadPre c,cpp call s:Lh_Cpp_Hate()
map <unique> UNUSED<LocalLeader>p <Plug>JavagetsetInsertGetterSetter
map <unique> UNUSED<LocalLeader>g <Plug>JavagetsetInsertGetterOnly
map <unique> UNUSED<LocalLeader>s <Plug>JavagetsetInsertSetterOnly
map <unique> UNUSED<LocalLeader>b <Plug>JavagetsetInsertBothGetterSetter
nmap <unique> NOTUSED<Leader>a <Plug>ToggleAutoCloseMappings
imap <unique> NOTUSED<C-S> <Plug>Isurround
nmap <unique> NOTUSED<Leader>st <plug>SmartputToggle
nmap <unique> NOTUSED<Leader>sh <Plug>DBHistory
"************* }}}

"plugin configuration
"******************** {{{
" smartput's mappings about p/P are deleted in favour of vim-pasta.
" vim-pasta handles p/P while smartput handles gp/gP. Fair share.
" Also have non-smart mundane paste's just in case
let g:smartput = 1
nnoremap ğp p
nnoremap ĞP P
" use SwapIt to interface C-X/A rather than speeddating. speeddating is
" called from SwapIt as a fallback method.
let g:speeddating_no_mappings = 1
"------------------------------------------
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'ask'
"------------------------------------------
let g:enableUnicodeCompletion = 0
let g:languagetool_jar="/usr/share/languagetool/LanguageTool.jar"
let g:LustyExplorerDefaultMappings = -1
"------------------------------------------
let g:tcommentMapLeader1="_"
let g:tcommentMapLeader2 = '<Leader>-_0'
"------------------------------------------
let g:AutoPairsMapCR = 0
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
"------------------------------------------
let g:notesRoot = expand('$HOME/.vim/var/notes')
let g:local_vimrc=".lvimrc"
" let g:vimprj_changeCurDirIfVimprjFound = 1
" let g:vimprj_alwaysApplyExecSettings = 1
" let g:indexer_indexerListFilename=$HOME.'/.vim/indexer_files'
" let g:indexer_ctagsJustAppendTagsAtFileSave=1
" let g:indexer_ctagsWriteFilelist=1
" let g:indexer_useSedWhenAppend=1
let g:Tdd_makeprg='make'
let g:exTS_backto_editbuf = 0
let g:exTS_close_when_selected = 1
let Grep_Skip_Files = 'tags *~ .lvimrc'
let Grep_Skip_Dirs = 'RCS CVS SCCS .git .vimprj'
let g:DirDiffExcludes = "CVS,*.class,*.exe,*.Plo,*.o,*.swp,*.swo,*.la,*.lai,*.so"
let g:yankring_history_dir = expand('$HOME/.vim')
let g:EasyMotion_leader_key = '<Tab>'
" let g:simple_bookmarks_filename = '~/.vim/simple_bookmarks'
"------------------------------------------
let g:indent_guides_color_change_percent = 20
let g:indent_guides_enable_on_vim_startup = 0
autocmd VimEnter * :IndentGuidesDisable
"------------------------------------------
let g:mwDefaultHighlightingPalette = 'extended'
let g:mwHistAdd = '' "'/@'
let g:mwAutoSaveMarks = 0
let g:mwIgnoreCase = 0
"------------------------------------------
let g:SignsMixedIndentation = 1
let g:Signs_Diff = 0
let g:Signs_QFList = 1
let g:Signs_Alternate = 0
" SignExpression getline(v:lnum)=~'TODO'
let g:quickfixsigns_classes = ['qfl', 'loc', 'vcsdiff', 'breakpoints'] "'marks', 'cursor', 'rel'
"------------------------------------------
let g:syntastic_stl_format = '[=> ln:%F (%t)]'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_check_header = 0
"------------------------------------------
let g:loaded_easytags = "disable_"
let g:easytags_file = "~/.vim/easytags_TAGS"
let g:easytags_always_enabled = 1
let g:easytags_updatetime_min = 2000
autocmd FileType conque_term let b:easytags_auto_highlight = 0
autocmd FileType conque_term let b:easytags_on_cursorhold = 0
autocmd FileType conque_term let b:easytags_auto_update = 0
let g:easytags_updatetime_autodisable = 1
"------------------------------------------
let g:loaded_colorsupport = "disable_"
"let g:loaded_obviousmode = "disable_"
let g:loaded_StatusLineHighlight = "disable_"
let no_multiselect_maps = 1
"------------------------------------------
let VCSCommandMapPrefix = "<LocalLeader>c"
let VCSCommandVCSTypePreference = 'git'
"------------------------------------------
let g:tar_nomax = 1
let g:zip_nomax = 1
"------------------------------------------
let g:netrw_use_noswf = 0
let g:netrw_keepdir = 0
let g:netrw_home = $HOME . '/.vim/var'
let g:netrw_liststyle = 0
let g:netrw_banner = 0
"let g:netrw_browsex_viewer = 'gnome-open'
"------------------------------------------
let utl_opt_verbose=0
"------------------------------------------
let g:xptemplate_key = '<Tab>'
let g:xptemplate_nav_prev = '<S-Tab>'
let g:xptemplate_bundle = 'javascript_jquery'
let g:xptemplate_brace_complete = '([{<'
let g:xptemplate_strict = 0
let g:xptemplate_always_show_pum=1
let g:xptemplate_highlight = 'current'
"------------------------------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_snippets_dir = '~/.vim/var/neocomplcache_snippets'
"let g:neocomplcache_enable_cursor_hold_i = 1
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype java          setlocal omnifunc=javacomplete#Complete
autocmd Filetype c,cpp         setlocal omnifunc=omni#cpp#complete#Main
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.php  = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c    = '\h\w*\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp  = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.java = '\h\w*\%(\.\|->\)'
"if !exists('g:neocomplcache_omni_functions')
        "let g:neocomplcache_omni_functions = {}
"endif
"let g:neocomplcache_omni_functions.c   = 'omni#cpp#complete#Main'
"------------------------------------------
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
"------------------------------------------
let g:acp_enableAtStartUp = 0
let g:acp_behaviorKeywordLength = 2
let g:acp_completeoptPreview = 0
let g:acp_ignorecaseOption = 0
"let g:acp_behaviorXmlOmniLength = -1
"let g:acp_behaviorHtmlOmniLength = -1
"let g:acp_behaviorCssOmniPropertyLength = -1
"------------------------------------------
let g:fuf_modesDisable = ['mrucmd', 'mrufile']
let g:fuf_dataDir='~/.vim/var/fuf-data'
let g:fuf_buffer_keyDelete='<C-d>'
"------------------------------------------
let TxtBrowser_Dict_Url = 'http://www.google.com.tr/dictionary?aq=f&langpair=en|tr-TR&q=text&hl=tr-TR'
let TxtBrowser_Dict_Url = 'http://www.definitions.net/definition/text'
let Txtbrowser_Search_Engine = 'http://www.google.com.tr/search?q=text'
"------------------------------------------
let g:SingleCompile_asyncrunmode = 'python'
let g:SingleCompile_usequickfix = 1
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_showresultafterrun = 0
"------------------------------------------
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_CWInsert = 1
"------------------------------------------
let g:no_tagselect_maps = 1
"------------------------------------------
let g:ctags_path = '/usr/bin/ctags'
let g:ctags_args = '-I __declspec+'
let g:ctags_title = 1
let g:ctags_statusline = 1
let generate_tags = 1
let g:statline_filename_relative = 0
let g:statline_mixed_indent = 1
let g:statline_show_charcode = 1
let g:statline_show_tagname = 1
let g:statline_syntastic = 1
let g:statline_show_encoding = 0
"------------------------------------------
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=1500
let g:unite_source_history_yank_limit=1000
let g:unite_data_directory = $HOME . '/.vim/var/unite'
let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.vimshell = {
      \     'description' : 'Vim Shell Interactive',
      \ }
let g:unite_source_menu_menus.vimshell.candidates = {
      \       'ghci'      : 'VimShellInteractive ghci',
      \       'python'    : 'VimShellInteractive python',
      \}
let g:unite_source_menu_menus.commands = {
      \     'description' : 'Command Output',
      \}
let g:unite_source_menu_menus.commands.candidates = {
      \       'NMap'      : 'NMap',
      \}
let g:unite_source_menu_menus.colorschemes = {
      \     'description' : 'Colorscheme',
      \}
let g:unite_source_menu_menus.colorschemes.candidates = {
      \       'colorscheme select' : 'Unite -auto-preview colorscheme',
      \}
function g:unite_source_menu_menus.commands.map(key, value)
  return {
        \       'word' : a:key, 'kind' : 'command',
        \       'action__command' : a:value,
        \}
endfunction
function g:unite_source_menu_menus.vimshell.map(key, value)
  return {
        \       'word' : a:key, 'kind' : 'command',
        \       'action__command' : a:value,
        \}
endfunction
function g:unite_source_menu_menus.colorschemes.map(key, value)
  return {
        \       'word' : a:key, 'kind' : 'command',
        \       'action__command' : a:value,
        \}
endfunction
"------------------------------------------
let g:SrcExpl_refreshTime = 400
"------------------------------------------
let g:protodefprotogetter=expand("$HOME/.vim/bundle/protodef-vim-derekwyatt/pullproto.pl")
"------------------------------------------
let g:indentconsistencycop_AutoRunCmd = 'IndentRangeConsistencyCop'
let g:indentconsistencycop_CheckAfterWrite = 1
let g:indentconsistencycop_CheckAfterWriteMaxLinesForImmediateCheck = 400
"------------------------------------------
"function! <SID>SetMainDefaults()
  "" since yaifa.vim I have these needn't be set
  ""set tabstop=3
  ""set shiftwidth=3
  ""set expandtab
"endfunction
"call <SID>SetMainDefaults()
"call vimprj#init()
" define a vimprj hook
"function! g:vimprj#dHooks['SetDefaultOptions']['main_options'](dParams)
  "call <SID>SetMainDefaults()
"endfunction
"------------------------------------------
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
" let g:SuperTabMappingForward = '<nul>'
" let g:SuperTabMappingBackward = '<s-nul>'
"************************ }}}

"let g:vimmp_server_type="mpd"
"let g:mpd_music_directory="~/music"
"let g:mpd_playlist_directory= "/var/lib/mpd/playlists"
"nmap <silent> <Leader>x :py vimmp_toggle()<CR>
"if has('python')
  "py import os, sys
  "py sys.path.append(os.path.expanduser("~/.vim/vimmp"))
  "pyf ~/.vim/vimmp/main.py
"endif

"FUNCTIONS / COMMANDS
"********* {{{
function! OpenExplore() "{{{
  if bufname(bufnr("%")) ==? ""
    silent! Explore
  else
    silent! Sexplore
  endif
endfunction "}}}

command! RandomLine ruby Vim.command 'normal! ' + (VIM::Buffer.current.length * rand).ceil.to_s + 'gg'
" command! RandomLine execute 'normal! '.(system('sh -c "echo -n $RANDOM"') % line('$')).'G'
" command! RandomLine execute 'normal! '.(matchstr(system('od -vAn -N3 -tu4 /dev/urandom'), '^\_s*\zs.\{-}\ze\_s*$') % line('$')).'G'
" nmap <silent> <buffer> <F7> :RandomLine<CR>

" command! range=% -nargs=0 Tab2space exe "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
" command! range=% -nargs=0 Space2tab exe "<line1>,<line2>s/^\\(\\ \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

" with ctags you can search for tags.DB upward hieararchy via :set tags=tags;/
" but cscope cannot do that withuot helper like this one
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
"au BufEnter * call LoadCscope()

function! DecAndHex(number)
  let ns = '[.,;:''"<>()^_lL"]'      " number separators
  if a:number =~? '^' . ns. '*[-+]\?\d\+' . ns . '*$'
    let dec = substitute(a:number, '[^0-9+-]*\([+-]\?\d\+\).*','\1','')
    echo dec . printf('  ->  0x%X, -(0x%X)', dec, -dec)
  elseif a:number =~? '^' . ns. '*\%\(h''\|0x\|#\)\?\(\x\+\)' . ns . '*$'
    let hex = substitute(a:number, '.\{-}\%\(h''\|0x\|#\)\?\(\x\+\).*','\1','')
    echon '0x' . hex . printf('  ->  %d', eval('0x'.hex))
    if strpart(hex, 0,1) =~? '[89a-f]' && strlen(hex) =~? '2\|4\|6'
      " for 8/16/24 bits numbers print the equivalent negative number
      echon ' ('. float2nr(eval('0x'. hex) - pow(2,4*strlen(hex))) . ')'
    endif
    echo
  else
    echo "NaN"
  endif
endfunction
nnoremap <silent> ĞN :call DecAndHex(expand("<cWORD>"))<CR>

function! VimProcMake()
  let sub = vimproc#popen2(':make')
  let res = ''
  while !sub.stdout.eof
    let res .= sub.stdout.read()
  endwhile
  let [cond, status] = sub.waitpid()
  call setqflist([])
  call vimproc#write("/dev/quickfix", res)
  if status == 0
    cclose
  else
    copen
  endif
endfunction
nnoremap ĞMM :call VimProcMake()<CR>

function! TDD_Mode()
  SyntasticToggleMode
  " au BufWritePost * :call QuickfixsignsClear('qfl')|call VimProcMake()
  au BufWritePost * call VimProcMake()
endfunction

function! s:Underline(chars)
  let chars = empty(a:chars) ? '-' : a:chars
  let nr_columns = virtcol('$') - 1
  let uline = repeat(chars, (nr_columns / len(chars)) + 1)
  put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)

" Execute 'cmd' while redirecting output.
" Delete all lines that do not match regex 'filter' (if not empty).
" Delete any blank lines.
" Delete '<whitespace><number>:<whitespace>' from start of each line.
" Display result in a scratch buffer.
function! s:Filter_lines(cmd, filter)
  let save_more = &more
  set nomore
  redir => lines
  silent execute a:cmd
  redir END
  let &more = save_more
  new
  setlocal buftype=nofile bufhidden=hide noswapfile
  put =lines
  g/^\s*$/d
  %s/^\s*\d\+:\s*//e
  if !empty(a:filter)
    execute 'v/' . a:filter . '/d'
  endif
  0
endfunction
command! -nargs=? Scriptnames call s:Filter_lines('scriptnames', <q-args>)

" command PP: print lines like :p or :# but with with current search pattern highlighted
function! s:PrintWithSearchHighlighted(line1,line2,arg)
  let line=a:line1
  while line <= a:line2
    echo ""
    if a:arg =~ "#"
      echohl LineNr
      echo strpart(" ",0,7-strlen(line)).line."\t"
      echohl None
    endif
    let l=getline(line)
    let index=0
    while 1
      let b=match(l,@/,index)
      if b==-1 |
        echon strpart(l,index)
        break
      endif
      let e=matchend(l,@/,index) |
      echon strpart(l,index,b-index)
      echohl Search
      echon strpart(l,b,e-b)
      echohl None
      let index = e
    endw
    let line=line+1
  endw
endfunction
command! -nargs=? -range -bar PP :call s:PrintWithSearchHighlighted(<line1>,<line2>,<q-args>)

nnoremap <C-n> :call VimLock(1)<CR>i
function! VimLock(enable)
  if a:enable
    inoremap a 1
    inoremap s 2
    inoremap d 3
    inoremap f 4
    inoremap g 5
    inoremap h 6
    inoremap j 7
    inoremap k 8
    inoremap l 9
    inoremap ; 0
    inoremap <Esc> <Esc>:call VimLock(0)<CR>
  else
    iunmap a
    iunmap s
    iunmap d
    iunmap f
    iunmap g
    iunmap h
    iunmap j
    iunmap k
    iunmap l
    iunmap ;
    iunmap <Esc>
  endif
endfunction

"Cycle through UPPERCASE, lowercase, and Titlecase: after v'ing, press ~
"several times
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

let s:indentation_guides_enabled = 0
function! ToggleIndGuides_RC()
  if s:indentation_guides_enabled == 1
    IndGuide!
    IndentGuidesDisable
    let s:indentation_guides_enabled = 0
  else
    IndGuide
    IndentGuidesEnable
    let s:indentation_guides_enabled = 1
  endif
endfunction

let g:letters_map_en_tr_forward = {
      \ 'o':'ö', 'c':'ç', 'g':'ğ', 's':'ş', 'i':'ı', 'u':"ü",
      \  'O':'Ö', 'C':'Ç', 'G':'Ğ', 'S':'Ş', 'I':'İ', 'U':'Ü'
      \ }
let g:letters_map_en_tr_reverse = {
      \ 'ö':'o', 'ç':'c', 'ğ':'g', 'ş':'s', 'ı':'i', 'ü':'u',
      \  'Ö':'O', 'Ç':'C', 'Ğ':'G', 'Ş':'S', 'İ':'I', 'Ü':'U'
      \ }
function! SwapTrCharsToFromEn()
  let l:saved_reg = @k
  norm "kyl
  let l:curletter = @k
  let @k = l:saved_reg
  if has_key(g:letters_map_en_tr_forward, l:curletter)
    exec "norm \"_xi" . g:letters_map_en_tr_forward[l:curletter]
  elseif has_key(g:letters_map_en_tr_reverse, l:curletter)
    exec "norm \"_xi" . g:letters_map_en_tr_reverse[l:curletter]
  endif
  norm l
endfunction
autocmd FileType text nmap <buffer> <silent> <cr> :call SwapTrCharsToFromEn()<cr>

let g:rainbowparantheses_enabled_RC=0
function! s:RainbowParanthesisEnableAll_RC()
  if g:rainbowparantheses_enabled_RC == 0
    RainbowParenthesesToggle
    " ToggleRaibowParenthesis
    " RainbowParenthesesLoadRound
    " call rainbow_parenthsis#LoadRound ()
    RainbowParenthesesLoadSquare
    " call rainbow_parenthsis#LoadSquare ()
    RainbowParenthesesLoadBraces
    " call rainbow_parenthsis#LoadBraces ()
    RainbowParenthesesLoadChevrons
    " call rainbow_parenthsis#LoadChevrons ()
    let g:rainbowparantheses_enabled_RC=1
  endif
endfunction

" Next and Last {{{
" Motion for "next/last object". For example, "din(" would go to the next "()" pair
" and delete its contents.
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  endif
  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
"******************************************** }}}

set background=dark
" bandit lucius solarized badwolf asu1dark burnttoast256 rastafari molokai
colorscheme badwolf
" set background=dark
" hi CursorLine term=none cterm=none ctermbg=3

winsize 170 46

"vim:fdm=marker
