" Disable spell-checking of bizarre words:
"  - Mixed alpha / numeric
"  - Mixed case (starting upper) / All upper
"  - Mixed case (starting lower)
"  - Contains strange character
"
" Taken from: http://stackoverflow.com/questions/1278003/how-to-change-word-recognition-in-vim-spell

syn match spellingException "\<\w*\d[\d\a]*\>"      transparent contained containedin=actionScriptComment,actionScriptStringS,actionScriptStringD contains=@NoSpell
syn match spellingException "\<\(\u\l*\)\{2,}\>"    transparent contained containedin=actionScriptComment,actionScriptStringS,actionScriptStringD contains=@NoSpell
syn match spellingException "\<\(\l\+\u\+\)\+\l*\>" transparent contained containedin=actionScriptComment,actionScriptStringS,actionScriptStringD contains=@NoSpell
syn match spellingException "\w\+[\-_.]\w\+"        transparent contained containedin=actionScriptComment,actionScriptStringS,actionScriptStringD contains=@NoSpell
