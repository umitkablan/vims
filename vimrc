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

" Plug {{{
if has("vim_starting")
  set nocompatible   " Be iMproved
  " filetype off     " Required for Vundle!
  " set rtp+=~/.vim/packs/neobundle.vim/
endif

set encoding=utf-8
set fileencoding=utf-8
language C
set completeopt-=preview

" Plugins {{{
call plug#begin('~/.vim/packs')
" call neobundle#begin(expand('~/.vim/packs'))
" NeoBundleFetch 'Shougo/neobundle.vim'
Plug 'Shougo/vimproc', {
  \ 'do' : 'make -f make_mingw32.mak',
  \ }
Plug 'tpope/vim-dispatch'
Plug 'pydave/AsyncCommand'
Plug 'xolox/vim-misc'
Plug 'cecutil'
Plug 'tomtom/tlib_vim'
" NeoBundle 'https://bitbucket.org/ns9tks/vim-l9'
Plug 'genutils'
" Plug 'https://bitbucket.org/ZyX_I/frawor'
Plug 'lh-vim-lib'
Plug 'ingo-library'
Plug 'AnsiEsc.vim', {'on': 'AnsiEsc'}
Plug 'godlygeek/csapprox'
Plug 'chrisbra/SudoEdit.vim', {'on': 'SudoWrite'}
let g:LargeFile=2 " megabytes
Plug 'LargeFile'
"Plug 'ColorSchemeMenuMaker'
Plug 'Colorizer--Brabandt', {'for': 'css,html'}
"Plug 'lilydjwg/colorizer'
" a.vim alternate {{{
nnoremap <silent> ğa :A<CR>
Plug 'a.vim'
" }}}
" NeoBundleLazy 'craigemery/vim-autotag'
Plug 'umitkablan/vim-autotag'
Plug 'brookhong/cscope.vim', {'on': ['CscopeClear','CscopeList']}
"autocmd BufReadPost * DetectIndent
" NeoBundleLazy 'ciaranm/detectindent'
Plug 'yaifa.vim'
Plug 'lastpos.vim'
let g:NumberToggleTrigger="!"
nnoremap <silent> <Esc> :call NumberToggle_Absolute()<CR>
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" zhaocai/GoldenView {{{
let g:goldenview__enable_default_mapping = 0
Plug 'zhaocai/GoldenView.Vim'
"}}}
"NeoBundle 'IndGuide'
" IndentConsistencyCop / AutoCmds {{{
let g:indentconsistencycop_AutoRunCmd = 'IndentRangeConsistencyCop'
let g:indentconsistencycop_CheckAfterWrite = 1
let g:indentconsistencycop_CheckOnLoad = 0
let g:indentconsistencycop_CheckAfterWriteMaxLinesForImmediateCheck = 400
Plug 'IndentConsistencyCop'
Plug 'IndentConsistencyCopAutoCmds'
" }}}
Plug 'ShowTrailingWhitespace'
"Plug 'ntpeters/vim-better-whitespace'
" DeleteTrailingWhitespace {{{
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'ask'
Plug 'DeleteTrailingWhitespace'
" }}}
Plug 'CursorLineCurrentWindow'
Plug 'chrisbra/NrrwRgn' "We need it for Startify , {'on': ['NR','NW','NRV']}
Plug 'mikewest/vimroom', {'on': 'VimroomToggle'}
" ReplaceWithRegister {{{
nmap gr  <Plug>ReplaceMotion
nmap grr <Plug>ReplaceLine
xmap gr  <Plug>ReplaceVisual
Plug 'ReplaceWithRegister'
" }}}
" xuhdev/SingleCompile {{{
let g:SingleCompile_asyncrunmode = 'python'
let g:SingleCompile_usequickfix = 1
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_showresultafterrun = 0
nnoremap <silent> ğsc :SingleCompile<CR>
nnoremap <silent> ĞSC :SingleCompileRun<CR>
Plug 'xuhdev/SingleCompile', {'on': ['SCCompile','SCCompileRun']}
" }}}
" wesleyche/SrcExpl {{{
let g:SrcExpl_refreshTime = 400
let g:SrcExpl_isUpdateTags = 0
Plug 'wesleyche/SrcExpl', {'on': ['SrcExpl','SrcExplToggle']}
" }}}
Plug 'VimSpy', {'on': ['Messages','Command','CommandOutput','Syntax','Highlight','Function','Autocmd']}
Plug 'nelstrom/vim-qargs', {'on': 'Qargs'}
Plug 'DirDo.vim', {'on': ['DirDo','DDO','DDD','DirDoDir','DirDoAdd','DDA','DDP','DirDoPattern']}
" yonchu/accelerated-smooth-scroll {{{
let g:ac_smooth_scroll_no_default_key_mappings = 1
nmap <silent> <C-d> <Plug>(ac-smooth-scroll-c-d)
nmap <silent> <C-u> <Plug>(ac-smooth-scroll-c-u)
Plug 'yonchu/accelerated-smooth-scroll'
" }}}
" grep.vim {{{
let Grep_Skip_Files = 'tags *~ .lvimrc *.pyc *.min.js types_?*.taghl'
let Grep_Skip_Dirs = 'RCS CVS SCCS .git .vimprj .svn'
Plug 'grep.vim', {'on': 'Grep'}
" }}}
" milesz/ack.vim {{{
if executable("ag")
  let g:ackprg = 'ag --nocolor --nogroup --column --smart-case --skip-vcs-ignores'
else
  if executable("ack")
    let g:ackprg = 'ack -H --nocolor --nogroup --column'
  else
    if executable("ack-grep")
      let g:ackprg = 'ack-grep -H --nocolor --nogroup --column'
    endif
  endif
endif
Plug 'mileszs/ack.vim', {'on': ['Ack', 'AckAdd', 'AckFromSearch', 'LAck', 'LAckAdd', 'AckFile', 'AckHelp', 'LAckHelp', 'AckWindow', 'LAckWindow']}
" }}}
" bling/Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#excludes = []
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#whitespace#show_message=0
if !exists("g:airline_statusline_funcrefs")
  let g:airline_statusline_funcrefs = []
endif
let g:airline_section_b = '%<%1.24{getcwd()}'
" let g:airline_section_c = "%f%m %{tagbar#currenttag('<%s> ', '')}"
" let g:airline_section_x = ""
let g:airline_mode_map = {
      \ '__' : '------',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'v',
      \ 'V'  : 'V',
      \ 'c'  : 'C',
      \ '' : '^v',
      \ 's'  : 's',
      \ 'S'  : 'S',
      \ '' : '^s',
      \ }
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
if has('multi_byte')
  let g:airline_left_sep  = '»'
  let g:airline_left_sep  = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.whitespace = 'Ξ'
endif
Plug 'bling/vim-airline'
" }}}
Plug 'ntpeters/vim-airline-colornum'
Plug 'itchyny/calendar.vim', {'on': 'Calendar'}
Plug 'SyntaxMotion.vim'
Plug 'camelcasemotion'
" justinmk/vim-sneak {{{
nmap f <Plug>SneakForward
nmap F <Plug>SneakBackward
nmap , <Plug>SneakNext
nmap ; <Plug>SneakPrevious
" xmap ? <Plug>VSneakForward
" xmap ? <Plug>VSneakBackward
" xmap ? <Plug>VSneakNext
" xmap ? <Plug>VSneakPrevious
let g:sneak#streak = 1
Plug 'justinmk/vim-sneak'
" }}}
"NeoBundle 'supasorn/vim-easymotion'
"NeoBundle 'rhysd/clever-f.vim'
" sjl/Clam.vim {{{
nnoremap '! :Clam <Space>
xnoremap '! :ClamVisual <Space>
Plug 'sjl/clam.vim', {'on': 'Clam'}
" }}}
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'vis', {'on': ['B','S']}
" DBExt {{{
let g:dbext_default_SQLITE_bin = 'sqlite3'
nmap <unique> NOTUSEDğsh <Plug>DBHistory
Plug 'dbext.vim', {'for': 'sql'}
" }}}
" junegunn/EasyAlign {{{
xnoremap <silent> <Enter> :EasyAlign<CR>
Plug 'junegunn/vim-easy-align'
" }}}
Plug 'gf-ext'
"Plug 'kana/vim-gf-user'
Plug 'dpwright/vim-gf-ext'
"Plug 'gist-vim'
Plug 'sjl/gundo.vim', {'on': ['GundoShow','GundoToggle']}
" Indent-Guides {{{
let g:indent_guides_color_change_percent = 20
let g:indent_guides_enable_on_vim_startup = 0
" autocmd VimEnter * IndentGuidesDisable
Plug 'Indent-Guides', {'on': ['IndentGuidesToggle','IndentGuidesEnable','IndentGuidesDisable']}
" }}}
" AndrewRadev/Inline_Edit {{{
let g:inline_edit_autowrite=1
nnoremap <silent> <F2> :InlineEdit<CR>
inoremap <silent> <F2> <Esc>:InlineEdit<CR>
Plug 'AndrewRadev/inline_edit.vim', {'on': 'InlineEdit'}
" }}}
" DirDiff {{{
let g:DirDiffExcludes = ".svn,CVS,*.class,*.exe,*.Plo,*.o,*.swp,*.swo,*.la,*.lai,*.so,*.ko"
let g:DirDiffAddArgs = "-w"
Plug 'DirDiff.vim', {'on': 'DirDiff'}
" }}}
Plug 'linediff.vim', {'on': 'Linediff'}
Plug 'rickhowe/diffchar.vim', {'on': ['SDChar','RDChar','TDChar']}
" Mark {{{
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwHistAdd = '' "'/@'
let g:mwAutoSaveMarks = 0
let g:mwIgnoreCase = 0
xmap <Space><Space> <Plug>MarkSet
nmap <Space><Space> <Plug>MarkSet
nmap <Space>*       <Plug>MarkSearchNext
nmap <Space>#       <Plug>MarkSearchPrev
nmap <Space>ğ*      <Plug>MarkSearchCurrentNext
nmap <Space>ğ#      <Plug>MarkSearchCurrentPrev
nmap <S-Space>?     <Plug>MarkSearchAnyPrev
nmap <S-Space>/     <Plug>MarkSearchAnyNext
nmap <Space>nn      <Plug>MarkAllClear
nmap <Space>n       <Plug>MarkClear
nmap <Space>r       <Plug>MarkRegex
xmap <Space>r       <Plug>MarkRegex
Plug 'Mark'
" }}}
"Plug 't9md/vim-quickhl'
Plug 'matchit.zip'
Plug 'kana/vim-metarw'
" Multiselect {{{
let no_multiselect_maps = 1
Plug 'multiselect'
" }}}
" OmniCppComplete {{{
let OmniCpp_MayCompleteDot   = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
let OmniCpp_SelectFirstItem  = 0
Plug 'OmniCppComplete', {'for': 'cpp'}
"}}}
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
let no_java_maps=1
Plug 'Dinduks/vim-java-get-set', {'for': 'java'}
"Plug 'nosami/Omnisharp'
Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
Plug 'SQLComplete.vim', {'for': 'sql'}
" davidhalter/Jedi {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 1
let g:jedi#show_call_signatures = 0
let g:jedi#completions_command = "<M-_>"
Plug 'davidhalter/jedi-vim', {'for': 'python'}
"}}}
" let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 1
let g:go_autodetect_gopath = 0
let g:go#use_vimproc = 1
" let g:go_bin_path = expand('~/SRC/Go')
let g:go_snippet_engine = "neosnippet"
let g:go_list_type = "quickfix"
let g:go_def_mode = "godef"
au FileType go nnoremap <silent> <buffer> <CR> :exec "normal \<lt>C-]>"<CR>
au FileType go nnoremap <silent> <buffer> <Backspace> :if !umisc#QFixCloseAndCheck()<Bar>:exec "normal \<lt>C-t>"<Bar>endif<CR>
au FileType go nnoremap <silent> ğa :GoAlternate<CR>
Plug 'fatih/vim-go', {'for': 'go'}
"Plug 'klen/python-mode'
Plug 'ekalinin/Dockerfile.vim', {'for': 'docker'}
" mattn/Emmet {{{
let g:user_emmet_install_global = 0
au FileType html,css EmmetInstall
Plug 'mattn/emmet-vim', {'for': 'html'}
" }}}
" Shougo/NeoComplete {{{
augroup LargeFile_NeoComplete_Lock
  au!
  autocmd BufReadPost * if line("$")>1900 | NeoCompleteLock | else | NeoCompleteUnlock | endif
augroup END
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#enable_camel_case_completion = 0
let g:neocomplete#enable_underbar_completion = 0
let g:neocomplete#min_syntax_length = 2
let g:neocomplete#min_keyword_length = 2
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#max_list = 30
let g:neocomplete#enable_cursor_hold_i = 1
let g:neocomplete#enable_auto_delimiter = 0
let g:neocomplete#temporary_dir  = $HOME . '/.vim/var/neocomplete_tmp'
let g:neocomplete#data_directory = $HOME . '/.vim/var/neocomplete_cache'
" inoremap <expr> <C-y> neocomplete#close_popup()
" inoremap <expr> <C-e> neocomplete#cancel_popup()
inoremap <expr> <CR> pumvisible() ? neocomplete#smart_close_popup() : "\<CR>"
inoremap <expr> <C-h>       neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <Backspace> neocomplete#smart_close_popup()."\<Backspace>"
inoremap <expr> <Left>   neocomplete#smart_close_popup()."\<Left>"
inoremap <expr> <Right>  neocomplete#smart_close_popup()."\<Right>"
inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : neocomplete#smart_close_popup()."\<Up>"
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : neocomplete#smart_close_popup()."\<Down>"
" inoremap <expr> <Space> pumvisible() ? neocomplete#smart_close_popup() : "\<Space>"
let g:neocomplete#source_completion_length = {
  \ 'buffer_complete'    : 1,
  \ 'eclim_complete'     : 1,
  \ 'snippets_complete'  : 1,
  \ 'keyword_complete'   : 1,
  \ 'include_complete'   : 2,
  \ 'dictionary_complete': 2,
  \ 'syntax_complete'    : 2
  \ }
let g:neocomplete#dictionary_filetype_lists = {
  \ 'default'      : '',
  \ 'javascript'   : $HOME . '/.vimrc/dict/javascript.dict',
  \ 'actionscript' : $HOME . '/.vimrc/dict/actionscript.dict',
  \ 'python'       : $HOME . '/.vimrc/dict/python.dict',
  \ 'ruby'         : $HOME . '/.vimrc/dict/ruby.dict',
  \ 'java'         : $HOME . '/.vimrc/dict/java.dict',
  \ 'php'          : $HOME . '/.vimrc/dict/php.dict',
  \ 'txt'          : '/usr/share/dict/words',
  \ 'text'         : '/usr/share/dict/words',
  \ }
"autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=tern#Complete     "javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=jedi#completions  "pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype java          setlocal omnifunc=javacomplete#Complete
autocmd Filetype c,cpp         setlocal omnifunc=omni#cpp#complete#Main
Plug 'Shougo/neocomplete.vim'
"}}}
" Shougo/NeoSnippet & Snippet Sources {{{
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = $HOME . '/.vim/var/neocomplete_snippets'
imap <expr> <Tab> neosnippet#expandable_or_jumpable() ?
                  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<Plug>SuperTabForward"
smap <expr> <Tab> neosnippet#expandable_or_jumpable() ?
                  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
Plug 'Shougo/neosnippet.vim'
"Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet-snippets'
"}}}
" NetRW {{{
nmap <unique> NOTUSED_NETRW_HIDELISTEDIT <Plug>NetrwHideEdit
let g:tar_nomax = 1
let g:zip_nomax = 1
let g:netrw_sort_sequence="[\/]$,\<core\%(\.\d\+\)\=\>,*,\.pyc$,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$"
let g:netrw_use_noswf = 0
let g:netrw_keepdir = 0
let g:netrw_home = $HOME . '/.vim/var'
let g:netrw_liststyle = 0
let g:netrw_banner = 0
"let g:netrw_browsex_viewer = 'gnome-open'
Plug 'netrw.vim'
"}}}
" Notes {{{
let g:notesRoot = expand('$HOME/.vim/var/notes')
let g:notes_directories = [expand('$HOME/.vim/var/notes')]
Plug 'Notes', {'on': ['Note','NoteAsNew']}
"}}}
" DerekWyatt/vim-ProtoDef {{{
let g:protodefprotogetter=expand("$HOME/.vim/bundle/protodef-vim-derekwyatt/pullproto.pl")
Plug 'derekwyatt/vim-protodef', {'for': 'cpp'}
" }}}
" yssl/QFEnter {{{
let g:qfenter_open_map  = ['<CR>', '<2-LeftMouse>']
let g:qfenter_vopen_map = ['<C-V>']
let g:qfenter_hopen_map = ['<C-H>']
let g:qfenter_topen_map = ['<C-T>', 'T']
Plug 'yssl/QFEnter'
" }}}
" mhinz/Signify {{{
let g:signify_vcs_list = [ 'git', 'svn' ]
let g:signify_sign_overwrite = 0
let g:signify_line_highlight = 0
let g:signify_update_on_bufenter = 0
let g:signify_update_on_focusgained = 0
let g:signify_cursorhold_normal = 0
let g:signify_cursorhold_insert = 0
let g:signify_mapping_next_hunk = ']c'
let g:signify_mapping_prev_hunk = '[c'
nmap <Leader>]c <Plug>(signify-next-hunk)
nmap <Leader>[c <Plug>(signify-prev-hunk)
omap ih <Plug>(signify-motion-inner-pending)
xmap ih <Plug>(signify-motion-inner-visual)
omap ah <Plug>(signify-motion-outer-pending)
xmap ah <Plug>(signify-motion-outer-visual)
let g:signify_mapping_toggle = 'UNUSED_SIGNIGY_MT'
let g:signify_mapping_toggle_highlight = 'UNUSED_SIGNIGY_HH'
Plug 'mhinz/vim-signify'
" }}}
Plug 'sjl/vitality.vim'
Plug 'UnconditionalPaste'
" Smartput & sickill/Pasta {{{
" smartput's mappings about p/P are deleted in favour of vim-pasta.
" vim-pasta handles p/P while smartput handles gp/gP. Fair share.
" Also have non-smart mundane paste's just in case
let g:pasta_disabled_filetypes = ["coffee", "markdown"]
let g:pasta_enabled_filetypes = ['actionscript', 'c', 'cpp', 'javascript', 'python', 'sh', 'vim']
let g:smartput = 1
nmap <unique> NOTUSEDğst <Plug>SmartputToggle
nnoremap ğp p
nnoremap ĞP P
Plug 'Smartput'
Plug 'sickill/vim-pasta'
" }}}
" mjbrownie/SwapIt & tpope/SpeedDating {{{
let g:speeddating_no_mappings = 1
" Use SwapIt to interface C-X/A rather than speeddating. Speeddating is
" called from SwapIt as a fallback method.
nmap <Plug>SwapItFallbackIncrement <Plug>SpeedDatingUp
nmap <Plug>SwapItFallbackDecrement <Plug>SpeedDatingDown
Plug 'mjbrownie/swapit'
Plug 'tpope/vim-speeddating'
" }}}
Plug 'SQLUtilities'
" xolox/vim-Session {{{
let g:session_autoload = 'no'
Plug 'xolox/vim-session'
" }}}
" mhinz/Startify {{{
au FileType startify setlocal nospell
au User Startified setlocal cursorline
let g:startify_session_dir = '~/.vim/var/session'
let g:session_directory = "~/.vim/var/session"
let g:startify_files_number = 19
let g:startify_change_to_dir = 0
let g:startify_bookmarks = ['~/projects', '~/.vim']
let g:startify_list_order = [
  \ [' Recently opened files:'], 'files',
  \ [' Sessions:'], 'sessions',
  \ [' Bookmarks:'], 'bookmarks',
  \ ]
  " \ [' Recently modified files in the current directory:'], 'dir',
let g:startify_custom_header = map(split(system('fortune'), '\n'), '"   ". v:val') + ['',''] "fortune | cowsay
let g:startify_custom_footer = [
            \ ' _  _  ____  __  __    ___  __',
            \ '( \/ )(_  _)(  \/  )  (__ )/. |',
            \ ' \  /  _)(_  )    (    / /(_  _)',
            \ '  \/  (____)(_/\/\_)  (_/() (_)',
            \ ]
Plug 'mhinz/vim-startify'
"}}}
" SuperTab {{{
let g:SuperTabMappingForward = '<C-Space>'
let g:SuperTabMappingBackward = '<S-C-Space>'
let g:SuperTabDefaultCompletionType = "context" "<C-X><C-O>
let g:SuperTabLongestEnhanced = 0
let g:SuperTabCrMapping = 0
"Plug 'SuperTab'
Plug 'ervandew/supertab'
"}}}
Plug 'tpope/vim-surround'
" jiangmiao/Auto-Pairs {{{
let g:AutoPairsMapSpace = 0
let g:AutoPairsMapCR = 0
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '_-<M-b>'
Plug 'jiangmiao/auto-pairs'
"}}}
" scrooloose/Syntastic {{{
let g:syntastic_javascript_jshint_conf = "~/.vim/jshint.rc"
let g:syntastic_c_compiler_options = "-std=gnu99
                                  \  -Wall -Wextra -Wshadow -Wpointer-arith
                                  \  -Wcast-align -Wwrite-strings -Wmissing-prototypes
                                  \  -Wmissing-declarations -Wredundant-decls -Wnested-externs
                                  \  -Winline -Wno-long-long -Wuninitialized -Wconversion
                                  \  -Wstrict-prototypes"
"-pedantic
let g:syntastic_stl_format = '[=> ln:%F (%t)]'
let g:syntastic_aggregate_errors=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=2
let g:syntastic_always_populate_loc_list=1
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_check_header = 1
"let g:syntastic_*_checkers=['Xxx', 'Yyy']
Plug 'scrooloose/syntastic'
"}}}
Plug 'Chiel92/vim-autoformat'
Plug 'godlygeek/tabular'
" majutsushi/TagBar {{{
nnoremap <silent> TT :TagbarOpenAutoClose<CR>
Plug 'majutsushi/tagbar' "We need it for Startify {'on': ['TagbarOpenAutoClose', 'TagbarToggle', 'TagbarOpen']}
"}}}
" tomtom/TComment {{{
let g:tcommentMapLeader1=""
let g:tcommentMapLeader2=""
nnoremap <silent> __ :TComment<CR>
xnoremap <silent> __ :TCommentMaybeInline<CR>
Plug 'tomtom/tcomment_vim'
"}}}
" TextObj's {{{
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'coderifous/textobj-word-column.vim'
Plug 'mattn/vim-textobj-url'
Plug 'bps/vim-textobj-python', {'for': 'python'}
Plug 'thinca/vim-textobj-function-javascript', {'for': 'javascript'}
Plug 'austintaylor/vim-indentobject'
" glts/TextObj-Comment {{{
let g:textobj_comment_no_default_key_mappings = 1
xmap ax <Plug>(textobj-comment-a)
omap ax <Plug>(textobj-comment-a)
xmap ix <Plug>(textobj-comment-i)
omap ix <Plug>(textobj-comment-i)
Plug 'glts/vim-textobj-comment'
" }}}
"NeoBundle 'vim-textobj-quoted'
"NeoBundle 'killphi/vim-textobj-signify-hunk' "Deprecated, this functionality is in Signify itself
"NeoBundle 'kana/vim-textobj-fold'
"NeoBundle 'kana/vim-textobj-indent'
"NeoBundle 'textobj-line-vim-scripts'
" }}}
let g:tinykeymap#map#windows#map = "gw"
Plug 'tomtom/tinykeymap_vim'
Plug 'tpope/vim-unimpaired'
" t9md/TextManip {{{
xmap <Up>    <Plug>(textmanip-move-up)
xmap <Down>  <Plug>(textmanip-move-down)
xmap <Left>  <Plug>(textmanip-move-left)
xmap <Right> <Plug>(textmanip-move-right)
xmap D       <Plug>(textmanip-duplicate-down)
xmap DD      <Plug>(textmanip-duplicate-up)
Plug 't9md/vim-textmanip'
" }}}
" ctrlpvim/CtrlP {{{
let g:ctrlp_map = '-<c-p>'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_mruf_save_on_update = 0
nnoremap <silent> ğt :CtrlPBufTag<CR>
Plug 'ctrlpvim/ctrlp.vim', {'on': 'CtrlPBufTag'}
" }}}
" Shougo/Unite {{{
if has('multi_byte')
  let g:unite_prompt = '» '
endif
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=300
let g:unite_source_history_yank_limit=600
let g:unite_data_directory = $HOME . '/.vim/var/unite'
autocmd FileType unite call s:cust_unite_maps()
autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | bwipeout | endif
" autocmd BufLeave \[unite\]* set bufhidden=wipe
function! s:clearUniteBuffers() "{{{
  "find [unite] or *unite* buffers to be wiped-out
  let unitebuffs = filter(range(1, bufnr('$')),
        \ '"nofile" ==# getbufvar(v:val, "&buftype")
        \  && -1 == index(displayedbufs, v:val)
        \  && bufname(v:val) =~# ''*unite*\|\[unite\]''')
  " obliterate the buffers and their related state (marks especially).
  if !empty(unitebuffs)
    exe 'bwipeout! '.join(unitebuffs, ' ')
  endif
endfunction "}}}
" autocmd BufEnter * silent call <SID>clearUniteBuffers()
function! s:cust_unite_maps() "{{{
  let b:SuperTabDisabled=1
  " Overwrite settings.
  " nmap <buffer> <ESC>      <Plug>(unite_exit)
  " imap <buffer> jk         <Plug>(unite_insert_leave)
  " imap <buffer><expr> j unite#smart_map('j', '')
  " imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)
  " imap <buffer> '       <Plug>(unite_quick_match_default_action)
  " nmap <buffer> '       <Plug>(unite_quick_match_default_action)
  " imap <buffer> <expr> x unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
  " nmap <buffer> x        <Plug>(unite_quick_match_choose_action)
  " nmap <buffer> <C-z>    <Plug>(unite_toggle_transpose_window)
  " imap <buffer> <C-z>    <Plug>(unite_toggle_transpose_window)
  " imap <buffer> <C-y>    <Plug>(unite_narrowing_path)
  " nmap <buffer> <C-y>    <Plug>(unite_narrowing_path)
  " nmap <buffer> <C-j>    <Plug>(unite_toggle_auto_preview)
  " nmap <buffer> <C-r>    <Plug>(unite_narrowing_input_history)
  " imap <buffer> <C-r>    <Plug>(unite_narrowing_input_history)
  " nnoremap <silent><buffer><expr> l unite#smart_map('l', unite#do_action('default'))
  imap <silent><buffer><expr> <C-T> unite#do_action('tabdrop')
  imap <silent><buffer><expr> <C-o> unite#do_action('split')
  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif
  " nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <buffer><expr> S unite#mappings#set_current_filters(
          \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
endfunction "}}}
if !exists("g:unite_source_menu_menus") "{{{
  let g:unite_source_menu_menus = {}
endif
let g:unite_source_menu_menus.fenc = {
      \     'description' : 'Change file fenc option.',
      \ }
let g:unite_source_menu_menus.fenc.command_candidates = [
      \       ['utf8',      'set fenc=utf8'],
      \       ['iso2022jp', 'set fenc=Iso2022jp'],
      \       ['cp932',     'set fenc=Cp932'],
      \       ['euc',       'set fenc=Euc'],
      \       ['utf16',     'set fenc=Utf16'],
      \       ['utf16-be',  'set fenc=Utf16be'],
      \       ['jis',       'set fenc=Jis'],
      \       ['sjis',      'set fenc=Sjis'],
      \       ['unicode',   'set fenc=Unicode'],
      \     ]
let g:unite_source_menu_menus.vimshell = {
      \     'description' : 'Vim Shell Interactive',
      \ }
let g:unite_source_menu_menus.vimshell.candidates = {
      \       'ghci'      : 'VimShellInteractive ghci',
      \       'python'    : 'VimShellInteractive python',
      \}
function g:unite_source_menu_menus.vimshell.map(key, value)
  return {
        \       'word' : a:key, 'kind' : 'command',
        \       'action__command' : a:value,
        \}
endfunction
" }}}
Plug 'Shougo/unite.vim', {'on': 'Unite'}
nnoremap <silent> ğee    :UniteWithBufferDir -start-insert file<CR>
nnoremap <silent> ğe     :Unite -start-insert file<CR>
nnoremap <silent> <C-p>  :Unite -start-insert source<CR>
nnoremap <silent> <C-p>p :Unite -start-insert register history/yank<CR>
nnoremap <silent> ğb     :Unite -start-insert -auto-preview bookmark<CR>
nnoremap <silent> ĞB     :UniteBookmarkAdd <CR>
" -quick-match
nnoremap <silent> <C-B>  :Unite -start-insert buffer_tab file_rec/async<CR>
nnoremap <silent> ĞS     :Unite grep:.<CR>
nnoremap <silent> MRU    :UniteWithCurrentDir -no-split -start-insert file_mru directory_mru<CR>
nnoremap <silent> MRUU   :Unite -no-split -start-insert directory_mru file_mru<CR>
nnoremap <silent> <C-->  :Unite -no-split vimgrep:%:\\CTODO\:\\|FIXME\:\\|NOTE\:<CR>

Plug 'Shougo/tabpagebuffer.vim', {'on': 'Unite'}
Plug 'Shougo/neomru.vim',        {'on': 'Unite'}
Plug 'unite-locate',             {'on': 'Unite'}
Plug 'tsukkee/unite-tag',        {'on': 'Unite'}
"NeoBundle 'unite-colorscheme-1.3'
"NeoBundle 'unite-grep-Sixeight'
"NeoBundle 'tsukkee/unite-help'
"NeoBundle 'thinca/vim-unite-history'
"NeoBundle 'h1mesuke/unite-outline'
"NeoBundle 'hakobe/unite-script'
"}}}
" Shougo/VimShell {{{
nnoremap <silent> ğsh  :VimShellPop<CR>
nnoremap <silent> ğp2  :VimShellInteractive ipython2<CR>
nnoremap <silent> ğp3  :VimShellInteractive python3<CR>
nnoremap <silent> ğp12 :VimShellInteractive python2<CR>
Plug 'Shougo/vimshell', {'on': 'VimShellPop'}
" }}}
" tpope/Fugitive {{{
augroup no_sticky_buffers
  au!
  au BufReadPost fugitive://* setlocal bufhidden=delete
augroup END
Plug 'tpope/vim-fugitive', {'on': ['Git','Gstatus']}
" }}}
" NeoBundleLazy 'https://bitbucket.org/ZyX_I/aurum'
" VCSCommand {{{
let VCSCommandMapPrefix = "<LocalLeader>c"
let VCSCommandVCSTypePreference = 'git'
"let VCSCommandSVNDiffOpt = "-ignore-all-space"
" Turn off spell other than commit message writing
au FileType svndiff,svnlog,svnannotate,svnstatus setlocal nospell
augroup VCSCommand
  au VCSCommand User VCSBufferCreated setlocal bufhidden=delete
augroup END
Plug 'vcscommand.vim', {'on': ['VCSDiff','VCSStatus','VCSCommit','VCSBlame','VCSRevert','VCSAdd','VCSUpdate','VCSLog','VCSInfo']}
" }}}
Plug 'thinca/vim-ref', {'on': 'Ref'}
"NeoBundle 'viewdoc'
"NeoBundle 'ManPageView'
"NeoBundle 'viki'
Plug 'dbakker/vim-lint', {'for': 'vim'}
Plug 'Vimball', {'for': 'vim'}
Plug 'VisIncr', {'on': ['I','II']}
let g:repeat_load_via_plugin = 1
let g:repeat_dot_mapping = '<Bar>'
let g:repeat_undo_mapping = 'U'
Plug 'umitkablan/vim-repeat'
"Plug 'visualrepeat'
Plug 'bronson/vim-visual-star-search'
Plug 'embear/vim-foldsearch', {'on': ['Fs','Fw','Fp','FS','Fl','Fc','Fi','Fd','Fe']}
Plug 'epeli/slimux'
"Plug 'vimux'
Plug 'mattn/webapi-vim'
" NeoBundleLazy 'othree/xml.vim'
Plug 'sukima/xmledit', {'for': 'xml'}
Plug 'jamestomasino/actionscript-vim-bundle', {'for': 'actionscript'}
Plug 'elzr/vim-json',   {'for': 'json'}
Plug 'tpope/vim-git',   {'for': 'git'}
Plug 'zaiste/tmux.vim', {'for': 'tmux'}
Plug 'hdima/python-syntax',     {'for': 'python'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
" Plug 'bigfish/vim-js-context-coloring', {'for': 'javascript'}
let g:vim_markdown_initial_foldlevel=1
let g:vim_markdown_no_default_key_mappings=1
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
" cpp-vim for better @Spell @NoSpell support
let c_no_curly_error = 1
Plug 'vim-jp/cpp-vim', {'for': 'cpp'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
"Plug 'Mizuchi/STL-Syntax'
Plug 'ujihisa/ft-cmake', {'for': 'cmake'}
Plug 'gerw/vim-HiLinkTrace', {'on': ['HLT','HLTm']}
Plug 'hexman.vim'
Plug 'CmdlineComplete'
Plug 'Konfekt/vim-alias' "'cmdalias.vim'
" incsearch.vim & vim-indexed-search {{{
let g:incsearch#separate_highlight = 1
let g:incsearch#vim_cmdline_keymap = 0
let g:incsearch#highlight = {
  \   'match' : {
  \     'group' : 'IncSearchMatch',
  \     'priority' : '10'
  \   },
  \   'on_cursor' : {
  \     'priority' : '100'
  \   },
  \   'cursor' : {
  \     'group' : 'ErrorMsg',
  \     'priority' : '1000'
  \   }
  \ }
let g:indexed_search_mappings = 0
Plug 'henrik/vim-indexed-search'
let g:incsearch#consistent_n_direction = 1
let g:incsearch#magic = ''
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <silent> n  <Plug>(_incsearch-n)zv:ShowSearchIndex<CR>
map <silent> N  <Plug>(_incsearch-N)zv:ShowSearchIndex<CR>
map <silent> *  <Plug>(_incsearch-*)
map <silent> #  <Plug>(_incsearch-#)
map <silent> g* <Plug>(_incsearch-g*)
map <silent> g# <Plug>(_incsearch-g#)
Plug 'haya14busa/incsearch.vim'
augroup incsearch_indexed
autocmd!
  autocmd User IncSearchLeave ShowSearchIndex
augroup END
augroup incsearch_cmdlinecomplete
  autocmd!
  autocmd VimEnter * call s:incsearch_cmdlinecomplete_keymap()
augroup END
function! s:incsearch_cmdlinecomplete_keymap()
  IncSearchNoreMap <C-n> <Over>(buffer-complete)
  IncSearchNoreMap <C-p> <Over>(buffer-complete-prev)
  "IncSearchNoreMap <c-p> <Plug>CmdlineCompleteBackward "not working
  IncSearchNoreMap <C-f> <Over>(incsearch-scroll-f)
  IncSearchNoreMap <C-b> <Over>(incsearch-scroll-b)
endfunction
" }}}
" CoremoSearch {{{
let g:CoremoSearch_setDefaultMap = 0
nnoremap <silent> X  :CoremoSearchAdd<CR>
xnoremap <silent> X  :CoremoSearchAddV<CR>
nnoremap <silent> ğX :CoremoSearchRemove<CR>
xnoremap <silent> ğX :CoremoSearchRemoveV<CR>
Plug 'CoremoSearch'
" }}}
" mbbill/FencView {{{
let g:autofenc_enable = 1
let g:fencview_autodetect = 0
Plug 'mbbill/fencview', {'on': 'FencView'}
" }}}
" edkolev/TmuxLine.vim {{{
let g:tmuxline_powerline_separators=0
let g:tmuxline_preset='full'
Plug 'edkolev/tmuxline.vim'
" }}}
Plug 'umitkablan/vim-zeroth-colorscheme', {'on': 'ZerothCS'}
" umitkablan/umisc {{{
autocmd FileType vim  vnoremap <silent><buffer> <F2> :Source<CR>
autocmd FileType vim  nnoremap <silent><buffer> <F2> :Source<CR>
autocmd FileType text nmap     <silent><buffer> <CR> :call umisc#SwapTrCharsToFromEn()<CR>
" Cycle through UPPERCASE, lowercase, and Titlecase of the selection
xnoremap <silent> ~    ygv"=umisc#TwiddleCase(@")<CR>Pgv
nnoremap <silent> ĞN   :redir @n\|call umisc#DecAndHex(expand("<cWORD>"))\|redir END<CR>
nnoremap <silent> ĞMM  :call umisc#VimProcMake()<CR>
nnoremap <silent> <F5> :MakeTmuxBuild<CR>
inoremap <silent> <F5> <Esc>:MakeTmuxBuild<CR>
nmap     <silent> <Tab><Space><Space> :call umisc#ToggleIndGuides_RC()<CR>
" Go To LineNum With Locals Prefix
nnoremap <silent> ĞG :<C-U>call umisc#GotoLine_WithoutInitials(0)<CR>
onoremap <silent> ĞG :<C-U>call umisc#GotoLine_WithoutInitials(1)<CR>
xnoremap <silent> ĞG :<C-U>call umisc#GotoLine_WithoutInitials(1)<CR>
" All/Inner Next
onoremap <silent> an :<C-U>call umisc#NextTextObject('a', 'f')<CR>
xnoremap <silent> an :<C-U>call umisc#NextTextObject('a', 'f')<CR>
onoremap <silent> in :<C-U>call umisc#NextTextObject('i', 'f')<CR>
xnoremap <silent> in :<C-U>call umisc#NextTextObject('i', 'f')<CR>
" All/Inner Last
onoremap <silent> al :<C-U>call umisc#NextTextObject('a', 'F')<CR>
xnoremap <silent> al :<C-U>call umisc#NextTextObject('a', 'F')<CR>
onoremap <silent> il :<C-U>call umisc#NextTextObject('i', 'F')<CR>
xnoremap <silent> il :<C-U>call umisc#NextTextObject('i', 'F')<CR>
Plug 'umitkablan/umisc'
" }}}
" NeoBundleLazy 'jszakmeister/vim-togglecursor'
" NeoBundleLazy 'pafcu/Vimsplain'
" NeoBundleLazy 'thinca/vim-prettyprint'
" NeoBundleLazy 'Headlights'
" NeoBundleLazy 'drmikehenry/vim-fixkey'
" NeoBundleLazy 'junkblocker/patchreview-vim'
" NeoBundleLazy 'kshenoy/vim-signature'
" NeoBundleLazy 'tacahiroy/ctrlp-funky'
" NeoBundleLazy 'terryma/vim-multiple-cursors'
" NeoBundleLazy 'https://bitbucket.org/abudden/taghighlight'
" NeoBundleLazy 'bufkill.vim'
" NeoBundleLazy 'EasyGrep'
" NeoBundleLazy 'surfer.vim'
" tomtom/quickfixsigns_vim {{{
" " let loaded_quickfixsigns = 1
" let g:quickfixsigns_classes = ['qfl', 'loc', 'vcsdiff', 'marks'] "'breakpoints', 'rel', 'cursor'
" au FileType conque_term let b:quickfixsigns_ignore = ['rel', 'loc']
" NeoBundleLazy 'tomtom/quickfixsigns_vim'
" }}}
"NeoBundle 'yate'
Plug 'ryanoasis/vim-devicons'

" Load Local Bundles {{{
" NeoBundleLocal ~/.vim/bundle
"autocmd BufWritePost ~/.vim/** Helptags
" }}}
Plug 'rkitover/vimpager', {
  \ 'do' : 'make',
  \ }
" call neobundle#end()
call plug#end()
" }}}

" tomtom/TinyKeyMap {{{
call tinykeymap#EnterMap('changelocs', 'ğ,', {'name': 'Change locations'})
call tinykeymap#Map('changelocs', ',', 'norm! g,')
call tinykeymap#Map('changelocs', ';', 'norm! g;')
" }}}
" GF-Ext {{{
call gf_ext#add_handler('\.jpg$', "!firefox -new-window")
call gf_ext#add_handler('\.avi$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.flv$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.mp4$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.mov$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.mkv$', "!mplayer -really-quiet")
call gf_ext#add_handler('http://\S*$', "!firefox -new-window")
" }}}

" filetype plugin indent on " Required for Vundle!
" NeoBundleCheck
" }}}

" global configuration {{{
set nocompatible
filetype plugin on
filetype indent on
syntax on
" set regexpengine=1
let mapleader = "ü"
let maplocalleader = ","
"set term color to 256 for some colorschemes to work.
set t_Co=256
"show statusbar all the time
set laststatus=2 showtabline=2
set cmdheight=2 winminwidth=0
set noruler noshowmode title
" highlight the search, don't start from beginning when you reach end.
set hlsearch incsearch
set nowrapscan
" case sensitivity: smart
set ignorecase
set smartcase
set backspace=indent,eol,start
"absolute number  is better than relative
set number "relativenumber
set history=450
"move the viminfo file to .vim to avoid the vim-related rubbish outside .vim/.
set viminfo+=n~/.vim/var/viminfo
"set equalprg=astyle formatprg=uncrustify
set matchpairs+=<:>
" those indent values will be overridden by automatic indent finders (like
" yaifa, sleuth, detectindent)
set tabstop=4 shiftwidth=4 expandtab
" clear tags and path; use some other technique to decide later (depending on
" project settings)
set tags= path=.
set wildignorecase wildmenu wildmode=list:longest,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc
set wildignore+=*.pyo,*.pyd,*.class,*.lock
set wildignore+=.git,.svn,.hg
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg
set suffixes+=.toc,.out,.inx
" can leave a buffer without saving
set hidden
" backup and temp dirs
set backup undofile
set undodir=~/.vim/var/backup
set backupdir=~/.vim/var/backup
set directory=~/.vim/var/tmp
set updatetime=5000
"make a little max-delay between keypad *touches*
set timeout timeoutlen=440 ttimeout ttimeoutlen=50
set cursorline nocursorcolumn
set wrap linebreak
if has('multi_byte')
  let &showbreak = '↳ '
else
  let &showbreak = '> '
endif
set spell spelllang=en
" Fix some terminals' up/down/right/left arrow keys
" set t_ku=[1;1A t_kd=[1;1B
" set t_kr=[1;1C t_kl=[1;1D
" keep cursor always in the middle
" set scrolloff=9999

au FileType text setlocal wrap linebreak
au FileType help setlocal nonumber
au FileType qf,tagselect,diff  setlocal nospell
au FilterWritePre * if &diff | setlocal nospell | endif
au InsertEnter * set nocursorline
au InsertLeave * set cursorline
au TabLeave    * stopinsert
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/','%','g'), '\','%','g'),  ':','','g').'~'
" delete swap file if the swapped file is 'nomodified'
au SwapExists  * if !&mod | let v:swapchoice = 'd' | endif
au VimLeave    * if v:dying | wall | endif

" Colorscheme Selection {{{
" hemisu bandit lucius solarized badwolf asu1dark burnttoast256 rastafari molokai
" oh-la-la ubloh hickop neverness django wombat256 fnaqevan harlequin fruity
" candycode southernlight lucid kolor kingtop getafe phonzia blackboard
" last256 aldmeris hybrid darknight256 luna inkpot gardener sienna freya
" Tomorrow-Night-Eighties moria felipec radicalgoodspeed pencil
" gruvbox sorcerer apprentice
set background=dark
colorscheme PerfectDark
" if !has("gui_running")
"   au ColorScheme * hi CursorLine term=none cterm=none ctermbg=001510
" endif
" }}}
if has("gui")
  set guioptions-=T
  set guioptions-=r
  set guioptions+=c " Use console dialogs where possible"
  "set guioptions-=m
endif
" if has("gui_running")
"   winsize 170 46
" endif
" }}}
" personal maps: maps that do not need plugins {{{
nnoremap <silent> ZZ  :hide<CR>
nnoremap <silent> ZZA :qa<CR>
nnoremap <silent> ZZE :lcd %:h\|sp .\|wincmd p\|bd<CR>
nnoremap <silent> ZA  :bd<CR>
" disable all _accidental touches_
nnoremap QQ <Nop>
nnoremap Qq gQ
nnoremap qq <Nop>
nnoremap Q <Nop>
nnoremap u <Nop>
nnoremap U u
nnoremap qQ Q
nnoremap ğq gqip
" CTRL-c to leave insert mode,  better not know it.
nnoremap <silent> <C-c> :echo expand("%:p:~")<CR>
nnoremap oo o<Esc>o
nnoremap OO O<Esc>O
imap <C-BS> <C-W>
noremap g; g,
noremap g, g;
nmap g,, g,g,
" not to press shift key
noremap gl $
noremap gh ^
inoremap <silent> <C-E> <C-O>:normal! "g$"<CR>
inoremap <silent> <C-A> <C-O>:exe "normal! \<C-O>g^"<CR>
" behave like C and D counterparts (default is yy, which yanks line(s))
noremap Y y$
" Needed the 'dot' at reverse side of comma/n, which is mainly used for
" search-replace (<comma_or_n><dot>)
nnoremap <silent> <Bar> :normal .<CR>
" do not use shift-* for colon, make it one shot
nnoremap ç :
xnoremap ç :
nmap . ç
xmap . ç
" nnoremap / q/i
" nnoremap : q:i
" nnoremap ? q?i
" TODO: This command is not working properly when you have used up/down to
" navigate cline history and executed a command. This command is not seen as
" last command.
" run last command; @: is not working properly in the current scheme when some
" thing is re-executed from history before.
nnoremap <silent> <F3> :<Up><CR>
vnoremap <silent> <F3> :<Up><CR>
" map arrow keys to move whole window up/down
"   <C-D>/<C-U>, Lzz/Hzz or <C-F>/<C-B> may also be used for Up/Down
nmap <Up>   5<C-Y>
nmap <Down> 5<C-E>
" clearing @/ is really useful: last search's highlight distracts me more than rarely
nnoremap <silent> \ :let @/=""\|echo "Cleared Search Pattern"<CR>
" nnoremap / /\V " unneeded, functionality provided by incsearch.vim
" save current file path to register
nnoremap <silent> y@@ :let @+=expand("%:p")<CR>
nnoremap <silent> y@  :let @+=expand("%:.")<CR>
" gui receives keystrokes that terminal cannot, use them for saving &
" visual-reselect, etc.
if has("gui_running")
  nnoremap <silent> <C-s> :update<CR>
  vmap <C-s> <Esc><C-s>gv
  imap <C-s> <C-o><C-s>
endif
" using TAB instead of ^W is easier {{{
nmap <Tab>h <C-W>h
nmap <Tab>j <C-W>j
nmap <Tab>k <C-W>k
nmap <Tab>l <C-W>l
nmap <Tab>o <C-W>o
nmap <Tab>x <C-W>x
nmap <Tab>_ <C-W>_
nmap <Tab>\| <C-W>\|
nmap <Tab>v <C-W>v
nmap <Tab>s <C-W>s
nmap <Tab><Bar> <C-W><Bar>
nmap <Tab>- <C-W>-
nmap <Tab>+ <C-W>+
nmap <Tab>t <C-W>T
nmap <Tab>T <C-W>t
nmap <Tab><Tab> <C-W><C-W>
" }}}
" easier tab navigation prev/next
nnoremap <silent> <Tab><Tab>l :<C-U>call umisc#TabNextRelatively(v:count1)<CR>
nnoremap <silent> <Tab><Tab>h :<C-U>call umisc#TabPrevRelatively(v:count1)<CR>
" half/full redraw
nnoremap <silent> <C-l> :redraw!\|set cul<CR>
nnoremap <silent> <C-l><C-l> :let @/=""\|redraw!\|e!\|set nu\|set cul<CR>
nnoremap <silent> HH  :hide<CR>
nnoremap <silent> ĞCD :cd %:p:h<CR>
nnoremap <silent> ğcd :pwd<CR>
nnoremap <silent> ğrc :sp .lvimrc<CR>
nnoremap <silent> ĞĞE :Explore<CR>
nnoremap <silent> ĞE  :call umisc#OpenExplore()<CR>
nnoremap <silent> ĞV  :call umisc#OpenExplore('vertical')<CR>
nnoremap <silent> ĞRC :tabe ~/.vim/<CR>
nnoremap <silent> ĞT  :sp .<CR><C-W>T
" de facto visual block indent mappings
vnoremap < <gv
xnoremap > >gv
" nnoremap ğ> >i} AND ğ< <i}
" easier %s/%g
nnoremap ğs :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
nnoremap ğg :%g/<C-r><C-w>/
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
nnoremap <silent> <Space> :exe 'silent! normal! '.((foldclosed('.')>0)? "zMzxzt" : 'zc')<CR>
nnoremap <expr> GV '`[' . strpart(getregtype(), 0, 1) . '`]'
" ease cmdline 0/$ movement
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" unnamed register to/from system clipboard
nmap <silent> ğ,, :set paste\|exe 'norm "+p'\|set nopaste<CR>
nmap <silent> Ğ;; :set paste\|exe 'norm "+p'\|set nopaste<CR>GV=
nnoremap ğc "+yiw
nnoremap ĞC gv"+y
xnoremap ğc "+y
" Better than just inverting 'paste' is inverting and showing
" set pastetoggle=<F12>
inoremap <F12> <C-O>:set invpaste paste?<CR>
nnoremap <F12>      :set invpaste paste?<CR>
" easy completion
inoremap <C-j> <C-X><C-O>
" au CmdwinEnter * map <silent> <buffer> <Esc><Esc> <C-c>
" vnoremap <c-j> @='jojo'<cr>
" vnoremap <expr> <c-j> 'jo'.v:count1.'jo'
" vnoremap <c-k> @='koko'<cr>
" vnoremap <expr> <c-k> 'ko'.v:count1.'ko'
" swap comma (,) and semicolon (;) because my keyboard is comma-privileged
" call s:SwapKeys(",", ";")
" }}}

" preprocessor #if 0 over selected line(s) {{{
augroup preprocessor_langs
  au!
  au FileType c,cpp vnoremap out "zdmzO#if 0<ESC>"zp'zi#endif<CR><ESC>k
augroup END
" au BufEnter * syntax sync fromstart
" syntax sync minlines=450
" }}}
" Quickfix/Location List Toggle/Clear {{{
nnoremap <silent> <F9> :QFix<CR>
nnoremap <silent> <F10> :lclose\|cclose<CR>
nnoremap <silent> <F10><F9> :call setqflist([])\|call setloclist(0, [])\|call UpdateSigns_()<CR>
" }}}
" :update key combinations {{{
" These are the key combos that I always press while I'm aiming to
" <Tab><Space>, all are valid for me to :update.
nnoremap <silent> <Tab><Space> :update<CR>
nnoremap <silent> <Space><Tab> :update<CR>
nnoremap <silent> <Esc><Space> :update<CR>
nnoremap <silent> <Space><Esc> :update<CR>
" }}}
" j/k/Space Behaviour {{{
inoremap <expr><silent> jk
      \ pumvisible() ? neocomplete#close_popup()."\<Esc>" : "\<Esc>"
inoremap <expr><silent> kj
      \ pumvisible() ? neocomplete#close_popup()."\<Esc>" : "\<Esc>"
inoremap <expr><silent> jk<Space>
      \ pumvisible() ? neocomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
inoremap <expr><silent> j<Space>k
      \ pumvisible() ? neocomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
inoremap <expr><silent> kj<Space>
      \ pumvisible() ? neocomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
inoremap <expr><silent> k<Space>j
      \ pumvisible() ? neocomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
" Adjust maps according to language: some languages are semicolon driven.
augroup semicolon_langs
  au!
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> jk
      \ umisc#YieldSemicolonIfAppropriate()."\<Esc>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> kj
      \ umisc#YieldSemicolonIfAppropriate()."\<Esc>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> jk<Space>
      \ umisc#YieldSemicolonIfAppropriate()."\<Esc>:update\<CR>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> j<Space>k
      \ umisc#YieldSemicolonIfAppropriate()."\<Esc>:update\<CR>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> kj<Space>
      \ umisc#YieldSemicolonIfAppropriate()."\<Esc>:update\<CR>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> k<Space>j
      \ umisc#YieldSemicolonIfAppropriate()."\<Esc>:update\<CR>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> <CR>
      \ pumvisible() ? neocomplete#close_popup() : umisc#IsSemicolonAppropriateHere() ? ";\<CR>" : "\<CR>"
augroup END
" }}}

" personal plugin maps {{{
" Enter/Backspace Behaviour {{{
augroup tag_langs
  au!
  " Adjust maps according to tags status: some filetypes are tags-driven.
  " Other Ideas: TSelect.vim, TS (exPlugin), Unite
  " <CR>        --:> :TS <C-R><C-W><CR>
  " <Backspace> --:> :PopTagStack<CR>
  " <CR>        --:> :UniteWithCursorWord -immediately tag<CR>
  au FileType c,cpp,java,javascript,python,actionscript,sh
          \ nnoremap <silent> <buffer> <CR> :Tselect <C-R><C-W><CR>
  au FileType c,cpp,java,javascript,python,actionscript,sh
          \ nnoremap <silent> <buffer> <Backspace> :if !umisc#QFixCloseAndCheck()<Bar>exec "normal \<lt>C-T>"<Bar>endif<CR>
augroup END
nnoremap <silent> <Backspace> :call umisc#QFixCloseAndCheck()<CR>
au FileType tar,man,conque_term       nnoremap <silent> <buffer> <Backspace> :bwipeout!<CR>
au FileType tagbar,qf,help            nnoremap <silent> <buffer> <Backspace> :q<CR>
au FileType tagbar,qf,tagselect       nmap     <buffer>          <Esc>       <Backspace>
au FileType netrw                     nmap     <buffer>          <Backspace> -
au FileType vundle,gitcommit,calendar nmap     <buffer>          <Backspace> q
augroup VCSCommand
  au VCSCommand User VCSBufferCreated nnoremap <silent> <buffer> <Backspace> :q!<CR>
augroup END
" }}}

inoremap <expr> <C-K> BDG_GetDigraph()
nnoremap <silent> ğ1 :Sscratch<CR>
nnoremap <silent> ğğu :Utl<CR>
xnoremap <silent> ğğu :Utl<CR>
nnoremap <silent> GL :call EchoLocationPath()<CR>
nnoremap <silent> [d :call ShowBlockName('[d')<CR>
nnoremap <silent> [i :call ShowBlockName('[i')<CR>
" }}}
" plugin configuration {{{
let g:tmuxmake_targets = ""
let g:no_tagselect_maps = 1
let g:locator_disable_mappings = 1

" Aliases {{{
augroup useful_Aliases
  autocmd!
  autocmd VimEnter * Alias m make
  autocmd VimEnter * Alias te tabedit
  autocmd VimEnter * Alias tee tabedit<Space>~/
  autocmd VimEnter * Alias spp sp<Space>~/
  autocmd VimEnter * Alias tec tabedit<Space>%
  autocmd VimEnter * Alias dd diffthis
  autocmd VimEnter * Alias do diffoff
  autocmd VimEnter * Alias did DirDiff
  autocmd VimEnter * Alias ie InlineEdit
  autocmd VimEnter * Alias E e
  autocmd VimEnter * Alias er Errors
  autocmd VimEnter * Alias Er Errors
  autocmd VimEnter * Alias un Underline
  autocmd VimEnter * Alias git  Git
  autocmd VimEnter * Alias gl   Glog
  autocmd VimEnter * Alias gt   Git
  autocmd VimEnter * Alias gs   Gstatus
  autocmd VimEnter * Alias ge   Gedit
  autocmd VimEnter * Alias gvsp Gvsplit
  autocmd VimEnter * Alias ac  LAck!
  autocmd VimEnter * Alias Ac  LAck!
  autocmd VimEnter * Alias acc LAckAdd!
  autocmd VimEnter * Alias Acc LAckAdd!
  autocmd VimEnter * Alias ag  Ack!
  autocmd VimEnter * Alias Ag  Ack!
  autocmd VimEnter * Alias agg AckAdd!
  autocmd VimEnter * Alias Agg AckAdd!
  autocmd VimEnter * Alias gr  Grep
  autocmd VimEnter * Alias Gr  Grep
  autocmd VimEnter * Alias rg  Rgrep
  autocmd VimEnter * Alias Rg  Rgrep
  autocmd VimEnter * Alias grr GrepAdd
  autocmd VimEnter * Alias vc VCSCommit
  autocmd VimEnter * Alias vd VCSDiff
  autocmd VimEnter * Alias vr VCSRevert
  autocmd VimEnter * Alias vb VCSBlame
  autocmd VimEnter * Alias vu VCSUpdate
  autocmd VimEnter * Alias vl VCSLog
  autocmd VimEnter * Alias vs VCSStatus
  autocmd VimEnter * Alias vi VCSInfo
  autocmd VimEnter * Alias va VCSAdd
  autocmd VimEnter * Alias vrm VCSRemove
  autocmd VimEnter * Alias sw SudoWrite
  autocmd VimEnter * Alias sr SudoRead
  autocmd VimEnter * Alias con VimShellPop
  autocmd VimEnter * Alias ref Ref
  autocmd VimEnter * Alias man Ref<Space>man
  autocmd VimEnter * Alias up UpdateTypesFileOnly
  autocmd VimEnter * Alias ss SaveSession!<Space>default
augroup END
" }}}

let g:ctags_path = '/usr/bin/ctags'
let g:ctags_args = '-I __declspec+'
let g:ctags_title = 1
let g:ctags_statusline = 1
let generate_tags = 1
let g:valgrind_arguments='--leak-check=yes --num-callers=5000'
let g:yankring_history_dir = expand('$HOME/.vim')
let g:local_vimrc=".lvimrc"
let g:hybrid_use_Xresources = 0
let g:github_user = "umitkablan"
let g:loaded_fonts=1
" }}}

try
  source ~/.vimrc.local
catch //
endtry

" vim:fdm=marker
