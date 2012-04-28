" FlistTree.vim
"  Maintainer: Charles E. Campbell, Jr. PhD. <NdrOchipS@PcampbellAfamily.Mbiz>
"  Date:       Jan 02, 2008
"  Version:    9c	NOT RELEASED
" ---------------------------------------------------------------------
" Load Once: {{{1
if exists("g:loaded_FlistTree") || &cp
 finish
endif
let g:loaded_FlistTree = "v9b"
let s:keepcpo          = &cpo
set cpo&vim
"DechoTabOn

" ---------------------------------------------------------------------
"  Public Interface: {{{1
if has("gui_running")
 menu DrChip.FlistTree.FlistTree\ filename					:FlistTree<CR>
 menu DrChip.FlistTree.Go\ up\ one\ level<tab>\\[\.			<Leader>[.
 menu DrChip.FlistTree.Go\ down\ one\ level<tab>\\]\.		<Leader>].
 menu DrChip.FlistTree.Go\ to\ prv\ same\ depth<tab>\\[[	<Leader>[[
 menu DrChip.FlistTree.Go\ to\ nxt\ same\ depth<tab>\\]]	<Leader>]]
endif

" ---------------------------------------------------------------------
"  Options: {{{1
" allow user to override use of "ctags" with whatever tagging program they
" like
if !exists("g:FlistTree_tags")
  let g:FlistTree_tags="ctags"
endif
if !exists("g:FlistTree_options")
  let g:FlistTree_options="-asx"
endif
if !exists("g:FlistTreeWidth")
 let g:FlistTreeWidth=25
endif

" ---------------------------------------------------------------------
"  Functions: {{{1
" FlistTree#FlistTree: Generate graphtree window using flist program {{{2
fun! FlistTree#FlistTree(...)
"  call Dfunc("FlistTree#FlistTree(a:1<".a:1.">)")

  if a:1 != ""
   let flistfiles= substitute(glob(a:1),'\n',' ','g')
"	call Decho("a:1 flistfiles<".flistfiles.">")
  else
   let flistfiles=expand("%")
"	call Decho("expand: flistfiles<".flistfiles.">")
  endif

  " Generate vertically split window
"  call Decho("generate vertically split empty window")
  vsp
  ene

  " generate tags for given file(s)
  " put graphtree in left window
  if g:FlistTree_tags != ""
"    call Decho("applying ".g:FlistTree_tags." to <".flistfiles.">")
    silent exe "!".g:FlistTree_tags." ".flistfiles
  endif
"  call Decho("applying flist to <".flistfiles.">")
  silent exe "r !flist -Tg ".g:FlistTree_options." ".flistfiles
  exe "norm! ggdd"
  set nomod
  if exists("g:winManagerWidth")
   wincmd h
   exe g:winManagerWidth.'wincmd |'
  else
   wincmd h
   exe g:FlistTreeWidth.'wincmd |'
  endif

  " GraphTree maps
  nnoremap <buffer>          <cr>            :call <SID>FlistOpen()<cr>
  nnoremap <buffer> <script> <2-LeftMouse>   :call <SID>FlistOpen()<cr>

  nnoremap <buffer> <script> <LocalLeader>[[ :call <SID>FlistNext(0)<cr>
  nnoremap <buffer> <script> <LocalLeader>]] :call <SID>FlistNext(1)<cr>
  nnoremap <buffer> <script> <LocalLeader>[. :call <SID>FlistNext(2)<cr>
  nnoremap <buffer> <script> <LocalLeader>]. :call <SID>FlistNext(3)<cr>

  nnoremap <buffer> <script> <up>            :call <SID>FlistNext(0)<cr>
  nnoremap <buffer> <script> <down>          :call <SID>FlistNext(1)<cr>
  nnoremap <buffer> <script> <c-up>          :call <SID>FlistNext(0)<cr>
  nnoremap <buffer> <script> <c-down>        :call <SID>FlistNext(1)<cr>
  nnoremap <buffer> <script> <s-up>          :call <SID>FlistNext(2)<cr>
  nnoremap <buffer> <script> <s-down>        :call <SID>FlistNext(3)<cr>

  " SourceSide maps
  let flisttree_winnr = winnr()
  let eikeep = &ei
  set ei=all
  exe "norm! \<c-w>l"
  noremap <buffer> <script> <LocalLeader>[[ :call <SID>FlistAdjust(0)<CR>
  noremap <buffer> <script> <LocalLeader>]] :call <SID>FlistAdjust(1)<CR>
  if exists("g:FlistTree_hasmapto") && g:FlistTree_hasmapto
"   call Decho("case g:FlistTree_hasmapto : conditional <[cs]-up/down> maps")
   if !hasmapto('<c-up>')  | noremap <buffer> <script> <c-up>   :wincmd h<bar>call <SID>FlistNext(0)<cr>|endif
   if !hasmapto('<c-down>')| noremap <buffer> <script> <c-down> :wincmd h<bar>call <SID>FlistNext(1)<cr>|endif
   if !hasmapto('<s-up>')  | noremap <buffer> <script> <s-up>   :wincmd h<bar>call <SID>FlistNext(2)<cr>|endif
   if !hasmapto('<s-down>')| noremap <buffer> <script> <s-down> :wincmd h<bar>call <SID>FlistNext(3)<cr>|endif
  else
"   call Decho("case !g:FlistTree_hasmapto : unconditional <[cs]-up/down> maps")
   noremap <buffer> <script> <c-up>   :wincmd h<bar>call <SID>FlistNext(0)<cr>
   noremap <buffer> <script> <c-down> :wincmd h<bar>call <SID>FlistNext(1)<cr>
   noremap <buffer> <script> <s-up>   :wincmd h<bar>call <SID>FlistNext(2)<cr>
   noremap <buffer> <script> <s-down> :wincmd h<bar>call <SID>FlistNext(3)<cr>
  endif
  exe flisttree_winnr."wincmd w"
  let &ei= eikeep

  " set up some small syntax highlighting for graphtree window
  syn clear
  syn match flistLevel "[-|]"
  syn match flistParen "[()]"
  hi link flistLevel	Delimiter
  hi link flistParen	Operator

  redraw!
  echo "<up>,<down> func at same depth   <s-up> func at calling depth   <s-down> func at deeper depth"

"  call Dret("FlistTree#FlistTree")
endfun

" ---------------------------------------------------------------------
" s:FlistOpen: show function in source window {{{2
fun! s:FlistOpen()
"  call Dfunc("s:FlistOpen()")

  " get function name from under cursor
  let flistfunc=expand("<cword>")
"  call Decho("flistfunc<".flistfunc.">")

  " highlight associated line
"  call Decho('exe 3match PreProc /\%'.line('.').'l\K\k*/')
  exe '3match PreProc /\%'.line('.').'l\K\k*/'


  " tag to function in window to right
  wincmd l
  exe "ta ".flistfunc

  " unfold and place function at top-of-window
  if has("folding") && foldclosed('.') > 0
"   call Decho("foldclosed on line#".line("."))
   norm! zMzx
  endif
  exe "norm! z\<CR>"
  echo "<c-up>,<c-down> func at same depth   <s-up> func at calling depth   <s-down> func at deeper depth"

"  call Dret("s:FlistOpen")
endfun

" ---------------------------------------------------------------------
" s:FlistAdjust: handle moving from code window to graphtree window {{{2
fun! s:FlistAdjust(dir)
"  call Dfunc("s:FlistAdjust(dir=".a:dir.")")
  set lz

  " extract name of function
  if a:dir == 0
   exe "norm! [[z.ma ?)\<CR>"
   exe "norm! %?\\a\<CR>"
  else
   exe "norm! ]]z.ma ?)\<CR>"
   exe "norm! %?\\a\<CR>"
  endif
  let fname=expand("<cword>")
"  call Decho("fname<".b:fname.">")

  " adjust lhs
  exe "norm! \<c-w>h"
  if a:dir == 0
   exe "norm! ?".fname."\<cr>"
  else
   exe "norm! /".fname."\<cr>"
  endif

  exe "norm! z.\<c-w>l`a"
  set nolz
" call Dret("s:FlistAdjust")
endfun

" ---------------------------------------------------------------------
" s:FlistNext: handle moving at same call level in graphtree window {{{2
fun! s:FlistNext(dir)
"  call Dfunc("s:FlistNext(dir=".a:dir.")")
  norm! $F(b
  let curcol=col(".") - 2
"  call Decho("curcol=".curcol)

  if a:dir == 0
   " FlistTree: <up>  SourceSide: <c-up>       (move up to function at same level)
"   call Decho("move up to function at same level")
   if curcol > 0
    exe "norm! 0?^[| ]\\{".curcol."}-\\a\<cr>"
   else
    exe "norm! 0?^\\a\<cr>"
   endif

  elseif a:dir == 1
   " FlistTree: <down>  SourceSide: <c-down>   (move down to function at same level)
"   call Decho("move down to function at same level")
   if curcol > 0
    exe "norm! $/^[| ]\\{".curcol."}-\\a\<cr>"
   else
    exe "norm! $/^\\a\<cr>"
   endif

  elseif a:dir == 2 && curcol >= 3
   " FlistTree: <s-up>  SourceSide: <s-up>     (move up to function at calling level)
"   call Decho("move up to function at calling level")
   let curcol= curcol - 2
   exe "norm! 0?^[| ]\\{".curcol."}-\\a\<cr>"

  elseif a:dir == 3 && curcol >= -1
   " FlistTree: <s-down>  SourceSide: <s-down> (move down to function at one deeper level)
"   call Decho("move down to function at deeper level")
   let curcol= curcol + 2
   exe "norm! 0/^[| ]\\{".curcol."}-\\a\<cr>"

  else
   echoerr "s:FlistNext(".a:dir.") not supported"
  endif
  norm! $F(b

  call s:FlistOpen()

" call Dret("s:FlistNext")
endfun

" ------------------------------------------------------------------------
" Modelines: {{{1
" vim:ts=8 fdm=marker
