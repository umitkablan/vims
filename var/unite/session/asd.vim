let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/ANDROID_OSP/libdecodesip/enctest
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +66 ~/ANDROID_OSP/libdecodesip/DecTest/mfcdec.cpp
badd +276 SsbSipMfcEncAPI.c
badd +3 ~/ANDROID_OSP/libdecodesip/.lvimrc
badd +35 SsbSipMfcApi.h
badd +4 __Scratch__
badd +2 ~/ANDROID_OSP/libdecodesip/DecTest/aycn.txt
badd +221 SsbSipH264Encode.c
badd +85 bash\ -\ 4
badd +335 ~/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc.c
badd +37 mfc_interface.h
badd +33 enctest.c
badd +89 (clewn)_console
silent! argdel *
edit enctest.c
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 29 + 24) / 48)
exe '2resize ' . ((&lines * 16 + 24) / 48)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 37 - ((18 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
37
normal! 04l
lcd ~/ANDROID_OSP/libdecodesip/enctest
wincmd w
argglobal
edit ~/ANDROID_OSP/libdecodesip/enctest/SsbSipMfcEncAPI.c
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 276 - ((7 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
276
normal! 050l
wincmd w
exe '1resize ' . ((&lines * 29 + 24) / 48)
exe '2resize ' . ((&lines * 16 + 24) / 48)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
call settabvar(1, "unite_buffer_session", ['/home/arch/ANDROID_OSP/libdecodesip/enctest/SsbSipMfcApi.h', '/home/arch/ANDROID_OSP/libdecodesip/DecTest/aycn.txt', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc.c', '/home/arch/ANDROID_OSP/libdecodesip/enctest/enctest.c', '/home/arch/ANDROID_OSP/libdecodesip/enctest/mfc_interface.h', '/home/arch/ANDROID_OSP/libdecodesip/DecTest/mfcdec.cpp', '/home/arch/ANDROID_OSP/libdecodesip/enctest/SsbSipMfcEncAPI.c'])
