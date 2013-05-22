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
set number "relativenumber
" highlight current line
set wmw=0 "minimum window height
set cmdheight=1
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
set timeout timeoutlen=540 ttimeout ttimeoutlen=100
" keep cursor always at the middle
" set scrolloff=9999
" show tabline every now and then
set showtabline=2
set cursorline nocursorcolumn
set wrap nolinebreak
set showmode

au InsertEnter * set nocursorline
au InsertLeave * set cursorline
au FileType text setlocal wrap linebreak
au TabLeave    * stopinsert
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/','%','g'), '\','%','g'),  ':','','g').'~'
" delete swap file if the swapped file is 'nomodified'
au SwapExists * if !&mod | let v:swapchoice = 'd' | endif
au VimLeave   * if v:dying | wall | endif
"*************** }}}

"***************** {{{
" fixing arrow keys on terminal Vim
" -----------------------------------
"
" Two ideas are..
" 1) set <Left>=[1;3D
" 2) (i)(nore)map <Esc>OC <Right>

" using the first idea is logical for portability reasons.
function Allmap(mapping)
  execute 'map'  . a:mapping
  execute 'map!' . a:mapping
endfunction

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
"*************** }}}

"personal maps: maps that does not need plugins
"************* {{{
nnoremap <silent> ZZ  :hide<CR>
nnoremap <silent> ZZA :qa<CR>
nnoremap <silent> ZA  :bd<CR>
" disable all _accidental touches_
nnoremap QQ <Nop>
nnoremap Qq gQ
nnoremap qq <Nop>
nnoremap Q <Nop>
nnoremap u <Nop>
nnoremap U u
nnoremap qQ Q
nnoremap <Leader>q gqip
" CTRL-c to leave insert mode,  better not know it.
nnoremap <silent> <C-c> :pwd<CR>
nnoremap oo o<Esc>o
nnoremap OO O<Esc>O
imap <C-BS> <C-W>
" swap comma (,) and semicolon (;) because my keyboard is comma-privileged
noremap , ;
noremap ; ,
onoremap , ;
onoremap ; ,
xnoremap , ;
xnoremap ; ,
noremap g; g,
noremap g, g;
" Handy, go to last edit. It is frequently done twice.
nmap g,, g,g,
" not to press shift key
map gl $
map gh ^
" behave like C and D counterparts (default is yy, which yanks line(s))
map Y y$
" i need the 'dot' at reverse side of comma/n, which i mainly use for
" search-replace (<comma_or_n><dot>)
nmap <silent> <Bar> :norm! .<CR>
nmap ç :
vmap ç :
nmap . ç
vmap . ç
" nnoremap / q/i
" nnoremap : q:i
" nnoremap ? q?i
" autocmd CmdwinEnter * map <silent> <buffer> <Esc><Esc> <C-c>
" map arrow keys to move whole window up/down
"   <C-D>/<C-U>, Lzz/Hzz or <C-F>/<C-B> may also be used for Up/Down
noremap <Down> 4<C-E>
noremap <Up>   4<C-Y>
" clearing @/ is really useful: last search's highlight distracts me more than rarely
nnoremap <silent> \ :let @/=""<CR>:echo "Cleared Search Pattern"<CR>
nnoremap <silent> y@@ :let @+=expand("%:p")<CR>
nnoremap <silent> y@  :let @+=expand("%:.")<CR>
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
" using TAB instead of ^W is easier
nmap <Tab> <C-W>
nmap <Tab><Tab> <C-W><C-W>
nnoremap <silent> <Tab><Tab>l :tabnext<CR>
nnoremap <silent> <Tab><Tab>h :tabprev<CR>
" full redraw
nnoremap <silent> <c-l> :redraw!<CR>
nnoremap <silent> HH :hide<CR>
nnoremap <silent> ĞCD :cd %:p:h<CR>
nnoremap <silent> <Leader>cd :pwd<CR>
nnoremap <silent> <Leader>rc :sp .lvimrc<CR>
nnoremap <silent> ĞRC :tabnew ~/.vim/<CR>
" de facto visual block indent mappings
vmap < <gv
vmap > >gv
nmap <Leader>> >i}
nmap <Leader>< <i}
" easier colon access
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
nnoremap <Leader>g :%g/<C-r><C-w>/
" vnoremap <c-j> @='jojo'<cr>
" vnoremap <expr> <c-j> 'jo'.v:count1.'jo'
" vnoremap <c-k> @='koko'<cr>
" vnoremap <expr> <c-k> 'ko'.v:count1.'ko'
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
nnoremap <Space> za
nnoremap <expr> GV '`[' . strpart(getregtype(), 0, 1) . '`]'
" ease cmdline 0/$ movement
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" unnamed register to/from system clipboard
nmap <silent> ğ,, :set paste\|exe 'norm "+p'\|set nopaste<CR>
nmap <silent> Ğ;; :set paste\|exe 'norm "*p'\|set nopaste<CR>
nnoremap ğc "+yiw
vnoremap ğc "+y

autocmd FileType qf   nnoremap <buffer> o <CR><C-W>p
autocmd FileType help setlocal nonumber

" Better than just inverting 'paste' is inverting and showing
" set pastetoggle=<F12>
imap <F12> <C-O>:set invpaste paste?<CR>
nmap <F12>      :set invpaste paste?<CR>

nmap <silent> <F5> :update<CR>:mak %<CR>
nmap <silent> <F9> :QFix<CR>
nmap <silent> <F10> :lclose\|cclose<CR>
nmap <silent> <F10><F9> :call setqflist([])\|call setloclist(0, [])\|call UpdateSigns_()<CR>

imap <expr> jkl ";\<Esc>"
imap <expr> jk        pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
imap <expr> jk<Space> pumvisible() ? "\<C-y>\<Esc>:update\<CR>" : "\<Esc>:update\<CR>"
imap <expr> <Esc>  pumvisible() ? "\<C-e>" : "\<Esc>"
imap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
imap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
imap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"

" prevent escape to cancel previous escape
inoremap <expr> <Esc><Esc> "\<Esc>"

" Adjust maps according to language: some languages are semicolon driven.
augroup semicolon_langs
  au!
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr> <buffer> jk        YieldSemicolonEscIfAppropriate()
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr> <buffer> jk<Space> YieldSemicolonEscIfAppropriate() . "\<Esc>:update\<CR>"
  au FileType c,cpp,java,javascript,css,actionscript inoremap <expr> <buffer> <CR> !pumvisible() && IsSemicolonAppropriateHere() ? ";\<CR>" : "\<CR>"
augroup END

augroup hide_pum
  au!
  autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
augroup END

augroup preprocessor_langs
  au!
  au FileType c,cpp vnoremap out "zdmzO#if 0<ESC>"zp'zi#endif<CR><ESC>kmz
augroup END

call pathogen#infect('bundle/*')
autocmd BufWritePost ~/.vim/** Helptags
call ipi#inspect()

augroup tag_langs
  au!
  " Adjust maps according to tags status: some filetypes are tags-driven.
  " Other Ideas: TSelect.vim, TS (exPlugin), Unite
  " <CR>        --:> :TS <C-R><C-W><CR>
  " <Backspace> --:> :PopTagStack<CR>
  " <CR>        --:> :UniteWithCursorWord -immediately tag<CR>
  au FileType c,cpp,java,javascript,python,actionscript,sh nmap <silent> <buffer> <CR> :Tselect <C-R><C-W><CR>
  au FileType c,cpp,java,javascript,python,actionscript,sh nmap <buffer> <Backspace> <C-T>
augroup END

" personal plugin maps
" --------------------
nnoremap <silent> <F2> :InlineEdit<CR>
inoremap <silent> <F2> <Esc>:InlineEdit<CR>
call tinykeymap#EnterMap('changelocs', 'ğ,', {'name': 'Change locations'})
call tinykeymap#Map('changelocs', ',', 'norm! g,')
call tinykeymap#Map('changelocs', ';', 'norm! g;')
let g:tinykeymap#map#windows#map = "gw"
nnoremap  X         :CoremoSearchAdd<CR>
xnoremap  X         :CoremoSearchAddV<CR>
nnoremap  <Leader>X :CoremoSearchRemove<CR>
xnoremap  <Leader>X :CoremoSearchRemoveV<CR>
nnoremap -- H:call EasyMotion#WB(0,0)<CR>
nnoremap <silent> GL :call EchoLocationPath()<CR>
nnoremap <silent> <Leader>a :A<CR>
nnoremap <silent> <Leader>1 :Sscratch<CR>
nnoremap <silent> <space><space><space> :ResizeWinMaxHV<CR>
nnoremap <silent> ĞSH :VimShellPop<CR>
nnoremap <silent> <Leader>sh :ConqueTermSplit bash<CR>
nnoremap <silent> <Leader><Leader>sh :ConqueTerm bash<CR>
nnoremap <silent> <Leader>p2 :ConqueTermSplit ipython2<CR>
nnoremap <silent> <Leader>p3 :ConqueTermSplit python3<CR>
nnoremap <silent> <Leader>p12 :ConqueTermSplit python2<CR>
nnoremap <silent> ĞĞE :Explore<CR>
nnoremap <silent> ĞE :call OpenExplore()<CR>
nnoremap <silent> <Leader>e :lcd %:h<CR>:Unite -start-insert file<CR>
nnoremap <silent> <Leader><Leader>u :Utl<CR>
vnoremap <silent> <Leader><Leader>u :Utl<CR>
nnoremap <silent> ĞUU :Underline<CR>
nnoremap <silent> <Leader>w :call WinWalkerMenu()<CR>
nnoremap <silent> TT :TagbarOpenAutoClose<CR>
nnoremap <silent> ĞTS :ExtsSelectToggle<CR>
nnoremap <silent> ĞTT :ExtsStackToggle<CR>
nnoremap <silent> <C-P><C-P> :Unite -start-insert source<CR>
nnoremap <silent> <Leader>b :Unite -start-insert bookmark<CR>
nnoremap <silent> ĞB :UniteBookmarkAdd <CR>
nnoremap <silent> <C-B> :Unite -start-insert buffer<CR>
nnoremap <silent> MRU :Unite -no-split -start-insert file_mru directory_mru<CR>
nnoremap <silent> <Leader>t  :CtrlPBufTag<CR>
nnoremap <silent> <Leader><Leader>cd :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> ĞĞCD :FufDirWithFullCwd<CR>
nnoremap <silent> <Leader>sc :SingleCompile<CR>
nnoremap <silent> ĞSC :SingleCompileRun<CR>
nnoremap <silent> TDD :call Tdd_RunTest()<CR>
nnoremap '! :Clam <Space>
vnoremap '! :ClamVisual <Space>
" nmap <silent> <C-z> <Plug>QAnotherWin
" nmap <Leader>t :Shell make test<CR><CR>
" nnoremap <unique> <silent> <Leader><Leader><Leader>tasaasd :call MakeGreen()<CR>
" nnoremap <silent> <Leader>b  :FufBuffer<CR>
" nmap <silent> <unique> <Leader>b <Plug>SelectBuf
nmap <silent> <Tab><Space><Space> :call ToggleIndGuides_RC()<CR>
nmap CAL  <Plug>CalendarV
nmap HCAL <Plug>CalendarH
nmap VCAL <Plug>CalendarV
vmap <Space><Space> <Plug>MarkSet
nmap <Space><Space> <Plug>MarkSet
nmap <Space>*  <Plug>MarkSearchNext
nmap <Space>#  <Plug>MarkSearchPrev
nmap <Space><Leader>* <Plug>MarkSearchCurrentNext
nmap <Space><Leader># <Plug>MarkSearchCurrentPrev
nmap <S-Space>?  <Plug>MarkSearchAnyPrev
nmap <S-Space>/  <Plug>MarkSearchAnyNext
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
" NeoComplCache
inoremap <C-j> <C-X><C-O>
inoremap <expr> <C-y> neocomplcache#close_popup()
inoremap <expr> <C-e> neocomplcache#cancel_popup()
imap <expr> <Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Plug>SuperTabForward"
smap <expr> <Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
" show block name maps
nnoremap [d :call ShowBlockName('[d')<CR>
nnoremap [i :call ShowBlockName('[i')<CR>
nmap <unique> NOTUSED<M-Insert> <Plug>MarkersMark
vmap <unique> NOTUSED<M-Insert> <Plug>MarkersMark
imap <unique> NOTUSED<M-Insert> <Plug>MarkersMark
imap <unique> NOTUSED<M-Del> <Plug>MarkersJumpF
map  <unique> NOTUSED<M-Del> <Plug>MarkersJumpF
imap <unique> NOTUSED<M-S-Del> <Plug>MarkersJumpB
map  <unique> NOTUSED<M-S-Del> <Plug>MarkersJumpB
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
let g:startify_session_dir = '~/.vim/var/session'
let g:textobj_comment_no_default_key_mappings = 1
let g:buffergator_suppress_keymaps = 1
xmap ax <Plug>(textobj-comment-a)
omap ax <Plug>(textobj-comment-a)
xmap ix <Plug>(textobj-comment-i)
omap ix <Plug>(textobj-comment-i)
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
" Alias'es --------------------------------
autocmd VimEnter * Alias te tabedit
autocmd VimEnter * Alias tee tabedit<Space>~/
autocmd VimEnter * Alias tec tabedit<Space>%
autocmd VimEnter * Alias dd diffthis
autocmd VimEnter * Alias do diffoff
autocmd VimEnter * Alias ie InlineEdit
autocmd VimEnter * Alias E e
autocmd VimEnter * Alias un Underline
autocmd VimEnter * Alias git  Git
autocmd VimEnter * Alias gt   Git
autocmd VimEnter * Alias gst  Gstatus
autocmd VimEnter * Alias ge   Gedit
autocmd VimEnter * Alias gvsp Gvsplit
autocmd VimEnter * Alias er Errors
autocmd VimEnter * Alias ag  LAck!
autocmd VimEnter * Alias agg LAckAdd!
autocmd VimEnter * Alias ac  Ack!
autocmd VimEnter * Alias Ac  Ack!
autocmd VimEnter * Alias acc AckAdd!
autocmd VimEnter * Alias Acc AckAdd!
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
autocmd VimEnter * Alias sw SudoWrite
autocmd VimEnter * Alias sr SudoRead
autocmd VimEnter * Alias con ConqueTermSplit
autocmd VimEnter * Alias up UpdateTypesFileOnly
" ag & ack -------------------------------
if 1 " Use either ag or ack. Both are fast (if you used to run grep) but ag is faster.
  let g:ackprg = 'ag --nocolor --nogroup --column --smart-case'
else
  let g:ackprg = 'ack -H --nocolor --nogroup --column'
endif
" gf_ext ---------------------------------
call gf_ext#add_handler('\.jpg$', "!firefox -new-window")
call gf_ext#add_handler('\.avi$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.flv$', "!mplayer -really-quiet")
call gf_ext#add_handler('\.mp4$', "!mplayer -really-quiet")
" syntastic --------------------------------------------- {{
let g:syntastic_javascript_jshint_conf = "~/.vim/jshint.rc"
let g:syntastic_c_compiler_options = "-std=gnu99
                                  \  -Wall -Wextra -Wshadow -Wpointer-arith
                                  \  -Wcast-align -Wwrite-strings -Wmissing-prototypes
                                  \  -Wmissing-declarations -Wredundant-decls -Wnested-externs
                                  \  -Winline -Wno-long-long -Wuninitialized -Wconversion
                                  \  -Wstrict-prototypes"
"-pedantic
let g:syntastic_stl_format = '[=> ln:%F (%t)]'
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=2
let g:syntastic_always_populate_loc_list=1
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_check_header = 1
let g:syntastic_c_checkers=['gcc'] " , 'make'
let g:syntastic_html_checkers=['tidy']
" ------------------------------------------------------- }}
augroup no_sticky_buffers
  au!
  " TODO: can g:local_vimrc variable be used inside au?
  au BufEnter .lvimrc,fugitive://* nnoremap <buffer> ZZ :bd!<CR>
  au FileType conque_term nnoremap <buffer> ZZ :bd!<CR>
  au FileType svnrevert,svnannotate,svnupdate,svnlog,svncommit,svnstatus,svninfo,svnadd nnoremap <buffer> ZZ :bd!<CR>
  au BufReadPost fugitive://* setlocal bufhidden=delete
augroup END
" smartput & pasta ------------------------
" smartput's mappings about p/P are deleted in favour of vim-pasta.
" vim-pasta handles p/P while smartput handles gp/gP. Fair share.
" Also have non-smart mundane paste's just in case
let g:pasta_disabled_filetypes = ["coffee", "markdown"]
let g:pasta_enabled_filetypes = ['actionscript', 'c', 'cpp', 'javascript', 'python']
let g:smartput = 1
nnoremap ğp p
nnoremap ĞP P
" SwapIt & speeddating --------------------
" use SwapIt to interface C-X/A rather than speeddating. speeddating is
" called from SwapIt as a fallback method.
let g:speeddating_no_mappings = 1
" DeleteTrailingWhitespace ----------------
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'ask'
" TComment --------------------------------
let g:tcommentMapLeader1="_"
let g:tcommentMapLeader2 = '<Leader>-_0'
" AutoPairs -------------------------------
let g:AutoPairsMapCR = 0
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '_-<M-b>'
" IndentGuides ----------------------------
let g:indent_guides_color_change_percent = 20
let g:indent_guides_enable_on_vim_startup = 0
autocmd VimEnter * IndentGuidesDisable
" mark.vim --------------------------------
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwHistAdd = '' "'/@'
let g:mwAutoSaveMarks = 0
let g:mwIgnoreCase = 0
" signs bar: DynamicSigns, quickfixsigns, signature
let g:loaded_Signs = 1
let g:SignsMixedIndentation = 1
let g:Signs_Diff = 0
let g:Signs_QFList = 1
let g:Signs_Alternate = 0
" au VimEnter * SignExpression getline(v:lnum)=~'TODO'
let loaded_quickfixsigns = 1
let g:quickfixsigns_classes = ['qfl', 'loc', 'vcsdiff', 'marks'] "'breakpoints', 'rel', 'cursor'
au FileType conque_term let b:quickfixsigns_ignore = ['rel', 'loc']
" let g:loaded_Signature = "disable"
let g:SignaturePeriodicRefresh = 0
" EasyTags --------------------------------
let g:loaded_easytags = "disable_"
let g:easytags_file = "~/.vim/easytags_TAGS"
let g:easytags_always_enabled = 1
let g:easytags_updatetime_min = 2000
autocmd FileType conque_term let b:easytags_auto_highlight = 0
autocmd FileType conque_term let b:easytags_on_cursorhold = 0
autocmd FileType conque_term let b:easytags_auto_update = 0
let g:easytags_updatetime_autodisable = 1
"VCSCommand ------------------------------
let VCSCommandMapPrefix = "<LocalLeader>c"
let VCSCommandVCSTypePreference = 'git'
" let VCSCommandSVNDiffOpt = "-ignore-all-space"
" netrw ----------------------------------
let g:tar_nomax = 1
let g:zip_nomax = 1
let g:netrw_sort_sequence="[\/]$,\<core\%(\.\d\+\)\=\>,*,\.pyc$,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$"
let g:netrw_use_noswf = 0
let g:netrw_keepdir = 0
let g:netrw_home = $HOME . '/.vim/var'
let g:netrw_liststyle = 0
let g:netrw_banner = 0
"let g:netrw_browsex_viewer = 'gnome-open'
"neocomplcache & neosnippet ---------------
let g:neosnippet#snippets_directory = $HOME . '/.vim/var/neocomplcache_snippets'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_max_list = 25
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_cursor_hold_i = 1
let g:neocomplcache_enable_auto_delimiter = 0
let g:neocomplcache_temporary_dir = $HOME . '/.vim/var/neocomplcache_tmp'
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neocomplcache_source_completion_length = {
  \ 'buffer_complete'    : 1,
  \ 'eclim_complete'     : 1,
  \ 'snippets_complete'  : 2,
  \ 'keyword_complete'   : 2,
  \ 'include_complete'   : 3,
  \ 'dictionary_complete': 3,
  \ 'syntax_complete'    : 3
  \ }
let g:neocomplcache_dictionary_filetype_lists = {
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
let g:neocomplcache_omni_patterns.java = '\h\w*\%(\.\)'
" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_overwrite_completefunc = 1
" if !exists('g:neocomplcache_omni_functions')
"   let g:neocomplcache_omni_functions = {}
" endif
" let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
" let g:neocomplcache_omni_functions.python = 'jedi#complete'
" let g:neocomplcache_omni_functions.c      = 'omni#cpp#complete#Main'
"------------------------------------------
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_function_definition = "0"
let g:jedi#autocompletion_command = "<M-_>"
" OmniCpp ------------------------------------------
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
let OmniCpp_SelectFirstItem = 0
" TxtBrowser ------------------------------
let TxtBrowser_Dict_Url = 'http://www.google.com.tr/dictionary?aq=f&langpair=en|tr-TR&q=text&hl=tr-TR'
let TxtBrowser_Dict_Url = 'http://www.definitions.net/definition/text'
let Txtbrowser_Search_Engine = 'http://www.google.com.tr/search?q=text'
" SingleCompile ---------------------------
let g:SingleCompile_asyncrunmode = 'python'
let g:SingleCompile_usequickfix = 1
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_showresultafterrun = 0
" ConqueTerm ------------------------------ {{
let g:ConqueTerm_ReadUnfocused = 0
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_CWInsert = 0
let g:ConqueTerm_ToggleKey   = '<C-F8>'
let g:ConqueTerm_SendVisKey  = '<C-F9>'
let g:ConqueTerm_SendFileKey = '<C-F10>'
let g:ConqueTerm_ExecFileKey = '<C-F11>'
"------------------------------------------
let g:ctags_path = '/usr/bin/ctags'
let g:ctags_args = '-I __declspec+'
let g:ctags_title = 1
let g:ctags_statusline = 1
let generate_tags = 1
let g:statline_filename_relative = 0
let g:statline_mixed_indent = 1
let g:statline_show_charcode = 0
let g:statline_show_tagname = 1
let g:statline_syntastic = 1
let g:statline_show_encoding = 0
" Unite.vim --------------------------------
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=700
let g:unite_source_history_yank_limit=600
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
" IndentConsistencyCop ------------------------------------------
let g:indentconsistencycop_AutoRunCmd = 'IndentRangeConsistencyCop'
let g:indentconsistencycop_CheckAfterWrite = 1
let g:indentconsistencycop_CheckOnLoad = 0
let g:indentconsistencycop_CheckAfterWriteMaxLinesForImmediateCheck = 400
" SuperTab ------------------------------------------
let g:SuperTabMappingForward = '<C-Space>'
let g:SuperTabMappingBackward = '<S-C-Space>'
let g:SuperTabDefaultCompletionType = "context" "<C-X><C-O>
let g:SuperTabLongestEnhanced = 0
let g:SuperTabCrMapping = 0
"------------------------------------------
let g:EasyMotion_leader_key = '<Tab><Tab>'
let g:inline_edit_autowrite=1
let g:dbext_default_SQLITE_bin = 'sqlite3'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_match_window_bottom = 0
let g:loaded_fortune_vimtips = 1
let g:fortune_vimtips_file = "wisdom"
let g:rainbow_activate=1
let g:locator_disable_mappings = 1
let g:valgrind_arguments='--leak-check=yes --num-callers=5000'
let g:yankring_history_dir = expand('$HOME/.vim')
let g:notesRoot = expand('$HOME/.vim/var/notes')
let g:notes_directories = [expand('$HOME/.vim/var/notes')]
let g:local_vimrc=".lvimrc"
let g:Tdd_makeprg='make'
let g:exTS_backto_editbuf = 0
let g:exTS_close_when_selected = 1
let Grep_Skip_Files = 'tags *~ .lvimrc *.pyc *.min.js types_?*.taghl'
let Grep_Skip_Dirs = 'RCS CVS SCCS .git .vimprj .svn'
let g:DirDiffExcludes = "CVS,*.class,*.exe,*.Plo,*.o,*.swp,*.swo,*.la,*.lai,*.so"
let g:enableUnicodeCompletion = 0
let g:languagetool_jar="/usr/share/languagetool/LanguageTool.jar"
let g:SrcExpl_refreshTime = 400
let g:protodefprotogetter=expand("$HOME/.vim/bundle/protodef-vim-derekwyatt/pullproto.pl")
let g:no_tagselect_maps = 1
let utl_opt_verbose=0
let g:CoremoSearch_setDefaultMap = 0
let g:hybrid_use_Xresources = 0
let g:github_user = "umitkablan"
let g:vimball_home = $HOME . "/.vim/bundle"
let g:autofenc_enable = 1
let g:fencview_autodetect = 0
" fonts and headlights plugin causing problems
let g:loaded_fonts=1
let g:loaded_headlights = 1
let g:loaded_colorsupport = "disable_"
let g:loaded_StatusLineHighlight = "disable_"
let no_multiselect_maps = 1
let g:goldenview__enable_default_mapping = 0
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
function! MapPumInsert(key, insertSpaceAfter)
  if !a:insertSpaceAfter
    exec "imap <expr> " . a:key . " pumvisible() ? \"\<C-y>".a:key."\" : \"".a:key."\""
  else
    exec "imap <expr> " . a:key . " pumvisible() ? \"\<C-y>".a:key."\<Space>\" : \"".a:key."\""
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
nmap <silent> <expr> gn '' . SearchForwLastSearch() . ''

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

function! YieldSemicolonEscIfAppropriate()
  let l:isappr = IsSemicolonAppropriateHere()
  if pumvisible()
    if l:isappr
      return ';'
    endif
    return ''
  endif
  if l:isappr
    return ';'
  endif
  return ''
endfunction

command! SDP call Svndiff("prev")
command! SDN call Svndiff("next")
command! SDC call Svndiff("clear")
"------------------------------------------
"wrapper on signs' update: wraps quickfixsigns and DynamicSigns
function! UpdateSigns_()
  if exists('g:loaded_quickfixsigns') && g:loaded_quickfixsigns == 0
    call QuickfixsignsUpdate()
  endif
  if exists('g:loaded_Signs') && g:loaded_Signs == 0
    UpdateSigns
  endif
endfunction

" save/load quickfix list
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

" used to track the quickfix window: open/closed
augroup QFixToggle
  autocmd!
  autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
  autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END
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
nnoremap <silent> ĞN :redir @n<cr>:call DecAndHex(expand("<cWORD>"))<CR>:redir END<cr>

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
onoremap <silent> an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap <silent> an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap <silent> in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap <silent> in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
onoremap <silent> al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap <silent> al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap <silent> il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap <silent> il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
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

" Source a range of visually selected vim
function! SourceRange() range
  let tmp = tempname()
  call writefile(getline(a:firstline,
\                    a:lastline), l:tmp)
  execute "source " . l:tmp
  call delete(l:tmp)
endfunction
command! -range Source <line1>,<line2>call SourceRange()
"******************************************** }}}

" hemisu bandit lucius solarized badwolf asu1dark burnttoast256 rastafari molokai
" oh-la-la ubloh hickop neverness django wombat256 fnaqevan harlequin fruity
" candycode southernlight lucid kolor kingtop getafe phonzia blackboard
" last256 aldmeris hybrid
set background=dark
colorscheme last256
" if !has("gui_running")
"   au ColorScheme * hi CursorLine term=none cterm=none ctermbg=001510
" endif

if has("gui_running")
  winsize 170 46
endif

"vim:fdm=marker
