"   Copyright (c) 2007, Michael Shvarts <shvarts@akmosoft.com>
" For version 5.x, clear all syntax items.
" For version 6.x, quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
call ApplyHi(b:hi)
syn match syntaxTitle '--- Syntax items ---'
syn match syntaxAttr  '\<\(match\|links to\|cleared\|contains\|start\|end\|keepend\|oneline\|fold\|display\|extend\|contained\|containedin\|nextgroup\|transparent\|skip\|skipwhite\|skipnl\|skipempty\|cluster\|matchgroup\)\>'
"syn keyword syntaxAttr contains oneline fold display extend containedin nextgroup 
" Define the default highlighting
" For version 5.x and earlier, only when not done already.
" For version 5.8 and later, only when an item doesn't have highlighting yet.
if version >= 508 || !exists("did_syntax_cmd_syn_inits")
  if version < 508
    let did_syntax_cmd_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink syntaxTitle Title
  HiLink syntaxAttr SpecialKey
  delcommand HiLink
endif
let b:current_syntax = "menu"
