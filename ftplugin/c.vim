" Behaves just like C
if !exists("b:did_ftplugin")
    silent! runtime! ftplugin/c.vim
endif

setlocal omnifunc=ClangComplete
setlocal completefunc=ClangComplete
