" Disable spell-checking of bizarre words:
"  - Mixed alpha / numeric
"  - Mixed case (starting upper) / All upper
"  - Mixed case (starting lower)
"  - Contains strange character
"
" Taken from: http://stackoverflow.com/questions/1278003/how-to-change-word-recognition-in-vim-spell

syn match spellingException "\<\w*\d[\d\w]*\>"      transparent contained containedin=shComment,sh.*String contains=@NoSpell
syn match spellingException "\<\(\u\l*\)\{2,}\>"    transparent contained containedin=shComment,sh.*String contains=@NoSpell
syn match spellingException "\<\(\l\+\u\+\)\+\l*\>" transparent contained containedin=shComment,sh.*String contains=@NoSpell
syn match spellingException "\S*[/\\_`]\S*"         transparent contained containedin=shComment,sh.*String contains=@NoSpell
syn match spellingException "\S\+-\S*"              transparent contained containedin=shComment,sh.*String contains=@NoSpell
