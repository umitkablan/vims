" set up folding of quickfix list based on command
setlocal foldlevel=0
setlocal foldmethod=expr
setlocal foldexpr=QfFoldByType(v:lnum)

if foldclosedend(1) == line('$') || line("$") < 9
  " When all matches come from a single file, do not close that single fold;
  " the user probably is interested in the contents.  Likewise if few results.
  setlocal foldlevel=1
else
  setlocal foldlevel=0
endif

function! IsGrepQFixBuffer()
  if exists('w:quickfix_title')
    if w:quickfix_title =~? 'grep'
      return 1
    endif
    if w:quickfix_title =~? '^:ag'
      return 1
    endif
  endif
  return 0
endfunction

" for some reason w:quickfix_title is not set until after the filetype plugin
" runs, so decide which folding to use in the function itself instead
function! QfFoldByType(lnum)
  if IsGrepQFixBuffer()
    return QfFoldFiles(a:lnum)
  else
    return QfFoldWarningsAndErrors(a:lnum)
  endif
endfun

function! QfFoldFiles(lnum)
  return matchstr(getline(a:lnum),'^[^|]\+')==#matchstr(getline(a:lnum+1),'^[^|]\+')?1:'<1'
endfun

function! QfFoldWarningsAndErrors(lnum)
  if v:version >= 700
    let contextlines=getline(a:lnum-2, a:lnum+2)
  else
    " Vim before 7.0 had no List data type and getline() only gets a single line
    " but luckily the match() function can give a result for either arrays or
    " strings, with -1 meaning 'no match' in either case.
    let contextlines=""
    let aline = a:lnum-2
    while aline <= a:lnum+2 && aline <= line('$')
      if aline >= 1
        let contextlines=contextlines."\n".getline(aline)
      endif
      let aline = aline + 1
    endwhile
  endif
  let thisline=getline(a:lnum)
  if thisline =~? '\%(^\|\n\)\f\+|[^|]*\%(warning\|error\)[^|]*|'
    return 0
  elseif match(contextlines, '\%(^\|\n\)\f\+|[^|]*\%(warning\|error\)[^|]*|') >= 0
    return 1
  else
    return 2
  endif
endfun
