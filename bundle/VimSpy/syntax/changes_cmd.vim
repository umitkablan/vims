"   Copyright (c) 2007, Michael Shvarts <shvarts@akmosoft.com>
" For version 5.x, clear all syntax items.
" For version 6.x, quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
let s:text = match(getline(1),'\<text\>')
"syn region changesTitle start='^\s*Name\s\+Args\s\+Range\>' end='\<Complete\s\+Definition$' keepend 
exec 'syn match changesText contained ''\%'.s:text.'c.*'''
syn match changesTitle '\%^change\s\+line\s\+col\s\+text'
syn region changesDesc start='^\s*\(\d\+\s\+\)\{3\}' end='$' oneline keepend contains=changesText
" Define the default highlighting.
" For version 5.x and earlier, only when not done already.
" For version 5.8 and later, only when an item doesn't have highlighting yet.
if version >= 508 || !exists("did_changes_cmd_syn_inits")
  if version < 508
    let did_changes_cmd_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink changesTitle       Title
  HiLink changesText        SpecialKey
  delcommand HiLink
endif
let b:current_syntax = "changes_cmd"
