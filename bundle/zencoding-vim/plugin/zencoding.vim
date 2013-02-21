"=============================================================================
" File: zencoding.vim
" Author: Yasuhiro Matsumoto <mattn.jp@gmail.com>
" Last Change: 02-Nov-2012.
" Version: 0.80
" WebPage: http://github.com/mattn/zencoding-vim
" Description: vim plugins for HTML and CSS hi-speed coding.
" SeeAlso: http://code.google.com/p/zen-coding/
" Usage:
"
"   This is vim script support expanding abbreviation like zen-coding.
"   ref: http://code.google.com/p/zen-coding/
"
"   Type abbreviation
"      +-------------------------------------
"      | html:5_
"      +-------------------------------------
"   "_" is a cursor position. and type "<c-y>," (Ctrl+y and Comma)
"   NOTE: Don't worry about key map. you can change it easily.
"      +-------------------------------------
"      | <!DOCTYPE HTML>
"      | <html lang="en">
"      | <head>
"      |     <title></title>
"      |     <meta charset="UTF-8">
"      | </head>
"      | <body>
"      |      _
"      | </body>
"      | </html>
"      +-------------------------------------
"   Type following
"      +-------------------------------------
"      | div#foo$*2>div.bar
"      +-------------------------------------
"   And type "<c-y>,"
"      +-------------------------------------
"      |<div id="foo1">
"      |    <div class="bar">_</div>
"      |</div>
"      |<div id="foo2">
"      |    <div class="bar"></div>
"      |</div>
"      +-------------------------------------
"
" Tips:
"
"   You can customize behavior of expanding with overriding config.
"   This configuration will be marged at loading plugin.
"
"     let g:user_zen_settings = {
"     \  'indentation' : '  ',
"     \  'perl' : {
"     \    'aliases' : {
"     \      'req' : 'require '
"     \    },
"     \    'snippets' : {
"     \      'use' : "use strict\nuse warnings\n\n",
"     \      'warn' : "warn \"|\";",
"     \    }
"     \  }
"     \}
"
"   You can set language attribute in html using 'zen_settings.lang'.
"
" GetLatestVimScripts: 2981 1 :AutoInstall: zencoding.vim
" script type: plugin

if &cp || (exists('g:loaded_zencoding_vim') && g:loaded_zencoding_vim)
  finish
endif
let g:loaded_zencoding_vim = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:zencoding_debug')
  let g:zencoding_debug = 0
endif

if !exists('g:zencoding_curl_command')
  let g:zencoding_curl_command = 'curl -s -L -A Mozilla/5.0'
endif

if exists('g:use_zen_complete_tag') && g:use_zen_complete_tag
  setlocal omnifunc=zencoding#CompleteTag
endif

if !exists('g:user_zen_leader_key')
  let g:user_zen_leader_key = '<c-y>'
endif

command! -nargs=1 Zen call zencoding#expandAbbr(4, <q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
