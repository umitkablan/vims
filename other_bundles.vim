
let utl_opt_verbose=0
NeoBundle 'utl'
NeoBundle 'libview'
NeoBundle 'locator'
NeoBundle 'pyclewn'
NeoBundle 'quilt'
NeoBundle 'CountJump'
NeoBundle 'Replay'
NeoBundle 'relops'
NeoBundle 'replay'
NeoBundle 'resizewin'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'sk1418/Join'
" luochen1990/rainbow {{{
let g:rainbow_active=1
let g:rainbow_operators = 1
NeoBundle 'luochen1990/rainbow'
" }}}
let g:languagetool_jar='/usr/share/java/languagetool/languagetool-commandline.jar'
NeoBundle 'dpelle/vim-LanguageTool'
NeoBundle 'tdd-dubgeiser-vim'
let g:enableUnicodeCompletion = 0
NeoBundle 'chrisbra/unicode.vim'
NeoBundle 'toggle_unit_tests'
NeoBundle 'LimpidTech/vimpy'
NeoBundle 'MarcWeber/vim-addon-other'
NeoBundle 'editorconfig-vim'
" supasorn/EasyMotion {{{
let g:EasyMotion_leader_key = '<Tab><Tab>'
nnoremap <silent> -- H:call EasyMotion#WB(0,0)<CR>
NeoBundle 'supasorn/vim-easymotion'
NeoBundle 'haya14busa/vim-easymotion'
" }}}
" tomtom/quickfixsigns_vim {{{
let loaded_quickfixsigns = 1
let g:quickfixsigns_classes = ['qfl', 'loc', 'vcsdiff', 'marks'] "'breakpoints', 'rel', 'cursor'
au FileType conque_term let b:quickfixsigns_ignore = ['rel', 'loc']
NeoBundle 'tomtom/quickfixsigns_vim'
" }}}
" terryma/Expand-Region {{{
nmap + <Plug>(expand_region_expand)
xmap + <Plug>(expand_region_expand)
xmap - <Plug>(expand_region_shrink)
nmap - <Plug>(expand_region_shrink)
NeoBundle 'terryma/vim-expand-region'
" }}}
NeoBundle 'https://bitbucket.org/madevgeny/yate.git'
NeoBundle 'code_upstairs'
" Valloric/YouCompleteMe {{{
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
NeoBundle 'Valloric/YouCompleteMe'
" }}}
" jeetsukumaran/Buffergator {{{
let g:buffergator_suppress_keymaps = 1
NeoBundle 'jeetsukumaran/vim-buffergator'
" }}}
" kana/Arpeggio {{{
NeoBundle 'kana/vim-arpeggio'
call arpeggio#load() "Arpeggio nmap wh/l/j/k <C-w>h/l/j/k
Arpeggio nnoremap <silent> <Space><Tab> :update<CR>
" }}}
" Conque-Shell {{{
let g:ConqueTerm_ReadUnfocused = 0
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_CWInsert = 0
let g:ConqueTerm_ToggleKey   = '<C-F8>'
let g:ConqueTerm_SendVisKey  = '<C-F9>'
let g:ConqueTerm_SendFileKey = '<C-F10>'
let g:ConqueTerm_ExecFileKey = '<C-F11>'
nnoremap <silent> ĞSH :ConqueTermSplit bash<CR>
NeoBundle 'Conque-Shell'
" }}}
" EasyTags {{{
let g:loaded_easytags = "disable_"
let g:easytags_file = "~/.vim/easytags_TAGS"
let g:easytags_always_enabled = 1
let g:easytags_updatetime_min = 2000
let g:easytags_updatetime_autodisable = 1
autocmd FileType conque_term let b:easytags_auto_highlight = 0
autocmd FileType conque_term let b:easytags_on_cursorhold = 0
autocmd FileType conque_term let b:easytags_auto_update = 0
NeoBundle 'EasyTags'
" }}}
NeoBundle 'Vimpy-monokrome'
NeoBundle 'WhereFrom'
NeoBundle 'WinWalker'
NeoBundle 'ZoomWin'
NeoBundle 'explainpat'
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'lfilho/cosco.vim'
NeoBundle 'bigfish/vim-js-context-coloring'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'filesearch'
NeoBundle 'filtering2'
NeoBundle 'fortune-vimtips'
NeoBundle 'derekwyatt/vim-fswitch'
NeoBundle 'chrisbra/changesPlugin'
NeoBundle 'jmcantrell/diffchanges.vim'
NeoBundle 'golden-ratio'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'nelstrom/vim-qargs'
NeoBundle 'AndrewRadev/switch.vim'

