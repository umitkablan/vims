" pacman program output syntax rules for Clam.vim

" syn match outputItemLineFirst "\^\S\+/\.\+\>"
syn match packageName "/\S\+\>"

syn keyword packageGroup core community extra multilib
syn keyword packageInstalledMark installed


hi def link packageGroup          Type
hi def link packageInstalledMark  Error
hi def link packageName           String
" hi def link outputItemLineFirst Comment
