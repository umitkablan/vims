" FlistTreePlugin.vim
"  Maintainer: Charles E. Campbell, Jr. PhD. <NdrOchipS@PcampbellAfamily.Mbiz>
"  Date:       Jan 02, 2008
"  Version:    9b	ASTRO-ONLY
" ---------------------------------------------------------------------
" Load Once: {{{1
if exists("g:loaded_FlistTreePlugin") || &cp
 finish
endif
let g:loaded_FlistTreePlugin = "v9b"
let s:keepcpo                = &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Public Interface: {{{1
com! -nargs=* FlistTree call FlistTree#FlistTree(<q-args>)

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo
" vim: fdm=marker
