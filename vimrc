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

" NeoBundle {{{
if has("vim_starting")
  set nocompatible " Be iMproved
  " filetype off     " Required for Vundle!
  set rtp+=~/.vim/packs/neobundle.vim/
endif

call neobundle#rc(expand("~/.vim/packs"))
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles {{{
NeoBundle 'xolox/vim-misc'
NeoBundle 'cecutil'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'https://bitbucket.org/ns9tks/vim-l9'
NeoBundle 'genutils'
NeoBundle 'https://bitbucket.org/ZyX_I/frawor'
NeoBundle 'lh-vim-lib'
NeoBundle 'AnsiEsc.vim'
NeoBundle 'pydave/AsyncCommand'
NeoBundle 'godlygeek/csapprox'
"NeoBundle 'ColorSchemeMenuMaker'
NeoBundle 'Colorizer--Brabandt'
"NeoBundle 'CountJump'
NeoBundle 'CursorLineCurrentWindow'
" DeleteTrailingWhitespace {{{
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'ask'
NeoBundle 'DeleteTrailingWhitespace'
" }}}
NeoBundle 'EasyGrep'
NeoBundle 'lastpos.vim'
" zhaocai/GoldenView {{{
let g:goldenview__enable_default_mapping = 0
NeoBundle 'zhaocai/GoldenView.Vim'
"}}}
"NeoBundle 'IndGuide'
" IndentConsistencyCop / AutoCmds {{{
let g:indentconsistencycop_AutoRunCmd = 'IndentRangeConsistencyCop'
let g:indentconsistencycop_CheckAfterWrite = 1
let g:indentconsistencycop_CheckOnLoad = 0
let g:indentconsistencycop_CheckAfterWriteMaxLinesForImmediateCheck = 400
NeoBundle 'IndentConsistencyCop'
NeoBundle 'IndentConsistencyCopAutoCmds'
" }}}
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'mikewest/vimroom'
" ReplaceWithRegister {{{
nmap gr  <Plug>ReplaceMotion
nmap grr <Plug>ReplaceLine
xmap gr  <Plug>ReplaceVisual
NeoBundle 'ReplaceWithRegister'
" }}}
"NeoBundle 'Replay'
NeoBundle 'ShowTrailingWhitespace'
" xuhdev/SingleCompile {{{
let g:SingleCompile_asyncrunmode = 'python'
let g:SingleCompile_usequickfix = 1
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_showresultafterrun = 0
nnoremap <silent> ğsc :SingleCompile<CR>
nnoremap <silent> ĞSC :SingleCompileRun<CR>
NeoBundle 'xuhdev/SingleCompile'
" }}}
" wesleyche/SrcExpl {{{
let g:SrcExpl_refreshTime = 400
let g:SrcExpl_isUpdateTags = 0
NeoBundle 'wesleyche/SrcExpl'
" }}}
NeoBundle 'chrisbra/SudoEdit.vim'
NeoBundle 'VimSpy'
NeoBundle 'pafcu/Vimsplain'
" yonchu/accelerated-smooth-scroll {{{
let g:ac_smooth_scroll_no_default_key_mappings = 1
nmap <silent> <C-d> <Plug>(ac-smooth-scroll-c-d)
nmap <silent> <C-u> <Plug>(ac-smooth-scroll-c-u)
NeoBundle 'yonchu/accelerated-smooth-scroll'
" }}}
NeoBundle 'grep.vim'
" milesz/ack.vim {{{
if 0 " Use either ag or ack. Both are fast (if you used to run grep) but ag is faster.
  let g:ackprg = 'ag --nocolor --nogroup --column --smart-case --skip-vcs-ignores'
else
  let g:ackprg = 'ack -H --nocolor --nogroup --column'
endif
NeoBundle 'mileszs/ack.vim'
" }}}
" rking/Ag.vim {{{
let g:ag_apply_qmappings = 0
let g:ag_apply_lmappings = 0
let g:agprg = "ag --column --smart-case"
NeoBundle 'rking/ag.vim'
" }}}
" bling/Airline {{{
if !exists("g:airline_statusline_funcrefs")
  let g:airline_statusline_funcrefs = []
endif
let g:airline_enable_branch = 0
let g:airline#extensions#branch#enabled = 0
let g:airline_detect_whitespace=2 "icon only
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
  let g:airline_symbols.whitespace = 'Ξ'
endif
NeoBundle 'bling/vim-airline'
" }}}
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'camelcasemotion'
" rhysd/Clever-f {{{
" noremap <expr> _ clever_f#reset()
" let g:clever_f_across_no_line = 1
" NeoBundle 'rhysd/clever-f.vim'
" }}}
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
NeoBundle 'justinmk/vim-sneak'
" }}}
" sjl/Clam.vim {{{
nnoremap '! :Clam <Space>
xnoremap '! :ClamVisual <Space>
NeoBundle 'sjl/clam.vim'
" }}}
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'vis'
" DBExt {{{
let g:dbext_default_SQLITE_bin = 'sqlite3'
NeoBundle 'dbext.vim'
" }}}
" junegunn/EasyAlign {{{
xnoremap <silent> <Enter> :EasyAlign<CR>
NeoBundle 'junegunn/vim-easy-align'
" }}}
" GF-Ext {{{
NeoBundle 'gf-ext'
call gf_ext#add_handler('\.jpg$', "!firefox -new-window")
call gf_ext#add_handler('\.avi$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.flv$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.mp4$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.mov$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.mkv$', "!mplayer -really-quiet")
call gf_ext#add_handler('http://\S*$', "!firefox -new-window")
" }}}
"NeoBundle 'kana/vim-gf-user'
NeoBundle 'dpwright/vim-gf-ext'
"NeoBundle 'gist-vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Headlights'
" Indent-Guides {{{
let g:indent_guides_color_change_percent = 20
let g:indent_guides_enable_on_vim_startup = 0
autocmd VimEnter * IndentGuidesDisable
NeoBundle 'Indent-Guides'
" }}}
" AndrewRadev/Inline_Edit {{{
let g:inline_edit_autowrite=1
nnoremap <silent> <F2> :InlineEdit<CR>
inoremap <silent> <F2> <Esc>:InlineEdit<CR>
NeoBundle 'AndrewRadev/inline_edit.vim'
" }}}
"NeoBundle 'libview'
NeoBundle 'linediff.vim'
"NeoBundle 'locator'
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
NeoBundle 'Mark'
" }}}
"NeoBundle 't9md/vim-quickhl'
NeoBundle 'matchit.zip'
NeoBundle 'kana/vim-metarw'
" Multiselect {{{
let no_multiselect_maps = 1
NeoBundle 'multiselect'
" }}}
NeoBundle 'terryma/vim-multiple-cursors'
" OmniCppComplete {{{
let OmniCpp_MayCompleteDot   = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
let OmniCpp_SelectFirstItem  = 0
NeoBundle 'OmniCppComplete'
"}}}
NeoBundle 'javacomplete'
"NeoBundle 'nosami/Omnisharp'
NeoBundle 'marijnh/tern_for_vim'
" davidhalter/Jedi {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 1
let g:jedi#show_function_definition = 0
let g:jedi#autocompletion_command = "<M-_>"
NeoBundle 'davidhalter/jedi-vim'
"}}}
"NeoBundle 'klen/python-mode'
" mattn/Emmet {{{
let g:user_emmet_install_global = 0
au FileType html,css EmmetInstall
NeoBundle 'mattn/emmet-vim'
" }}}
" Shougo/NeoComplete {{{
let g:neosnippet#snippets_directory = $HOME . '/.vim/var/neocomplete_snippets'
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
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#temporary_dir  = $HOME . '/.vim/var/neocomplete_tmp'
let g:neocomplete#data_directory = $HOME . '/.vim/var/neocomplete_cache'
" inoremap <expr> <C-y> neocomplete#close_popup()
" inoremap <expr> <C-e> neocomplete#cancel_popup()
inoremap <expr> <CR> pumvisible() ? neocomplete#smart_close_popup() : "\<CR>"
inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <Backspace> neocomplete#smart_close_popup()."\<Backspace>"
inoremap <expr> <Left>   neocomplete#smart_close_popup()."\<Left>"
inoremap <expr> <Right>  neocomplete#smart_close_popup()."\<Right>"
inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : neocomplete#smart_close_popup()."\<Up>"
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : neocomplete#smart_close_popup()."\<Down>"
" inoremap <expr> <Space> pumvisible() ? neocomplete#smart_close_popup() : "\<Space>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neocomplete#source_completion_length = {
  \ 'buffer_complete'    : 1,
  \ 'eclim_complete'     : 1,
  \ 'snippets_complete'  : 2,
  \ 'keyword_complete'   : 2,
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
  \ }
"autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=tern#Complete     "javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=jedi#completions  "pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype java          setlocal omnifunc=javacomplete#Complete
autocmd Filetype c,cpp         setlocal omnifunc=omni#cpp#complete#Main
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c    = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp  = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.java = '\h\w*\%(\.\)'
let g:neocomplete#sources#omni#input_patterns.javascript = '\h\w*\|[^. \t]\.\w*'
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" let g:neocomplete#force_overwrite_completefunc = 1
" if !exists('g:neocomplete#omni_functions')
"   let g:neocomplete#omni_functions = {}
" endif
" let g:neocomplete#omni_functions.python = 'jedi#complete'
" let g:neocomplete#omni_functions.c      = 'omni#cpp#complete#Main'
NeoBundle 'Shougo/neocomplete.vim'
"}}}
" Shougo/NeoSnippet {{{
imap <expr> <Tab> neosnippet#expandable_or_jumpable() ?
                  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<Plug>SuperTabForward"
smap <expr> <Tab> neosnippet#expandable_or_jumpable() ?
                  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
NeoBundle 'Shougo/neosnippet.vim'
"}}}
" NetRW {{{
let g:tar_nomax = 1
let g:zip_nomax = 1
let g:netrw_sort_sequence="[\/]$,\<core\%(\.\d\+\)\=\>,*,\.pyc$,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$"
let g:netrw_use_noswf = 0
let g:netrw_keepdir = 0
let g:netrw_home = $HOME . '/.vim/var'
let g:netrw_liststyle = 0
let g:netrw_banner = 0
"let g:netrw_browsex_viewer = 'gnome-open'
NeoBundle 'netrw.vim'
"}}}
" Notes {{{
let g:notesRoot = expand('$HOME/.vim/var/notes')
let g:notes_directories = [expand('$HOME/.vim/var/notes')]
NeoBundle 'Notes'
"}}}
NeoBundle 'derekwyatt/vim-protodef'
"NeoBundle 'pyclewn'
"NeoBundle 'quilt'
"NeoBundle 'relops'
"NeoBundle 'replay'
"NeoBundle 'resizewin'
NeoBundle 'xolox/vim-session'
" yssl/QFEnter {{{
let g:qfenter_open_map  = ['<CR>', '<2-LeftMouse>']
let g:qfenter_vopen_map = ['<C-V>']
let g:qfenter_hopen_map = ['<C-H>']
let g:qfenter_topen_map = ['<C-T>', 'T']
NeoBundle 'yssl/QFEnter'
" }}}
NeoBundle 'kshenoy/vim-signature'
" mhinz/Signify {{{
let g:signify_sign_overwrite = 0
let g:signify_line_highlight = 0
let g:signify_vcs_list = [ 'git', 'svn' ]
NeoBundle 'mhinz/vim-signify'
" }}}
NeoBundle 'sjl/vitality.vim'
NeoBundle 'UnconditionalPaste'
" Smartput & sickill/Pasta {{{
" smartput's mappings about p/P are deleted in favour of vim-pasta.
" vim-pasta handles p/P while smartput handles gp/gP. Fair share.
" Also have non-smart mundane paste's just in case
let g:pasta_disabled_filetypes = ["coffee", "markdown"]
let g:pasta_enabled_filetypes = ['actionscript', 'c', 'cpp', 'javascript', 'python', 'sh', 'vim']
let g:smartput = 1
nnoremap ğp p
nnoremap ĞP P
NeoBundle 'Smartput'
NeoBundle 'sickill/vim-pasta'
" }}}
" mjbrownie/SwapIt & tpope/SpeedDating {{{
let g:speeddating_no_mappings = 1
" Use SwapIt to interface C-X/A rather than speeddating. Speeddating is
" called from SwapIt as a fallback method.
nmap <Plug>SwapItFallbackIncrement <Plug>SpeedDatingUp
nmap <Plug>SwapItFallbackDecrement <Plug>SpeedDatingDown
NeoBundle 'mjbrownie/swapit'
NeoBundle 'tpope/vim-speeddating'
" }}}
nnoremap <silent> - :Switch<CR>
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'sk1418/Join'
NeoBundle 'SQLUtilities'
" mhinz/Startify {{{
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
            \ '   __      ___            ______ _',
            \ '   \ \    / (_)           |____  |',
            \ '    \ \  / / _ _ __ ___       / /',
            \ '     \ \/ / | | ''_ ` _ \     / /',
            \ '      \  /  | | | | | | |   / /',
            \ '       \/   |_|_| |_| |_|  /_/',
            \ '',
            \ '',
            \ ]
NeoBundle 'mhinz/vim-startify'
"}}}
" SuperTab {{{
let g:SuperTabMappingForward = '<C-Space>'
let g:SuperTabMappingBackward = '<S-C-Space>'
let g:SuperTabDefaultCompletionType = "context" "<C-X><C-O>
let g:SuperTabLongestEnhanced = 0
let g:SuperTabCrMapping = 0
" Use old version
"NeoBundle 'SuperTab'
"}}}
" jiangmiao/Auto-Pairs {{{
let g:AutoPairsMapSpace = 0
let g:AutoPairsMapCR = 0
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '_-<M-b>'
NeoBundle 'jiangmiao/auto-pairs'
"}}}
NeoBundle 'tpope/vim-surround'
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
NeoBundle 'scrooloose/syntastic'
"}}}
NeoBundle 'godlygeek/tabular'
" majutsushi/TagBar {{{
nnoremap <silent> TT :TagbarOpenAutoClose<CR>
NeoBundle 'majutsushi/tagbar'
"}}}
NeoBundle 'https://bitbucket.org/abudden/taghighlight'
" tomtom/TComment {{{
let g:tcommentMapLeader1=""
let g:tcommentMapLeader2=""
nnoremap <silent> __ :TComment<CR>
xnoremap <silent> __ :TCommentMaybeInline<CR>
NeoBundle 'tomtom/tcomment_vim'
"}}}
" TextObj's {{{
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-datetime'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'vim-textobj-quoted'
NeoBundle 'coderifous/textobj-word-column.vim'
NeoBundle 'killphi/vim-textobj-signify-hunk'
NeoBundle 'mattn/vim-textobj-url'
NeoBundle 'bps/vim-textobj-python'
NeoBundle 'thinca/vim-textobj-function-javascript'
"NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'austintaylor/vim-indentobject'
let g:textobj_comment_no_default_key_mappings = 1
xmap ax <Plug>(textobj-comment-a)
omap ax <Plug>(textobj-comment-a)
xmap ix <Plug>(textobj-comment-i)
omap ix <Plug>(textobj-comment-i)
NeoBundle 'glts/vim-textobj-comment'
"NeoBundle 'kana/vim-textobj-indent'
"NeoBundle 'textobj-line-vim-scripts'
" }}}
" tomtom/TinyKeyMap {{{
NeoBundle 'tomtom/tinykeymap_vim'
call tinykeymap#EnterMap('changelocs', 'ğ,', {'name': 'Change locations'})
call tinykeymap#Map('changelocs', ',', 'norm! g,')
call tinykeymap#Map('changelocs', ';', 'norm! g;')
let g:tinykeymap#map#windows#map = "gw"
" }}}
NeoBundle 'tpope/vim-unimpaired'
" t9md/TextManip {{{
xmap <Up>    <Plug>(textmanip-move-up)
xmap <Down>  <Plug>(textmanip-move-down)
xmap <Left>  <Plug>(textmanip-move-left)
xmap <Right> <Plug>(textmanip-move-right)
xmap D       <Plug>(textmanip-duplicate-down)
xmap DD      <Plug>(textmanip-duplicate-up)
NeoBundle 't9md/vim-textmanip'
" }}}
" kien/CtrlP {{{
let g:ctrlp_map = '-<c-p>'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_match_window_bottom = 0
nnoremap <silent> ğt :CtrlPBufTag<CR>
NeoBundle 'kien/ctrlp.vim'
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
NeoBundle 'Shougo/unite.vim'
nnoremap <silent> ğee    :UniteWithBufferDir -start-insert file<CR>
nnoremap <silent> ğe     :Unite -start-insert file<CR>
nnoremap <silent> <C-p>  :Unite -start-insert source<CR>
nnoremap <silent> <C-p>p :Unite -start-insert register history/yank<CR>
nnoremap <silent> ğb     :Unite -start-insert -auto-preview bookmark<CR>
nnoremap <silent> ĞB     :UniteBookmarkAdd <CR>
" -quick-match
nnoremap <silent> <C-B>  :Unite -start-insert buffer_tab file_rec/async<CR>
nnoremap <silent> ĞS     :Unite grep:.<CR>
nnoremap <silent> MRU    :Unite -no-split -start-insert file_mru directory_mru<CR>
nnoremap <silent> <C-->  :Unite -no-split vimgrep:%:\\CTODO\:\\|FIXME\:\\|NOTE\:<CR>
"}}}
NeoBundle 'unite-locate'
NeoBundle 'tsukkee/unite-tag'
"NeoBundle 'unite-colorscheme-1.3'
"NeoBundle 'unite-grep-Sixeight'
"NeoBundle 'tsukkee/unite-help'
"NeoBundle 'thinca/vim-unite-history'
"NeoBundle 'h1mesuke/unite-outline'
"NeoBundle 'hakobe/unite-script'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows': 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac'    : 'make -f make_mac.mak',
  \     'unix'   : 'make -f make_unix.mak',
  \    },
  \ }
" Shougo/VimShell {{{
nnoremap <silent> ğsh  :VimShellPop<CR>
nnoremap <silent> ğp2  :VimShellInteractive ipython2<CR>
nnoremap <silent> ğp3  :VimShellInteractive python3<CR>
nnoremap <silent> ğp12 :VimShellInteractive python2<CR>
NeoBundle 'Shougo/vimshell'
" }}}
"NeoBundle 'utl'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'https://bitbucket.org/ZyX_I/aurum'
" VCSCommand {{{
let VCSCommandMapPrefix = "<LocalLeader>c"
let VCSCommandVCSTypePreference = 'git'
"let VCSCommandSVNDiffOpt = "-ignore-all-space"
NeoBundle 'vcscommand.vim'
" }}}
"NeoBundle 'viewdoc'
NeoBundle 'thinca/vim-ref'
"NeoBundle 'ManPageView'
"NeoBundle 'viki'
NeoBundle 'dbakker/vim-lint'
NeoBundle 'Vimball'
NeoBundle 'VisIncr'
NeoBundle 'tpope/vim-repeat'
"NeoBundle 'visualrepeat'
NeoBundle 'epeli/slimux'
"NeoBundle 'vimux'
NeoBundle 'WebAPI.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'tpope/vim-git'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
" cpp-vim for better @Spell @NoSpell support
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'ujihisa/ft-cmake'
" TxtBrowser {{{
let TxtBrowser_Dict_Url = 'http://www.google.com.tr/dictionary?aq=f&langpair=en|tr-TR&q=text&hl=tr-TR'
let TxtBrowser_Dict_Url = 'http://www.definitions.net/definition/text'
let Txtbrowser_Search_Engine = 'http://www.google.com.tr/search?q=text'
NeoBundle 'TxtBrowser'
" }}}
NeoBundle 'junkblocker/patchreview-vim'
" CoremoSearch {{{
let g:CoremoSearch_setDefaultMap = 0
nnoremap <silent> X  :CoremoSearchAdd<CR>
xnoremap <silent> X  :CoremoSearchAddV<CR>
nnoremap <silent> ğX :CoremoSearchRemove<CR>
xnoremap <silent> ğX :CoremoSearchRemoveV<CR>
NeoBundle 'CoremoSearch'
" }}}
" mbbill/FencView {{{
let g:autofenc_enable = 1
let g:fencview_autodetect = 0
NeoBundle 'mbbill/fencview'
" }}}
" edkolev/TmuxLine.vim {{{
let g:tmuxline_powerline_separators=0
let g:tmuxline_preset='full'
NeoBundle 'edkolev/tmuxline.vim'
" }}}
" Load Local Bundles {{{
NeoBundleLocal ~/.vim/bundle
"autocmd BufWritePost ~/.vim/** Helptags
"call ipi#inspect()
"}}}
"luochen1990/rainbow {{{
"let g:rainbow_active=1
"NeoBundle 'luochen1990/rainbow'
"}}}
"let g:languagetool_jar='/usr/share/java/languagetool/languagetool-commandline.jar'
"NeoBundle 'dpelle/vim-LanguageTool'
"NeoBundle 'tdd-dubgeiser-vim'
"NeoBundle 'chrisbra/unicode.vim'
"NeoBundle 'toggle_unit_tests'
"NeoBundle 'LimpidTech/vimpy'
"NeoBundle 'MarcWeber/vim-addon-other'
"NeoBundle 'editorconfig-vim'
"supasorn/EasyMotion {{{
"let g:EasyMotion_leader_key = '<Tab><Tab>'
"nnoremap <silent> -- H:call EasyMotion#WB(0,0)<CR>
"NeoBundle 'supasorn/vim-easymotion'
"NeoBundle 'haya14busa/vim-easymotion'
"}}}
"tomtom/quickfixsigns_vim {{{
"let loaded_quickfixsigns = 1
"let g:quickfixsigns_classes = ['qfl', 'loc', 'vcsdiff', 'marks'] "'breakpoints', 'rel', 'cursor'
"au FileType conque_term let b:quickfixsigns_ignore = ['rel', 'loc']
"NeoBundle 'tomtom/quickfixsigns_vim'
"}}}
"terryma/Expand-Region {{{
"nmap + <Plug>(expand_region_expand)
"xmap + <Plug>(expand_region_expand)
"xmap - <Plug>(expand_region_shrink)
"nmap - <Plug>(expand_region_shrink)
"NeoBundle 'terryma/vim-expand-region'
"}}}
"NeoBundle 'https://bitbucket.org/madevgeny/yate.git'
"NeoBundle 'code_upstairs'
"kana/Arpeggio {{{
"NeoBundle 'kana/vim-arpeggio'
"call arpeggio#load() "Arpeggio nmap wh/l/j/k <C-w>h/l/j/k
"Arpeggio nnoremap <silent> <Space><Tab> :update<CR>
"}}}
"Conque-Shell {{{
"let g:ConqueTerm_ReadUnfocused = 0
"let g:ConqueTerm_CloseOnEnd = 1
"let g:ConqueTerm_CWInsert = 0
"let g:ConqueTerm_ToggleKey   = '<C-F8>'
"let g:ConqueTerm_SendVisKey  = '<C-F9>'
"let g:ConqueTerm_SendFileKey = '<C-F10>'
"let g:ConqueTerm_ExecFileKey = '<C-F11>'
"nnoremap <silent> ĞSH :ConqueTermSplit bash<CR>
"NeoBundle 'Conque-Shell'
"}}}
"NeoBundle 'Vimpy-monokrome'
"NeoBundle 'WhereFrom'
"NeoBundle 'WinWalker'
"NeoBundle 'ZoomWin'
"NeoBundle 'explainpat'
"NeoBundle 'davidoc/taskpaper.vim'
"NeoBundle 'lfilho/cosco.vim'
"NeoBundle 'bigfish/vim-js-context-coloring'
"NeoBundle 'jlanzarotta/bufexplorer'
"NeoBundle 'filesearch'
"NeoBundle 'filtering2'
"NeoBundle 'fortune-vimtips'
"NeoBundle 'derekwyatt/vim-fswitch'
"NeoBundle 'chrisbra/changesPlugin'
"NeoBundle 'jmcantrell/diffchanges.vim'
"NeoBundle 'golden-ratio'
"NeoBundle 'christoomey/vim-tmux-navigator'
"NeoBundle 'nelstrom/vim-qargs'
"}}}

filetype plugin indent on " Required for Vundle!
" }}}

" global configuration {{{
set nocompatible
filetype plugin on
filetype indent on
syntax on
set regexpengine=1
let mapleader = "ü"
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
set number "relativenumber
" highlight current line
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
" sleuth, yaifa): sleuth now almost never makes use of these settings.
set tabstop=4 shiftwidth=4 expandtab
set incsearch
" clear tags n path; use some other technique to decide
set tags=
set path=.
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc
set wildignore+=*.pyo,*.pyd,*.class,*.lock
set wildignore+=.git,.svn,.hg
" can leave a buffer without saving
set hidden
" backup and temp dirs
set backup
set undofile
set undodir=~/.vim/var/backup
set backupdir=~/.vim/var/backup
set directory=~/.vim/var/tmp
set updatetime=5000
"make a little max-delay between keypad *touches*
set timeout timeoutlen=440 ttimeout ttimeoutlen=50
" keep cursor always at the middle
" set scrolloff=9999
" show tabline every now and then
set showtabline=2
set cursorline nocursorcolumn
set wrap linebreak
set showmode
if has('multi_byte')
  let &showbreak = '↳ '
else
  let &showbreak = '> '
endif
set spell spelllang=en

au FileType text setlocal wrap linebreak
au FileType qf,tagselect,startify,diff setlocal nospell
au InsertEnter * set nocursorline
au InsertLeave * set cursorline
au TabLeave    * stopinsert
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/','%','g'), '\','%','g'),  ':','','g').'~'
" delete swap file if the swapped file is 'nomodified'
au SwapExists  * if !&mod | let v:swapchoice = 'd' | endif
au VimLeave    * if v:dying | wall | endif

" Colorscheme Selection
"*************** {{{
" hemisu bandit lucius solarized badwolf asu1dark burnttoast256 rastafari molokai
" oh-la-la ubloh hickop neverness django wombat256 fnaqevan harlequin fruity
" candycode southernlight lucid kolor kingtop getafe phonzia blackboard
" last256 aldmeris hybrid darknight256 luna inkpot gardener sienna freya
" Tomorrow-Night-Eighties moria felipec radicalgoodspeed
set background=dark
let g:moria_style="black"
let g:sienna_style="dark"
colorscheme harlequin
" if !has("gui_running")
"   au ColorScheme * hi CursorLine term=none cterm=none ctermbg=001510
" endif
"*************** }}}
if has("gui")
  set guioptions-=T
  set guioptions-=r
  set guioptions+=c " Use console dialogs where possible"
  "set guioptions-=m
endif
if has("gui_running")
  winsize 170 46
endif
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
" swap comma (,) and semicolon (;) because my keyboard is comma-privileged
" call s:SwapKeys(",", ";")
noremap g; g,
noremap g, g;
" Handy, go to last edit. It is frequently done twice.
nnoremap g,, g,g,
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
" thing is reexecuted from history before.
nnoremap <silent> <F3> :<Up><CR>
vnoremap <silent> <F3> :<Up><CR>
" map arrow keys to move whole window up/down
"   <C-D>/<C-U>, Lzz/Hzz or <C-F>/<C-B> may also be used for Up/Down
nmap <Up>   5<C-Y>
nmap <Down> 5<C-E>
" clearing @/ is really useful: last search's highlight distracts me more than rarely
nnoremap <silent> \ :let @/=""\|echo "Cleared Search Pattern"<CR>
nnoremap / /\V
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
nnoremap <silent> <Tab><Tab>l :tabnext<CR>
nnoremap <silent> <Tab><Tab>h :tabprev<CR>
" }}}
" full redraw
nnoremap <silent> <C-l> :let @/=""\|redraw!\|e!\|set nu\|set cul<CR>
nnoremap <silent> HH  :hide<CR>
nnoremap <silent> ĞCD :cd %:p:h<CR>
nnoremap <silent> ğcd :pwd<CR>
nnoremap <silent> ğrc :sp .lvimrc<CR>
nnoremap <silent> ĞĞE :Explore<CR>
nnoremap <silent> ĞE  :call OpenExplore()<CR>
nnoremap <silent> ĞRC :tabe ~/.vim/<CR>
nnoremap <silent> ĞT  :sp .<CR><C-W>T
" de facto visual block indent mappings
vnoremap < <gv
xnoremap > >gv
nnoremap ğ> >i}
nnoremap ğ< <i}
nnoremap ĞD di}
" easier %s/%g
nnoremap ğs :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
nnoremap ğg :%g/<C-r><C-w>/
" vnoremap <c-j> @='jojo'<cr>
" vnoremap <expr> <c-j> 'jo'.v:count1.'jo'
" vnoremap <c-k> @='koko'<cr>
" vnoremap <expr> <c-k> 'ko'.v:count1.'ko'
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
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
" }}}

"autocmd FileType qf nnoremap <silent> <buffer> o <CR><C-W>p
autocmd FileType help setlocal nonumber

nnoremap <silent> <F9> :QFix<CR>
nnoremap <silent> <F10> :lclose\|cclose<CR>
nnoremap <silent> <F10><F9> :call setqflist([])\|call setloclist(0, [])\|call UpdateSigns_()<CR>
nnoremap <silent> <Tab><Space> :update<CR>
nnoremap <silent> <Space><Tab> :update<CR>

" Maps for known buffer/file types & default behaviours {{{
inoremap <expr><silent> jk        pumvisible() ? neocomplete#close_popup()."\<Esc>" : "\<Esc>"
inoremap <expr><silent> kj        pumvisible() ? neocomplete#close_popup()."\<Esc>" : "\<Esc>"
inoremap <expr><silent> jk<Space> pumvisible() ? neocomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
inoremap <expr><silent> j<Space>k pumvisible() ? neocomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
inoremap <expr><silent> kj<Space> pumvisible() ? neocomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
inoremap <expr><silent> j<Space>k pumvisible() ? neocomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
" Adjust maps according to language: some languages are semicolon driven.
augroup semicolon_langs
  au!
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> jk        YieldSemicolonIfAppropriate()."\<Esc>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> kj        YieldSemicolonIfAppropriate()."\<Esc>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> jk<Space> YieldSemicolonIfAppropriate()."\<Esc>:update\<CR>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> j<Space>k YieldSemicolonIfAppropriate()."\<Esc>:update\<CR>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> kj<Space> YieldSemicolonIfAppropriate()."\<Esc>:update\<CR>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> k<Space>j YieldSemicolonIfAppropriate()."\<Esc>:update\<CR>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr><silent><buffer> <CR> pumvisible() ? neocomplete#close_popup() : IsSemicolonAppropriateHere() ? ";\<CR>" : "\<CR>"
augroup END
" }}}

augroup preprocessor_langs
  au!
  au FileType c,cpp vnoremap out "zdmzO#if 0<ESC>"zp'zi#endif<CR><ESC>k
augroup END

" personal plugin maps {{{
augroup tag_langs
  au!
  " Adjust maps according to tags status: some filetypes are tags-driven.
  " Other Ideas: TSelect.vim, TS (exPlugin), Unite
  " <CR>        --:> :TS <C-R><C-W><CR>
  " <Backspace> --:> :PopTagStack<CR>
  " <CR>        --:> :UniteWithCursorWord -immediately tag<CR>
  au FileType c,cpp,java,javascript,python,actionscript,sh nnoremap <silent> <buffer> <CR> :Tselect <C-R><C-W><CR>
  au FileType c,cpp,java,javascript,python,actionscript,sh nnoremap <silent> <buffer> <Backspace> :if !QFixCloseAndCheck()<Bar>exec "normal \<lt>C-T>"<Bar>endif<CR>
augroup END
nnoremap <silent> <Backspace> :call QFixCloseAndCheck()<CR>
au FileType tar,man,conque_term       nnoremap <silent> <buffer> <Backspace> :bwipeout!<CR>
au FileType tagbar,qf,help            nnoremap <silent> <buffer> <Backspace> :q<CR>
au FileType netrw                     nmap     <silent> <buffer> <Backspace> -
au FileType vundle,gitcommit,calendar nmap     <silent> <buffer> <Backspace> q
augroup VCSCommand
  au VCSCommand User VCSBufferCreated setlocal bufhidden=delete
  au VCSCommand User VCSBufferCreated nnoremap <silent> <buffer> <Backspace> :q!<CR>
augroup END

onoremap <silent> an :<C-U>call <SID>NextTextObject('a', 'f')<CR>
xnoremap <silent> an :<C-U>call <SID>NextTextObject('a', 'f')<CR>
onoremap <silent> in :<C-U>call <SID>NextTextObject('i', 'f')<CR>
xnoremap <silent> in :<C-U>call <SID>NextTextObject('i', 'f')<CR>
onoremap <silent> al :<C-U>call <SID>NextTextObject('a', 'F')<CR>
xnoremap <silent> al :<C-U>call <SID>NextTextObject('a', 'F')<CR>
onoremap <silent> il :<C-U>call <SID>NextTextObject('i', 'F')<CR>
xnoremap <silent> il :<C-U>call <SID>NextTextObject('i', 'F')<CR>
" Cycle through UPPERCASE, lowercase, and Titlecase of the selection
xnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv
inoremap <expr> <C-K> BDG_GetDigraph()
nnoremap <silent> <F5> :call Make_Tmux_Build(g:tmuxmake_targets)<CR>
inoremap <silent> <F5> <Esc>:call Make_Tmux_Build(g:tmuxmake_targets)<CR>
nnoremap <silent> ğa :A<CR>
nnoremap <silent> ğ1 :Sscratch<CR>
"nnoremap <silent> <space><space><space> :ResizeWinMaxHV<CR>
nnoremap <silent> ğğu :Utl<CR>
xnoremap <silent> ğğu :Utl<CR>
autocmd FileType vim vnoremap <silent> <buffer> <F2> :Source<CR>
nnoremap <silent> ĞN :redir @n<cr>:call DecAndHex(expand("<cWORD>"))<CR>:redir END<cr>
nnoremap <silent> ĞUU :Underline<CR>
nnoremap <silent> ğw :call WinWalkerMenu()<CR>
" let g:exTS_backto_editbuf = 0
" let g:exTS_close_when_selected = 1
" nnoremap <silent> ĞTS :ExtsSelectToggle<CR>
" nnoremap <silent> ĞTT :ExtsStackToggle<CR>
nnoremap <silent> TDD :call Tdd_RunTest()<CR>
nmap <silent> <Tab><Space><Space> :call ToggleIndGuides_RC()<CR>
nnoremap <silent> GL :call EchoLocationPath()<CR>
nnoremap <silent> [d :call ShowBlockName('[d')<CR>
nnoremap <silent> [i :call ShowBlockName('[i')<CR>
" NOTUSED mappings in order to prevent the default maps load.
nmap <unique> NOTUSED<M-Insert>      <Plug>MarkersMark
xmap <unique> NOTUSED<M-Insert>      <Plug>MarkersMark
imap <unique> NOTUSED<M-Insert>      <Plug>MarkersMark
imap <unique> NOTUSED<M-Del>         <Plug>MarkersJumpF
map  <unique> NOTUSED<M-Del>         <Plug>MarkersJumpF
imap <unique> NOTUSED<M-S-Del>       <Plug>MarkersJumpB
map  <unique> NOTUSED<M-S-Del>       <Plug>MarkersJumpB
map  <unique> NOTNUSED<LocalLeader>p <Plug>JavagetsetInsertGetterSetter
map  <unique> NOTNUSED<LocalLeader>g <Plug>JavagetsetInsertGetterOnly
map  <unique> NOTNUSED<LocalLeader>s <Plug>JavagetsetInsertSetterOnly
map  <unique> NOTNUSED<LocalLeader>b <Plug>JavagetsetInsertBothGetterSetter
nmap <unique> NOTUSEDğa       <Plug>ToggleAutoCloseMappings
imap <unique> NOTUSED<C-S>           <Plug>Isurround
nmap <unique> NOTUSEDğst      <plug>SmartputToggle
nmap <unique> NOTUSEDğsh      <Plug>DBHistory
" nmap <silent> <C-z> <Plug>QAnotherWin
" nmap ğt :Shell make test<CR><CR>
" nnoremap <unique> <silent> ğğğtasaasd :call MakeGreen()<CR>
" nmap <silent> <unique> ğb <Plug>SelectBuf
" }}}

" plugin configuration {{{
let g:rainbow_active = 1
let g:rainbow_operators = 1
let g:tmuxmake_targets = ""
let g:buffergator_suppress_keymaps = 1
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
" Aliases {{{
autocmd VimEnter * Alias te tabedit
autocmd VimEnter * Alias tee tabedit<Space>~/
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
autocmd VimEnter * Alias ag  LAck!
autocmd VimEnter * Alias agg LAckAdd!
autocmd VimEnter * Alias ac  Ag!
autocmd VimEnter * Alias Ac  Ag!
autocmd VimEnter * Alias acc AgAdd!
autocmd VimEnter * Alias Acc AgAdd!
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
autocmd VimEnter * Alias vcn call<Space>Svndiff("next")
autocmd VimEnter * Alias vcp call<Space>Svndiff("prev")
autocmd VimEnter * Alias vcc call<Space>Svndiff("clear")
autocmd VimEnter * Alias sw SudoWrite
autocmd VimEnter * Alias sr SudoRead
autocmd VimEnter * Alias con VimShellPop
autocmd VimEnter * Alias ref Ref
autocmd VimEnter * Alias up UpdateTypesFileOnly
autocmd VimEnter * Alias ss SaveSession!<Space>default
" }}}
augroup no_sticky_buffers
  au!
  au BufReadPost fugitive://* setlocal bufhidden=delete
augroup END
" EasyTags
let g:loaded_easytags = "disable_"
let g:easytags_file = "~/.vim/easytags_TAGS"
let g:easytags_always_enabled = 1
let g:easytags_updatetime_min = 2000
autocmd FileType conque_term let b:easytags_auto_highlight = 0
autocmd FileType conque_term let b:easytags_on_cursorhold = 0
autocmd FileType conque_term let b:easytags_auto_update = 0
let g:easytags_updatetime_autodisable = 1
"------------------------------------------
let g:ctags_path = '/usr/bin/ctags'
let g:ctags_args = '-I __declspec+'
let g:ctags_title = 1
let g:ctags_statusline = 1
let generate_tags = 1
"------------------------------------------
let g:loaded_fortune_vimtips = 1
let g:fortune_vimtips_file = "wisdom"
let g:rainbow_activate=1
let g:locator_disable_mappings = 1
let g:valgrind_arguments='--leak-check=yes --num-callers=5000'
let g:yankring_history_dir = expand('$HOME/.vim')
let g:local_vimrc=".lvimrc"
let g:Tdd_makeprg='make'
let Grep_Skip_Files = 'tags *~ .lvimrc *.pyc *.min.js types_?*.taghl'
let Grep_Skip_Dirs = 'RCS CVS SCCS .git .vimprj .svn'
let g:DirDiffExcludes = "CVS,*.class,*.exe,*.Plo,*.o,*.swp,*.swo,*.la,*.lai,*.so"
let g:enableUnicodeCompletion = 0
let g:protodefprotogetter=expand("$HOME/.vim/bundle/protodef-vim-derekwyatt/pullproto.pl")
let g:no_tagselect_maps = 1
let utl_opt_verbose=0
let g:hybrid_use_Xresources = 0
let g:github_user = "umitkablan"
" fonts and headlights plugin causing problems
let g:loaded_fonts=1
let g:loaded_headlights = 1
let g:loaded_colorsupport = "disable_"
let g:loaded_StatusLineHighlight = "disable_"
" }}}

" FUNCTIONS / COMMANDS {{{
function! RebuildAllDependentCTags()
  let l:tags = &tags
  for t in split(l:tags, ",")
    let l:d = shellescape(fnamemodify(t, ':p:h'))
    if isdirectory(fnamemodify(t, ':p:h')) != 0
      echom l:d
      call system("cd " . l:d . "; ctags -R .")
    else
      echohl ErrorMsg
      echom "Directory " . l:d . " is non existent!"
      echohl None
    endif
  endfor
  echom "DONE"
endfunction
command! -nargs=0 RebuildAllCTags call RebuildAllDependentCTags()

" jump to nearest line ending with v:count
" thus if you are on line 20234500 and you type 80 you'll jump to 20234480
" credits to ujihisa who had this idea
" problem: you cannot jump to 05, becaues 5 will be passed via v:count
"
" https://github.com/MarcWeber/vim-addon-other/blob/master/autoload/vim_addon_other.vim
function! SmartGotoLine_WithoutInitials(visual_select)
    let c = v:count
    let half = ('1'.repeat('0',len(c))) / 2
    let lnum = line('.')[:-len(c)-1].c
    if lnum > half + line('.')
      let lnum -= 2* half
    endif
    if a:visual_select
      exec 'normal! V'.lnum.'G'
    else
      exec 'normal '.lnum.'G'
    endif
endfunction
nnoremap ĞG :<C-U>call SmartGotoLine_WithoutInitials(0)<CR>
onoremap ĞG :<C-U>call SmartGotoLine_WithoutInitials(1)<CR>
vnoremap ĞG :<C-U>call SmartGotoLine_WithoutInitials(1)<CR>

function s:SetSearch(sstr)
     let @/=@/
     return a:sstr
endfunction
" noremap <expr> n <SID>SetSearch('n')
" noremap <expr> N <SID>SetSearch('N')

func! FlashLocn()
   hi CursorColumn guibg=yellow
   hi CursorLine guibg=yellow
   set cul cuc
   redraw!
   "sleep 1m
   set nocul nocuc
endfunction
" nmap <C-H> :set wrap! \| call FlashLocn() \| set wrap? <CR>

function! ApplyPatch()
  let l:tmpfilename = tempname() . ".patch"
  let l:s = @"
  let l:ll = split(l:s, "\n")
  call writefile(l:ll, l:tmpfilename, "b")
  " using system() does not rewash the screen
  let l:res = system("patch -p1 < " .  shellescape(l:tmpfilename))
  call system("rm -f " . shellescape(l:tmpfilename))
  echom l:res
endfunction

function! Make_Tmux_Build(targets)
  update
  if a:targets == ""
    make %
  else
    exec "SlimuxShellRun m " . a:targets
  endif
endfunction
command! -nargs=0 MakeTmuxBuild :call Make_Tmux_Build(g:tmuxmake_targets)

function! MapPumInsert(key, insertSpaceAfter)
  if !a:insertSpaceAfter
    exec "imap <expr> " . a:key . " pumvisible() ? \"\<C-y>".a:key."\" : \"".a:key."\""
  else
    exec "imap <expr> " . a:key . " pumvisible() ? neocomplete#close_popup()".a:key."\<Space>\" : \"".a:key."\""
  endif
endfunction
" call MapPumInsert(",", 1)

function! SearchForwLastSearch()
  if @/ == ""
    return "/\<Up>\<CR>"
  else
    return "/\<CR>"
  endif
endfunction
" nnoremap <silent> <expr> gn '' . SearchForwLastSearch() . ''

function! IsHereAComment()
  let syn = synIDtrans(synID(line("."), col(".")-1, 1))
  return syn == hlID("Comment")
endfunction

function! IsSemicolonAppropriateHere()
  " TODO:
  " Write a regex which will execute faster
  " Think about plugin extraction of the idea
  let cline = getline(".")
  let lastchar  = cline[col("$")-2]
  let firstchar = cline[0]
  if col("$") == col(".") && lastchar != ";" && lastchar != "{" && lastchar != "}" && lastchar != "," && lastchar != ":" && firstchar != "#" && cline !~ '^\s*$' && lastchar != "\\" && !IsHereAComment()
    return 1
  endif
  return 0
endfunction

function! YieldSemicolonIfAppropriate()
  let l:ret = ""
  if pumvisible()
    let l:ret = neocomplete#smart_close_popup()
  endif
  if IsSemicolonAppropriateHere()
    let l:ret = l:ret . ";"
  endif
  return l:ret
endfunction

function! IsTagsActiveFileType(ft)
  if a:ft == ""
    return 0
  endif
  return stridx("c,cpp,java,javascript,python,actionscript,sh", a:ft) >= 0
endfunction

"wrapper on signs' update: wraps quickfixsigns and DynamicSigns
function! UpdateSigns_()
  if exists('g:loaded_quickfixsigns') && g:loaded_quickfixsigns == 0
    call QuickfixsignsUpdate()
  endif
  if exists('g:loaded_Signs') && g:loaded_Signs == 0
    UpdateSigns
  endif
endfunction

" save/load quickfix list {{{
function SaveQuickFixList(fname)
  let list = getqflist()
  for i in range(len(list))
    if has_key(list[i], 'bufnr')
      let list[i].filename = fnamemodify(bufname(list[i].bufnr), ':p')
      unlet list[i].bufnr
    endif
  endfor
  let string = string(list)
  let lines = split(string, "\n")
  call writefile(lines, a:fname)
endfunction

function LoadQuickFixList(fname)
  let lines = readfile(a:fname)
  let string = join(lines, "\n")
  call setqflist(eval(string))
endfunction
" }}}

" used to track the quickfix window: open/closed {{{
augroup QFixToggle
  autocmd!
  autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
  autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

function! QFixCloseAndCheck()
  if exists("g:qfix_win")
    cclose
    unlet! g:qfix_win
    return 1
  else
    if !IsTagsActiveFileType(&ft)
      execute "q"
    endif
  endif
  return 0
endfunction

function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet! g:qfix_win
  else
    copen 15
    let g:qfix_win = bufnr("$")
  endif
endfunction

" Use :QFix! if you want to keep the qf window open, out of toggling
command -bang -nargs=? QFix call QFixToggle(<bang>0)
" }}}

function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}

function! OpenExplore()
  if bufname(bufnr("%")) ==? ""
    silent! Explore
  else
    silent! Sexplore
  endif
endfunction

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

function! s:SwapKeys(a, b)
  normal! "exec noremap  " . a:a . " " . a:b
  normal! "exec noremap  " . a:b . " " . a:a
  normal! "exec onoremap " . a:a . " " . a:b
  normal! "exec onoremap " . a:b . " " . a:a
  normal! "exec xnoremap " . a:a . " " . a:b
  normal! "exec xnoremap " . a:b . " " . a:a
endfunction

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

let s:indentation_guides_enabled = 0
function! ToggleIndGuides_RC()
  if s:indentation_guides_enabled == 1
    " IndGuide!
    IndentGuidesDisable
    let s:indentation_guides_enabled = 0
  else
    " IndGuide
    IndentGuidesEnable
    let s:indentation_guides_enabled = 1
  endif
endfunction

" Trans to/from Turkish dotted char form {{{
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
" }}}

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
function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  elseif c ==# "q"
      let c = "\""
  endif
  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
" }}}

" Source a range of visually selected vim
function! SourceRange() range
  let l:tmp = tempname()
  call writefile(getline(a:firstline, a:lastline), l:tmp)
  execute "source " . l:tmp
endfunction
command! -range Source <line1>,<line2>call SourceRange()

" there is also a program named 'ansifilter' which filters out ansi escapes
" unsuccessfully.
function! ClearAnsiSequences(line0, line1)
  exec a:line0 . ',' . a:line1 . 's/\e\[[[:digit:];]*m//ge'
  exec a:line0 . ',' . a:line1 . 's/\e(B//ge'
  " TODO: This substitution sometimes remains comma behind because of the
  " pattern '[36;1H,'. The situation should be fixed after deeper
  " understanding of the issue.
  exec a:line0 . ',' . a:line1 . 's/\e\[\d\+;\d\+\w//ge'
endfunction
command! -range=% ClearAnsi call ClearAnsiSequences(<line1>, <line2>)

" fixing arrow keys on terminal Vim
" Two ideas are..
" 1) set <Left>=[1;3D
" 2) (i)(nore)map <Esc>OC <Right>
" using the first idea is logical for portability reasons.
function! Allmap(mapping)
  execute 'map'  . a:mapping
  execute 'map!' . a:mapping
endfunction
function! FixTerminalKeys()
  if !has("gui_running")
    call Allmap(' <Esc>[1;3D <Left>')
    call Allmap(' <Esc>[1;3A <Up>')
    call Allmap(' <Esc>[1;3B <Down>')
    call Allmap(' <Esc>[1;3C <Right>')
    call Allmap(' <Esc>OD    <Left>')
    call Allmap(' <Esc>OA    <Up>')
    call Allmap(' <Esc>OB    <Down>')
    call Allmap(' <Esc>OC    <Right>')
    call Allmap(' <Esc>}     }')
    call Allmap(' <Esc>{     {')
    call Allmap(' <Esc>[     [')
    call Allmap(' <Esc>]     ]')
    call Allmap(' <Esc>~     ~')
    call Allmap(' <Esc>@     @')
    call Allmap(' <Esc>#     #')
    call Allmap(' <Esc>$     $')
    call Allmap(' <Esc>\     \')
    call Allmap(' <Esc>\|    \|')
  else
    call Allmap(' <M-Left>  <Left>')
    call Allmap(' <M-Right> <Right>')
    call Allmap(' <M-Up>    <Up>')
    call Allmap(' <M-Down>  <Down>')
    call Allmap(' þ         ~')
    call Allmap(' À         @')
    call Allmap(' £         #')
  endif
endfunction

function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
command -bar Hexmode call ToggleHex()
" }}}

try
  source ~/.vimrc.local
catch //
endtry

" vim:fdm=marker
