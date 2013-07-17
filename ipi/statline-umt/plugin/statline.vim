" ============================================================================
" File:        statline.vim
" Maintainer:  Miller Medeiros <http://blog.millermedeiros.com/>
" Description: Add useful info to the statusline and basic error checking.
" Last Change: October 05, 2011
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
" ============================================================================

if exists("g:loaded_statline_plugin")
    finish
endif
let g:loaded_statline_plugin = 1

if !exists('g:statline_trailing_space')
    let g:statline_trailing_space = 1
endif

if !exists('g:statline_show_echofunc')
    let g:statline_show_echofunc = 0
endif

if !exists('g:statline_mixed_indent')
    let g:statline_mixed_indent = 0
endif

if !exists('g:statline_rvm')
    let g:statline_rvm = 0
endif

if !exists('g:statline_fugitive')
    let g:statline_fugitive = 0
endif

if !exists('g:statline_syntastic')
    let g:statline_syntastic = 0
endif

if !exists('g:statline_show_encoding')
    let g:statline_show_encoding = 0
endif

if !exists('g:statline_no_encoding_string')
    let g:statline_no_encoding_string = 'No Encoding'
endif

if !exists('g:statline_show_charcode')
    let g:statline_show_charcode = 0
endif

if !exists('g:statline_show_tagname')
    let g:statline_show_tagname = 0
endif

" these methods were based on factorylabs/vimfiles
function! StatlineTabWarning()
    if !exists("b:statline_indent_warning")
        let tabs = search('^\t', 'nw') != 0
        " ignore spaces just before JavaDoc style comments
        let spaces = search('^ \+\*\@!', 'nw') != 0
        let mixed = search('^\( \+\t\|\t\+ \+\*\@!\)', 'nw') != 0
        if mixed
            let b:statline_indent_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statline_indent_warning = '[&et]'
        else
            let b:statline_indent_warning = ''
        endif
    endif
    return b:statline_indent_warning
endfunction

function! StatlineTrailingSpaceWarning()
    if !exists("b:statline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statline_trailing_space_warning = '[\s]'
        else
            let b:statline_trailing_space_warning = ''
        endif
    endif
    return b:statline_trailing_space_warning
endfunction

function! StatlineSyntastic()
    " safe guard against syntastic being only loaded after statline
    if exists('g:loaded_syntastic_plugin')
        return SyntasticStatuslineFlag()
    else
        return ''
    endif
endfunction

function! Get_Statusline_Normal()
    let statusline_tmp="%<%1.24{getcwd()}"

    " filename (relative or tail)
    if exists('g:statline_filename_relative')
        let statusline_tmp = statusline_tmp . "%1*[%f]%*"
    else
        let statusline_tmp = statusline_tmp . "%1*[%t]%*"
    endif

    " flags (h:help:[help], w:window:[Preview], m:modified:[+][-], r:readonly:[RO])
    let statusline_tmp = statusline_tmp . "%2*%h%w%m%r%*"
    " filetype
    "let statusline_tmp = statusline_tmp . "\ %y"

    " file format → file encoding
    if g:statline_show_encoding
        let statusline_tmp = statusline_tmp . "[%{&ff}→%{strlen(&fenc)?&fenc:g:statline_no_encoding_string}]"
    endif

    if exists("*GetSpaceMovement")
        let statusline_tmp = statusline_tmp . "[%{GetSpaceMovement()}]"
    endif

    if g:statline_show_tagname == 1
        let statusline_tmp = statusline_tmp . "%2*%{tagbar#currenttag('<%s> ', '')}%*"
    endif

    if g:statline_show_echofunc == 1
        let statusline_tmp = statusline_tmp . "%3*%{EchoFuncGetStatusLine()}%*"
    endif

    " separation between left/right aligned items
    let statusline_tmp = statusline_tmp . "%="

    let statusline_tmp = statusline_tmp . "[%n]\ %<"

    " current line and column (-:left align, 14:minwid, l:line, L:nLines, c:column)
    let statusline_tmp = statusline_tmp . "%-14(\ L%l/%L:C%c\ %)"
    " scroll percent
    let statusline_tmp = statusline_tmp . "%P"

    " code of character under cursor (b:num, B:hex)
    if g:statline_show_charcode
        let statusline_tmp = statusline_tmp . "%9(\ \%b/0x\%B%)"
    endif

    if g:statline_rvm
        let statusline_tmp = statusline_tmp . "%{rvm#statusline()}"
    endif

    if g:statline_fugitive
        let statusline_tmp = statusline_tmp . "%4*%{fugitive#statusline()}%*"
    endif

    if g:statline_syntastic
        let statusline_tmp = statusline_tmp . "\ %3*%{StatlineSyntastic()}%*"
    endif

    if g:statline_mixed_indent
        let statusline_tmp = statusline_tmp . "%3*%{StatlineTabWarning()}%*"
        " recalculate when idle and after writing
        autocmd cursorhold,bufwritepost * unlet! b:statline_indent_warning
    endif

    if g:statline_trailing_space
        let statusline_tmp = statusline_tmp . "%3*%{StatlineTrailingSpaceWarning()}%*"
        " recalculate when idle, and after saving
        autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
    endif

    return statusline_tmp
endfunction

" always display statusline (iss #3)
set laststatus=2

" ====== colors ======
" using link instead of named highlight group inside the statusline to make it
" easier to customize, reseting the User[n] highlight will remove the link.
" Another benefit is that colors will adapt to colorscheme.
"filename
hi default link User1 Identifier
" flags
hi default link User2 Statement
" errors
hi default link User3 Error
" fugitive
hi default link User4 Special

augroup StatlineUmt
    autocmd!
    autocmd BufWinEnter * setl statusline=%!Get_Statusline_Normal()
    autocmd WinEnter    * setl statusline=%!Get_Statusline_Normal()
    autocmd TabEnter    * setl statusline=%!Get_Statusline_Normal()
    " autocmd BufLeave    * echoerr " ".expand("<abuf>").&ft
    " autocmd BufEnter    * echoerr " ".expand("<abuf>").&ft
    autocmd BufWinLeave * if &ft=="fuf"|echoerr " ".expand("<abuf>").&ft.expand("%")|endif
    " autocmd BufLeave * echoerr " r..".expand("<abuf>").&ft.expand("%")
    " autocmd BufWinEnter * echoerr " ".expand("<abuf>").&ft
    autocmd BufWinLeave * if expand("<abuf>") == expand("%") |  setl statusline="%1*[%F]%*" | endif
    autocmd WinLeave    * setl statusline="%1*[%F]%*"
    " autocmd TabLeave    * setl statusline="%1*[%F]%*"
augroup END

function! Get_Statline_Main()
    let statusline_tmp = ""
    if EchoFuncGetStatusLine() != ""
        let statusline_tmp = "%{EchoFuncGetStatusLine()}"
        return statusline_tmp
    else
        let statusline_tmp = Get_Statusline_Normal()
        return statusline_tmp
    endif
endfunction

