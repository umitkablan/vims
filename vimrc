" Global vim configuration: vimrc
" Umit Kablan <gmail: umitkablan>
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
language C

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
if has('vim_starting')
  set nocompatible   " Be iMproved
  " filetype off     " Required for Vundle!
  " set rtp+=~/.vim/packs/neobundle.vim/
endif

set completeopt-=preview
set completeopt+=noselect

" Plugins {{{
augroup Misc_Plugins_Au
  autocmd!
augroup END
call plug#begin('~/.vim/packs')

Plug 'Shougo/vimproc', {
  \ 'do' : 'make -f make_mingw32.mak',
  \ }
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim' "'idbrii/AsyncCommand'
Plug 'xolox/vim-misc'
nnoremap <silent> ğ1 :TScratch<CR>
Plug 'tomtom/tlib_vim'
" Plug https://bitbucket.org: ZyX_I/frawor ns9tks/vim-l9
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/let-modeline.vim'
Plug 'myusuf3/numbers.vim' "jeffkreeftmeijer/vim-numbertoggle
" Plug 'LargeFile' "This plugin is bad bad bad - makes syntax disappear regularly
Plug 'vim-scripts/matchit.zip'
" majutsushi/TagBar {{{
nnoremap <silent> TT :TagbarOpenAutoClose<CR>
Plug 'majutsushi/tagbar' "We need it for Startify {'on': ['TagbarOpenAutoClose', 'TagbarToggle', 'TagbarOpen']}
"}}}
" TagSelect {{{
nnoremap <silent> <C-]> :Tselect <cword><CR>
Plug 'umitkablan/tagselect'
"}}}
" wesleyche/SrcExpl {{{
let g:SrcExpl_refreshTime = 400
let g:SrcExpl_isUpdateTags = 0
Plug 'wesleyche/SrcExpl', {'on': ['SrcExpl','SrcExplToggle']}
" }}}
Plug 'umitkablan/vim-autotag' "ludovicchabant/vim-gutentags
let g:cscope_ignored_dir = 'node_modules$\|dist$\|build$\|\..\+$'
Plug 'brookhong/cscope.vim', {'on': ['CscopeClear','CscopeList']}
Plug 'vim-scripts/CCTree', {'on': ['CCTreeLoadDB', 'CCTreeLoadDB', 'CCTreeShowLoadedDBs', 'CCTreeAppendDB']} "hari-rangarajan/CCTree
Plug 'mbbill/echofunc'
Plug 'kana/vim-metarw'
Plug 'bogado/file-line'
nnoremap <silent> ğa :A<CR>
Plug 'vim-scripts/a.vim'
" ReplaceWithRegister {{{
nmap gr  <Plug>ReplaceMotion
nmap grr <Plug>ReplaceLine
xmap gr  <Plug>ReplaceVisual
Plug 'vim-scripts/ReplaceWithRegister'
" }}}
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/yaifa.vim' "ciaranm/detectindent
" vim-auf {{{
let g:auf_retab = 0
let g:auf_fallback_func = 'Misc_Plugins_VimAuf_Fallback'
function! Misc_Plugins_VimAuf_Fallback()
  IndentConsistencyCop
  return 0
endfunction
Plug 'umitkablan/vim-auf'
"}}}
Plug 'vim-scripts/IndentConsistencyCop'
" Indent-Guides {{{
let g:indent_guides_color_change_percent  = 20
let g:indent_guides_enable_on_vim_startup = 0
augroup Misc_Plugins_Au
  autocmd VimEnter * IndentGuidesDisable
augroup END
Plug 'nathanaelkane/vim-indent-guides' "Yggdroot/indentLine
" }}}
Plug 'vim-scripts/ShowTrailingWhitespace' "ntpeters/vim-better-whitespace
xnoremap <silent> <Enter> :EasyAlign<CR>
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'
Plug 'blueyed/vim-diminactive'
Plug 'pboettch/HiCursorWords'
Plug 'vim-scripts/SyntaxMotion.vim'
Plug 'vim-scripts/camelcasemotion'
" Sneak Motions {{{
nmap gs <Plug>Sneak_s
nmap gS <Plug>Sneak_S
xmap gs <Plug>Sneak_s
xmap gS <Plug>Sneak_S
omap gs <Plug>Sneak_s
omap gS <Plug>Sneak_S

nmap , <Plug>SneakNext
nmap ; <Plug>SneakPrevious

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
let g:sneak#streak = 1
Plug 'justinmk/vim-sneak' " supasorn/vim-easymotion rhysd/clever-f.vim
" }}}
Plug 'vim-scripts/ZoomWin' "szw/vim-maximizer
Plug 'chrisbra/NrrwRgn' "We need it for Startify , {'on': ['NR','NW','NRV']}
Plug 'mikewest/vimroom', {'on': ['VimroomToggle']}
Plug 'umitkablan/logavim', {'on': ['Logalize']}
Plug 'tpope/vim-surround'
" jiangmiao/Auto-Pairs {{{
let g:AutoPairsMapSpace = 1
let g:AutoPairsMapCR    = 1
let g:AutoPairsMapBS    = 1
let g:AutoPairsFlyMode  = 0
let g:AutoPairsMapCh    = 0
let g:AutoPairsShortcutBackInsert = '_-<M-b>'
Plug 'jiangmiao/auto-pairs'
"}}}
Plug 'vim-scripts/UnconditionalPaste'
" Smartput & sickill/Pasta {{{
" smartput's mappings about p/P are deleted in favour of vim-pasta.
" vim-pasta handles p/P while smartput handles gp/gP. Fair share.
" Also have non-smart mundane paste's just in case
let g:pasta_disabled_filetypes = ['coffee', 'markdown']
" let g:pasta_enabled_filetypes = ['actionscript', 'c', 'cpp', 'javascript', 'python', 'sh', 'vim']
let g:smartput = 1
nmap <unique> NOTUSEDğst <Plug>SmartputToggle
nnoremap ğp p
nnoremap ĞP P
Plug 'vim-scripts/Smartput'
Plug 'sickill/vim-pasta'
" }}}
" mjbrownie/SwapIt & tpope/SpeedDating {{{
nmap <Plug>SpeedDatingFallbackUp   <Plug>SwapIncrement
nmap <Plug>SpeedDatingFallbackDown <Plug>SwapDecrement
Plug 'mjbrownie/swapit'
Plug 'tpope/vim-speeddating'
" }}}
" Repeat.Vim {{{
let g:repeat_load_via_plugin = 1
let g:repeat_dot_mapping  = '<Bar>'
let g:repeat_undo_mapping = 'U'
Plug 'umitkablan/vim-repeat' "visualrepeat
" }}}
Plug 'ryvnf/readline.vim'
Plug 'vim-scripts/CmdlineComplete'
" Command Aliases {{{
Plug 'Konfekt/vim-alias' "'cmdalias.vim'
func EatChar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
augroup Misc_Plugins_Au
  autocmd VimEnter * Alias m make
  autocmd VimEnter * Alias te tabedit
  autocmd VimEnter * Alias tee tabedit\ ~/<C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias spp sp\ ~/<C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias vss vsp\ ~/<C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias te%  tabedit\ %<C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias te.  tabedit\ <C-r>=expand('%:h:.')<CR>
  autocmd VimEnter * Alias te.. tabedit\ <C-r>=expand('%:h:h:.')<CR>
  autocmd VimEnter * Alias dd diffthis
  autocmd VimEnter * Alias do diffoff
  autocmd VimEnter * Alias did DirDiff
  autocmd VimEnter * Alias ie InlineEdit
  autocmd VimEnter * Alias ww w!
  autocmd VimEnter * Alias E e!
  autocmd VimEnter * Alias ee e\ <C-r>=expand('#:p')<CR>
  autocmd VimEnter * Alias e. e\ <C-r>=expand('%:h:.')<CR><C-r>=EatChar("\ ")<CR>/<C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias er Errors
  autocmd VimEnter * Alias Er Errors
  autocmd VimEnter * Alias un Underline
  autocmd VimEnter * Alias git  Git
  autocmd VimEnter * Alias gl   Glog
  autocmd VimEnter * Alias gt   Git
  autocmd VimEnter * Alias gs   Gstatus
  autocmd VimEnter * Alias ge   Gedit
  autocmd VimEnter * Alias gvsp Gvsplit
  autocmd VimEnter * Alias auf  Auf
  autocmd VimEnter * Alias auff Auf!
  autocmd VimEnter * Alias aufc AufClearHi
  autocmd VimEnter * Alias ac  LAck!\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias Ac  LAck!\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias acc LAckAdd!\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias Acc LAckAdd!\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias ag  Ack!\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias Ag  Ack!\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias agg AckAdd!\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias Agg AckAdd!\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias gr  Grep\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias Gr  Grep\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias rg  Rgrep\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias Rg  Rgrep\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias grr GrepAdd\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
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
  autocmd VimEnter * Alias ref Ref\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias man Ref\ man\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias ob  OpenBrowser\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias obb OpenBrowserSearch\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias tt  Tselect\ <C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias tts Tselect\ /<C-r><C-w><C-r>=EatChar("\ ")<CR>
  autocmd VimEnter * Alias ss SaveSession!\ default
augroup END
" }}}
Plug 'vim-scripts/DirDo.vim', {'on':
                              \ ['DirDo', 'DDO', 'DDD', 'DirDoDir', 'DirDoAdd',
                              \ 'DDA', 'DDP', 'DirDoPattern']}
" Smooth Scrolling {{{
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
Plug 'yuttie/comfortable-motion.vim' "yonchu/accelerated-smooth-scroll
" }}}
" milesz/ack.vim {{{
let [g:ack_apply_qmappings, g:ack_apply_lmappings] = [0, 0]
let g:ackhighlight = 1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
else
  if executable('ack')
    let g:ackprg = 'ack -H --nocolor --nogroup --column'
  else
    if executable('ack-grep')
      let g:ackprg = 'ack-grep -H --nocolor --nogroup --column'
    endif
  endif
endif
Plug 'mileszs/ack.vim', {'on':
              \ ['Ack', 'AckAdd', 'AckFromSearch', 'LAck', 'LAckAdd',
              \ 'AckFile', 'AckHelp', 'LAckHelp', 'AckWindow', 'LAckWindow']}
" }}}
Plug 'mhinz/vim-grepper'
Plug 'brooth/far.vim'
" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits  = 0
let g:airline#extensions#tabline#excludes = []
let g:airline#extensions#tabline#tab_nr_type   = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr   = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#show_message = 0
if !exists('g:airline_statusline_funcrefs')
  let g:airline_statusline_funcrefs = []
endif
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if has('multi_byte')
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.spell = 'S'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'
endif
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
let g:airline_section_b = '%-0.10{airline#extensions#branch#get_head()}'
let g:airline_section_x = "%-0.13{tagbar#currenttag('@%s', '')}"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_colornum_enabled = 0
augroup Airline_To_Colornum
  au!
  au User AirlineAfterInit EnableAirlineColorNum "let g:airline_colornum_enabled = 1
augroup END
Plug 'ntpeters/vim-airline-colornum'
" }}}
Plug 'simnalamburt/vim-mundo', {'on': ['GundoShow','GundoToggle', 'MundoShow', 'MundoToggle']}
" AndrewRadev/Inline_Edit {{{
let g:inline_edit_autowrite=1
nnoremap <silent> <F2> :InlineEdit<CR>
inoremap <silent> <F2> <Esc>:InlineEdit<CR>
Plug 'AndrewRadev/inline_edit.vim', {'on': 'InlineEdit'}
" }}}
" DirDiff {{{
let g:DirDiffExcludes = '.svn,CVS,*.class,*.exe,*.Plo,*.o,*.swp,*.swo,*.la,*.lai,*.so,*.ko'
let g:DirDiffAddArgs  = '-w'
Plug 'vim-scripts/DirDiff.vim', {'on': 'DirDiff'}
" }}}
Plug 'vim-scripts/linediff.vim', {'on': 'Linediff'}
Plug 'rickhowe/diffchar.vim', {'on': ['SDChar','RDChar','TDChar']}
Plug 'sjl/vitality.vim'
Plug 'tpope/vim-abolish'
Plug 'dietsche/vim-lastplace'
" Rooter {{{
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
let g:rooter_silent_chdir = 1
Plug 'umitkablan/vim-rooter'
" }}}
" xolox/vim-Session {{{
let g:session_autoload = 'no'
Plug 'xolox/vim-session'
" }}}
" mhinz/Startify {{{
augroup Misc_Plugins_Au
  au FileType startify setlocal nospell
  au User Startified setlocal cursorline
augroup END
let g:startify_session_dir = '~/.vim/var/session'
let g:session_directory    = '~/.vim/var/session'
let g:startify_files_number  = 19
let g:startify_change_to_dir = 0
let g:startify_bookmarks  = ['~/projects', '~/.vim']
let g:startify_list_order = [
  \ [' Recently opened files:'], 'files',
  \ [' Sessions:'], 'sessions',
  \ [' Bookmarks:'], 'bookmarks',
  \ ]
  " \ [' Recently modified files in the current directory:'], 'dir',
let g:startify_custom_header = map(split(system('fortune'), '\n'), '"   ". v:val') + ['',''] "fortune | cowsay
let g:startify_custom_footer = [
            \ ' _  _  ____  __  __',
            \ '( \/ )(_  _)(  \/  )',
            \ ' \  /  _)(_  )    (',
            \ '  \/  (____)(_/\/\_)',
            \ ]
Plug 'mhinz/vim-startify'
"}}}
" LANGUAGE PACKS {{{
Plug 'sheerun/vim-polyglot'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'ynkdir/vim-vimlparser', {'for': 'vim'}
Plug 'syngan/vim-vimlint',    {'for': 'vim'}
Plug 'sukima/xmledit',    {'for': 'xml'} "othree/xml.vim
Plug 'ujihisa/ft-cmake', {'for': 'cmake'}
Plug 'jamestomasino/actionscript-vim-bundle', {'for': 'actionscript'}
" DerekWyatt/vim-ProtoDef {{{
let g:protodefprotogetter=expand('$HOME/.vim/bundle/protodef-vim-derekwyatt/pullproto.pl')
Plug 'derekwyatt/vim-protodef',          {'for': 'cpp'}
" }}}
" LSP Language Server Protocol {{{
Plug 'prabirshrestha/vim-lsp'
let g:asyncomplete_auto_completeopt = 0
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/packs/vim-snippets/snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" inoremap <expr> <CR> (pumvisible() ? "\<C-y>" : "\<CR>")
imap <expr><TAB> umisc#HasNonspaceBeforeCursor() ?
      \ neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
          \ neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" :
              \ pumvisible() ? "\<C-n>" : "\<C-p>" :
      \ "\<TAB>"
smap <expr><TAB> umisc#HasNonspaceBeforeCursor() ?
      \ neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
          \ neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" :
              \ pumvisible() ? "\<C-n>" : "\<C-p>" :
      \ "\<TAB>"
xmap <expr><TAB> umisc#HasNonspaceBeforeCursor() ?
      \ neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
          \ neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" :
              \ pumvisible() ? "\<C-n>" : "\<C-p>" :
      \ "\<TAB>"
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'

let g:lsp_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0

Plug 'mattn/vim-lsp-settings'

function! s:on_lsp_buffer_enabled() abort
  if stridx(',cpp,c,', ','.&ft.',') == -1
    return
  endif
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd    <Plug>(lsp-definition)
  nmap <buffer> <C-]> <Plug>(lsp-definition)
  nmap <buffer> ğs    <Plug>(lsp-rename)
  nmap <buffer> ğr    <Plug>(lsp-references)
  nmap <buffer> ği    <Plug>(lsp-implementation)
  nmap <buffer> K     <Plug>(lsp-hover)
endfunction

augroup LSP_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"}}}
" Java {{{
let g:JavaComplete_EnableDefaultMappings = 0
let g:no_java_maps = 1
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
Plug 'Dinduks/vim-java-get-set',      {'for': 'java'}
" }}}
" Python: davidhalter/Jedi {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled    = 1
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization  = 0
let g:jedi#show_call_signatures = 0
augroup Misc_Plugins_Au
  au FileType python nnoremap <buffer> <silent> <C-]> :call jedi#goto()<CR>
augroup END
Plug 'davidhalter/jedi-vim', {'for': 'python'} "python-mode/python-mode
"}}}
Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
Plug 'vim-scripts/SQLUtilities', {'on': [ 'SQLUFormatStmts', 'SQLUFormatter', 'SQLUCreateColumnList',
      \'SQLUGetColumnDef', 'SQLUGetColumnDataType', 'SQLUCreateProcedure', 'SQLUToggleValue']}
Plug 'vim-scripts/SQLComplete.vim', {'for': 'sql'}
" fatih/Go {{{
" let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 1
let g:go_autodetect_gopath   = 0
let g:go#use_vimproc = 1
" let g:go_bin_path = expand('~/SRC/Go')
let g:go_snippet_engine = 'neosnippet'
let g:go_list_type = 'quickfix'
" let g:go_def_mode  = 'godef'
let g:go_imports_autosave = 1
augroup Misc_Plugins_Au
  au FileType go nnoremap <silent> <buffer> ğa :GoAlternate<CR>
augroup END
Plug 'fatih/vim-go', {'for': 'go'}
"}}}
" mattn/Emmet {{{
let g:user_emmet_install_global = 0
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
augroup emmet_loaded_vimrc
  autocmd!
  autocmd! User emmet-vim EmmetInstall
augroup END
" }}}
" }}}
" NetRW {{{
nmap <unique> NOTUSED_NETRW_HIDELISTEDIT <Plug>NetrwHideEdit
let g:tar_nomax = 1
let g:zip_nomax = 1
let g:netrw_banner = 0
let g:netrw_silent = 1
let g:netrw_sort_sequence="[\/]$,\<core\%(\.\d\+\)\=\>,*,\.pyc$,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$"
let g:netrw_use_noswf = 0
let g:netrw_keepdir   = 0
let g:netrw_home = $HOME . '/.vim/var'
let g:netrw_liststyle = 0
let g:netrw_altv = 1
let g:netrw_fastbrowse= 1
let g:netrw_retmap    = 1
let g:netrw_special_syntax = 1
"let g:netrw_browsex_viewer = 'gnome-open'
let g:netrw_bufsettings = 'nomodifiable nomodified nobuflisted nowrap readonly' "nonumber norelativenumber
" netrw at vim-scripts github repo is old, plainly use distro's plugin
" Plug 'netrw.vim'
" Plug 'tpope/vim-vinegar'
"}}}
" Notes {{{
let g:notesRoot = expand('$HOME/.vim/var/notes')
let g:notes_directories = [expand('$HOME/.vim/var/notes')]
Plug 'vim-scripts/Notes' ", {'on': ['Note','NoteAsNew']}
"}}}
" yssl/QFEnter {{{
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<CR>']
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>', '<C-h>']
let g:qfenter_keymap.topen = ['<C-t>', 'T']
Plug 'yssl/QFEnter'
" }}}
" mhinz/Signify {{{
let g:signify_vcs_list = [ 'git', 'svn' ]
nmap ]h <Plug>(signify-next-hunk)
nmap [h <Plug>(signify-prev-hunk)
nmap ]H 9999]h
nmap [H 9999[h
omap ih <Plug>(signify-motion-inner-pending)
xmap ih <Plug>(signify-motion-inner-visual)
omap ah <Plug>(signify-motion-outer-pending)
xmap ah <Plug>(signify-motion-outer-visual)
Plug 'mhinz/vim-signify'
" }}}
" zhaocai/GoldenView {{{
let g:goldenview__enable_default_mapping = 0
Plug 'zhaocai/GoldenView.Vim'
"}}}
" scrooloose/Syntastic {{{
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "active_filetypes": ["c", "cpp"],
      \ "passive_filetypes": ["go", "python"] }
let g:syntastic_javascript_jshint_conf = '~/.vim/jshint.rc'
let g:syntastic_c_compiler_options = '-std=gnu99
                                  \  -Wall -Wextra -Wshadow -Wpointer-arith
                                  \  -Wcast-align -Wwrite-strings -Wmissing-prototypes
                                  \  -Wmissing-declarations -Wredundant-decls -Wnested-externs
                                  \  -Winline -Wno-long-long -Wuninitialized -Wconversion
                                  \  -Wstrict-prototypes'
"-pedantic
let g:syntastic_stl_format = '[=> ln:%F (%t)]'
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_signs     = 1
let g:syntastic_error_symbol   = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list  = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_c_no_include_search      = 1
let g:syntastic_c_auto_refresh_includes  = 1
let g:syntastic_c_check_header = 1
"let g:syntastic_*_checkers=['Xxx', 'Yyy']
Plug 'scrooloose/syntastic'
" }}}
" xuhdev/SingleCompile {{{
let g:SingleCompile_asyncrunmode = 'python'
let g:SingleCompile_usequickfix = 0
let g:SingleCompile_showquickfixiferror = 0
let g:SingleCompile_showresultafterrun = 0
nnoremap <silent> ğsc :SingleCompile<CR>
nnoremap <silent> ĞSC :SingleCompileRun<CR>
Plug 'xuhdev/SingleCompile', { 'on': [
  \  'SCCompile','SingleCompile','SCCompileRun','SingleCompileRun','SCCompileRunAF'
  \]}
" }}}
" tomtom/TComment {{{
let g:tcomment_mapleader1 = ''
let g:tcomment_mapleader2 = ''
nnoremap <silent> __ :TComment<CR>
xnoremap <silent> __ :TCommentMaybeInline<CR>
Plug 'tomtom/tcomment_vim'
"}}}
" Text Objects {{{
Plug 'wellle/targets.vim'
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
" vim-textobj-quoted, kana/vim-textobj-fold, kana/vim-textobj-indent, textobj-line-vim-scripts
" killphi/vim-textobj-signify-hunk "Deprecated, this functionality is in Signify itself
" }}}
" tomtom/TinyKeyMap {{{
let g:tinykeymap#map#windows#map = 'gw'
augroup Misc_Plugins_Au
  autocmd VimEnter * call tinykeymap#EnterMap('changelocs', 'ğ,', {'name': 'Change locations'})
  autocmd VimEnter * call tinykeymap#Map('changelocs', ',', 'norm! g,')
  autocmd VimEnter * call tinykeymap#Map('changelocs', ';', 'norm! g;')
augroup END
Plug 'tomtom/tinykeymap_vim'
" }}}
" Multiselect {{{
let g:no_multiselect_maps = 1
Plug 'vim-scripts/multiselect'
" }}}
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
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<C-p>'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_mruf_save_on_update = 0
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'"
nnoremap <silent> ğt :CtrlPBufTag<CR>
Plug 'ctrlpvim/ctrlp.vim'
" }}}
" Shougo/Unite {{{
if has('multi_byte')
  let g:unite_prompt = '» '
endif
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit      = 300
let g:unite_source_history_yank_limit  = 600
let g:unite_data_directory = $HOME . '/.vim/var/unite'
augroup Misc_Plugins_Au
  autocmd FileType unite call s:cust_unite_maps()
  autocmd BufLeave \[unite\]* if 'nofile' ==# &buftype | bwipeout | endif
  " autocmd BufLeave \[unite\]* set bufhidden=wipe
augroup END
function! s:cust_unite_maps() "{{{
  imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)
  imap <silent><buffer><expr> <C-T> unite#do_action('tabdrop')
  imap <silent><buffer><expr> <C-o> unite#do_action('split')
  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r unite#do_action('rename')
  endif
  " nnoremap <silent><buffer><expr> cd unite#do_action('lcd')
  nnoremap <buffer><expr> S unite#mappings#set_current_filters(
          \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
endfunction "}}}
if !exists('g:unite_source_menu_menus') "{{{
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
Plug 'Shougo/unite.vim'
function! GfOrUnite(cfile) abort
  let path = expand(a:cfile)
  if path[0] ==# '/'
    execute 'sp ' . path
  else
    execute 'Unite -input=' . umisc#FpathFilterRelStrs(path) . ' file_rec'
  endif
endfunction
nnoremap <silent> gf     :call GfOrUnite(expand('<cfile>'))<CR>
nnoremap <silent> gff    :normal! gf<CR>
nnoremap <silent> ğee    :UniteWithBufferDir -start-insert file<CR>
nnoremap <silent> ğe     :Unite -start-insert file<CR>
nnoremap <silent> <C-f>  :Unite -start-insert source<CR>
nnoremap <silent> <C-f>f :Unite -start-insert register history/yank<CR>
nnoremap <silent> ğb     :Unite -start-insert -auto-preview bookmark<CR>
nnoremap <silent> ĞB     :UniteBookmarkAdd <CR>
" -quick-match
nnoremap <silent> <C-b>     :Unite -start-insert buffer_tab file_rec/async<CR>
nnoremap <silent> <C-b><C-b> :Unite -start-insert buffer<CR>
nnoremap <silent> ĞS     :Unite grep:.<CR>
nnoremap <silent> MRU    :UniteWithCurrentDir -no-split -start-insert file_mru directory_mru<CR>
nnoremap <silent> MRUU   :Unite -no-split -start-insert directory_mru file_mru<CR>
nnoremap <silent> <C-->  :Unite -no-split vimgrep:%:\\CTODO\:\\|FIXME\:\\|NOTE\:<CR>

Plug 'Shougo/tabpagebuffer.vim' "jeetsukumaran/vim-buffergator jlanzarotta/bufexplorer
Plug 'Shougo/neomru.vim'
Plug 'vim-scripts/unite-locate', {'on': 'Unite'}
Plug 'tsukkee/unite-tag',        {'on': 'Unite'}
" unite-colorscheme-1.3 unite-grep-Sixeight tsukkee/unite-help thinca/vim-unite-history h1mesuke/unite-outline hakobe/unite-script
"}}}
" Shougo/VimShell {{{
nnoremap <silent> ğsh  :VimShellPop<CR>
nnoremap <silent> ğp2  :VimShellInteractive --split='split' ipython2<CR>
nnoremap <silent> ğp3  :VimShellInteractive --split='split' python3<CR>
nnoremap <silent> ğp12 :VimShellInteractive --split='split' python2<CR>
Plug 'Shougo/vimshell', {'on': ['VimShellPop', 'VimShellInteractive']}
" }}}
Plug 'janko-m/vim-test'
Plug 'sk1418/QFGrep'
" Fugitive & Git {{{
augroup Misc_Plugins_Au
  au BufReadPost fugitive://* setlocal bufhidden=delete
augroup END
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'idanarye/vim-merginal'
" }}}
" VCSCommand {{{
let g:VCSCommandMapPrefix = '<LocalLeader>_UNUSED_c'
let g:VCSCommandVCSTypePreference = 'git'
"let VCSCommandSVNDiffOpt = '-ignore-all-space'
augroup Misc_Plugins_Au
  " Turn off spell other than commit message writing
  au FileType svndiff,svnlog,svnannotate,svnstatus setlocal nospell
augroup END
augroup VCSCommand
  au VCSCommand User VCSBufferCreated setlocal bufhidden=delete
augroup END
Plug 'vim-scripts/vcscommand.vim', {'on':
      \ ['VCSDiff','VCSStatus','VCSCommit','VCSBlame','VCSRevert','VCSAdd','VCSUpdate','VCSLog','VCSInfo']}
" }}}
" conflict-marker.vim {{{
Plug 'rhysd/conflict-marker.vim'
" }}}
" Mark {{{
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwHistAdd = '' "'/@'
let g:mwAutoSaveMarks = 0
let g:mwIgnoreCase    = 0
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
Plug 'vim-scripts/Mark' "t9md/vim-quickhl
" }}}
" SEARCH {{{
let g:incsearch#vim_cmdline_keymap = 0
let g:incsearch#consistent_n_direction = 1
let g:incsearch#auto_nohlsearch = 0
let g:indexed_search_mappings = 0
let g:indexed_search_line_info = 1
let g:asterisk#keeppos = 1
let g:vim_search_pulse_disable_auto_mappings = 1
let g:vim_search_pulse_mode = 'pattern'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <silent> n <Plug>(incsearch-nohl-n)<Plug>Pulsezv:ShowSearchIndex<CR>
map <silent> N <Plug>(incsearch-nohl-N)<Plug>Pulsezv:ShowSearchIndex<CR>
nnoremap <silent> (( :ShowSearchIndex<CR>
augroup search_plugins_loaded_vimrc " We need to do this way since Mark is mapping */#
  autocmd!
  autocmd VimEnter * map <silent> *  <Plug>(asterisk-z*)zv:ShowSearchIndex<CR>
  autocmd VimEnter * map <silent> #  <Plug>(asterisk-z#)zv:ShowSearchIndex<CR>
  autocmd VimEnter * map <silent> g* <Plug>(asterisk-gz*)zv:ShowSearchIndex<CR>
  autocmd VimEnter * map <silent> g# <Plug>(asterisk-gz#)zv:ShowSearchIndex<CR>

  autocmd VimEnter * IncSearchNoreMap <C-n> <Over>(buffer-complete)
  autocmd VimEnter * IncSearchNoreMap <C-p> <Over>(buffer-complete-prev)
  " autocmd VimEnter * IncSearchNoreMap <C-p> <Plug>CmdlineCompleteBackward "not working
  autocmd VimEnter * IncSearchNoreMap <C-f> <Over>(incsearch-scroll-f)
  autocmd VimEnter * IncSearchNoreMap <C-b> <Over>(incsearch-scroll-b)

  autocmd User IncSearchLeave   ShowSearchIndex
  autocmd User IncSearchExecute call search_pulse#Pulse()
augroup END
Plug 'henrik/vim-indexed-search'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk' "'bronson/vim-visual-star-search'
Plug 'inside/vim-search-pulse'
" Plug 'embear/vim-foldsearch'
" CoremoSearch {{{
let g:CoremoSearch_setDefaultMap = 0
nnoremap <silent> X  :CoremoSearchAdd<CR>
xnoremap <silent> X  :CoremoSearchAddV<CR>
nnoremap <silent> ğX :CoremoSearchRemove<CR>
xnoremap <silent> ğX :CoremoSearchRemoveV<CR>
Plug 'vim-scripts/CoremoSearch'
" }}}
" }}}
Plug 'tyru/open-browser.vim'
Plug 'umitkablan/vim-zeroth-colorscheme'
" umitkablan/umisc {{{
augroup Misc_Plugins_Au
  autocmd FileType vim  vnoremap <silent><buffer> <F2> :Source<CR>
  autocmd FileType vim  nnoremap <silent><buffer> <F2> :Source<CR>
  autocmd FileType text nmap     <silent><buffer> <CR> :call umisc#SwapTrCharsToFromEn()<CR>
augroup END
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
Plug 'umitkablan/umisc'
" }}}
" mbbill/FencView {{{
let g:autofenc_enable     = 1
let g:fencview_autodetect = 0
Plug 'mbbill/fencview', {'on': 'FencView'}
" }}}
" sjl/Clam.vim {{{
nnoremap '! :Clam <Space>
xnoremap '! :ClamVisual <Space>
Plug 'sjl/clam.vim', {'on': 'Clam'}
" }}}
" DBExt {{{
let g:dbext_default_SQLITE_bin = 'sqlite3'
nmap <unique> NOTUSEDğsh <Plug>DBHistory
Plug 'vim-scripts/dbext.vim', {'for': 'sql'}
" }}}
" edkolev/TmuxLine.vim {{{
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'full'
Plug 'edkolev/tmuxline.vim'
" }}}
Plug 'epeli/slimux' "vimux
Plug 'mattn/webapi-vim'
Plug 'thinca/vim-ref',        {'on': 'Ref'} "viewdoc, ManPageView, viki
Plug 'vim-scripts/VisIncr',   {'on': ['I','II']}
let g:DrChipTopLvlMenu = 'Plugin.'
Plug 'vim-scripts/AnsiEsc.vim', {'on': 'AnsiEsc'}
Plug 'chrisbra/SudoEdit.vim', {'on': 'SudoWrite'}
Plug 'danro/rename.vim',      {'on': 'Rename'}
Plug 'qpkorr/vim-renamer',    {'on': 'Renamer'}
Plug 'vim-scripts/vis',          {'on': ['B','S']}
Plug 'vim-scripts/foldutil.vim', {'on': 'FoldShowLines'}
Plug 'nelstrom/vim-qargs',    {'on': 'Qargs'}
Plug 'gerw/vim-HiLinkTrace',  {'on': ['HLT', 'HLTm']}
Plug 'vim-scripts/hexman.vim',{'on': 'HexManager'}
Plug 'itchyny/calendar.vim',  {'on': 'Calendar'}
Plug 'junkblocker/VimSpy', {'on':
      \ ['Messages','Map','Command','CommandOutput','Syntax','Highlight','Function','Autocmd']}
Plug 'chrisbra/csv.vim',       {'for': 'csv'}
Plug 'vim-scripts/Colorizer--Brabandt', {'for': ['css','html']} "ColorSchemeMenuMaker lilydjwg/colorizer
Plug 'diepm/vim-rest-console', {'for': 'rest'}
Plug 'godlygeek/csapprox'
Plug 'ryanoasis/vim-devicons'
Plug 'rkitover/vimpager', {
  \ 'do' : 'make',
  \ }
" dpwright/vim-gf-ext kana/vim-gf-user jszakmeister/vim-togglecursor pafcu/Vimsplain thinca/vim-prettyprint Headlights gist-vim
" drmikehenry/vim-fixkey junkblocker/patchreview-vim kshenoy/vim-signature tacahiroy/ctrlp-funky terryma/vim-multiple-cursors
" https://bitbucket.org/abudden/taghighlight bufkill.vim EasyGrep surfer.vim yate
" let g:quickfixsigns_classes = ['qfl', 'loc', 'vcsdiff', 'marks'] "'breakpoints', 'rel', 'cursor'
" au FileType conque_term let b:quickfixsigns_ignore = ['rel', 'loc']
" Plug 'tomtom/quickfixsigns_vim'
call plug#end()
" }}}

" global configuration {{{
set nocompatible
filetype plugin on
filetype indent on
syntax on
" set regexpengine=1
let [g:mapleader, g:maplocalleader] = ['ü', ',']
"set term color to 256 for some colorschemes to work.
set t_Co=256
"show statusbar all the time
set laststatus=2 showtabline=2
set cmdheight=2 winminwidth=0
set noruler noshowmode title
" highlight the search, don't start from beginning when you reach end.
set hlsearch incsearch
set nowrapscan
set ignorecase smartcase
set backspace=indent,eol,start
set number norelativenumber
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
set hidden " can leave a buffer without saving
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
" keep cursor always in the middle
" set scrolloff=9999

augroup Misc_Au_For_Filetypes
  autocmd!
  au FileType text setlocal wrap linebreak
  au FileType qf,tagselect,diff  setlocal nospell
  au FilterWritePre * if &diff | setlocal nospell | endif
  au TabLeave    * stopinsert
  au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/','%','g'), '\','%','g'),  ':','','g').'~'
  " delete swap file if the swapped file is 'nomodified'
  au SwapExists  * if !&mod | let v:swapchoice = 'd' | endif
  au VimLeave    * if v:dying | wall | endif
  au CompleteDone * silent! pclose
augroup END

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
if has('gui')
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
" closing without colon {{{
nnoremap <silent> ZZ  :hide<CR>
nnoremap <silent> ZZA :qa<CR>
nnoremap <silent> ZZE :lcd %:h\|sp .\|wincmd p\|bd<CR>
nnoremap <silent> ZA  :bd<CR>
" }}}
" disable all _accidental touches_ {{{
nnoremap QQ <Nop>
nnoremap Qq gQ
nnoremap qq <Nop>
nnoremap Q <Nop>
nnoremap u <Nop>
nnoremap U u
nnoremap qQ Q
" }}}
" CTRL-c defaults to leave insert mode,  better not know it {{{
nnoremap <silent> <C-c> :echo expand("%:p:~")<CR>
nnoremap oo o<C-c>o
nnoremap OO O<C-c>O
noremap g; g,
noremap g, g;
nmap g,, g,g,
" }}}
" no shift key $/^ {{{
noremap gl $
noremap gh ^
inoremap <silent> <C-E> <C-O>:normal! "g$"<CR>
inoremap <silent> <C-A> <C-O>:exe "normal! \<C-O>g^"<CR>
" }}}
" behave like C and D counterparts (default is yy, which yanks line(s))
noremap Y y$
" Needed the 'dot' at reverse side of comma/n, which is mainly used for
" search-replace (<comma_or_n><dot>)
nnoremap <silent> <Bar> :normal .<CR>
" no shift key colon : {{{
nnoremap ç :
xnoremap ç :
nmap . ç
xmap . ç
" }}}
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
if has('gui_running')
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
nnoremap <silent> <C-l><C-l> :let @/=''\|redraw!\|e!<CR>
nnoremap <silent> HH  :hide<CR>
nnoremap <silent> ĞCD :cd %:p:h<CR>
nnoremap <silent> ğcd :pwd<CR>
nnoremap <silent> ĞRL :sp .lvimrc<CR>
nnoremap <silent> ĞĞE :Explore<CR>
nnoremap <silent> ĞE  :call umisc#OpenExplore()<CR>
nnoremap <silent> ĞV  :call umisc#OpenExplore('vertical')<CR>
nnoremap <silent> ĞRC :tabe ~/.vim/<CR>
nnoremap <silent> ĞT  :sp <C-R>=expand('%:p:h')<CR><CR><C-W>T
nnoremap <silent> ğ3  :e#<CR>
" de facto visual block indent mappings
vnoremap < <gv
xnoremap > >gv
" nnoremap ğ> >i} AND ğ< <i}
" easier %s/%g
nnoremap ğs :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
nnoremap ğss :%s/<C-r><C-w>//gI<Left><Left><Left>
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
" set pastetoggle=<F12> " Better invert paste and show status
inoremap <F12> <C-O>:set invpaste paste?<CR>
nnoremap <F12>      :set invpaste paste?<CR>
" easy completion
inoremap <C-j> <C-X><C-O>
" au CmdwinEnter * map <silent> <buffer> <Esc><Esc> <C-c>
" call s:SwapKeys(",", ";")
" }}}

" preprocessor #if 0 over selected line(s) {{{
augroup preprocessor_langs
  au!
  au FileType c,cpp vnoremap out "zdmzO#if 0<C-c>"zp'zi#endif<CR><C-c>k
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
      \ pumvisible() ? asyncomplete#close_popup()."\<Esc>" : "\<Esc>"
inoremap <expr><silent> kj
      \ pumvisible() ? asyncomplete#close_popup()."\<Esc>" : "\<Esc>"
inoremap <expr><silent> jk<Space>
      \ pumvisible() ? asyncomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
inoremap <expr><silent> j<Space>k
      \ pumvisible() ? asyncomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
inoremap <expr><silent> kj<Space>
      \ pumvisible() ? asyncomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
inoremap <expr><silent> k<Space>j
      \ pumvisible() ? asyncomplete#close_popup()."\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
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
      \ pumvisible() ? asyncomplete#close_popup() :
          \ umisc#IsSemicolonAppropriateHere() ? ";\<CR>" :
              \ getline(".")[col('.')-1] == '}' ? "\<CR>\<C-c>O" : "\<CR>"
augroup END
" }}}

" personal plugin maps {{{
" Enter/Backspace Behaviour {{{
nmap <silent> <CR> <C-]>
nnoremap <silent> <Backspace> :if !umisc#QFixCloseAndCheck()<Bar>:exec "normal \<lt>C-t>"<Bar>endif<CR>
augroup tag_langs
  au!
  " Adjust maps according to tags status: some filetypes are tags-driven.
  " TSelect.vim, TS (exPlugin), or Unite
  " :TS <C-R><C-W><CR> / :PopTagStack<CR>
  " :UniteWithCursorWord -immediately tag<CR>
  au FileType java,javascript,actionscript,sh
          \ nnoremap <silent> <buffer> <CR> :Tselect <C-R><C-W><CR>
augroup END
augroup Backspace_Quits_Filetype_Maps
  au!
  au FileType tar,man,conque_term       nnoremap <silent> <buffer> <Backspace> :bwipeout!<CR>
  au FileType tagbar,qf,help            nnoremap <silent> <buffer> <Backspace> :q<CR>
  au FileType tagbar,qf,tagselect       nmap     <buffer>          <Esc>       <Backspace>
  au FileType netrw                     nmap     <buffer>          <Backspace> -
  au FileType vundle,gitcommit,calendar nmap     <buffer>          <Backspace> q
augroup END
augroup VCSCommand
  au VCSCommand User VCSBufferCreated nnoremap <silent> <buffer> <Backspace> :q!<CR>
augroup END
" }}}

inoremap <expr> <C-K> BDG_GetDigraph()
" }}}
" plugin configuration {{{
let g:tmuxmake_targets = ''
let g:locator_disable_mappings = 1

let g:valgrind_arguments = '--leak-check=yes --num-callers=5000'
let g:local_vimrc = '.lvimrc'
let g:loaded_fonts = 1
" }}}

try
  source ~/.vimrc.local
catch /.*/
  echoerr '.vimrc.local ERROR: ' . v:exception
endtry

" vim:fdm=marker
