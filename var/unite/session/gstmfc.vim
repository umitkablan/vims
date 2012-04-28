let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1638 drivers/media/video/samsung/mfc50/mfc_opr.c
badd +53 drivers/media/video/samsung/mfc50/mfc_logmsg.h
badd +308 drivers/media/video/samsung/mfc50/mfc.c
badd +75 drivers/media/video/samsung/mfc50/mfc_memory.h
badd +331 drivers/media/video/samsung/mfc50/mfc_buffer_manager.c
badd +1 ~/ANDROID_OSP/libdecodesip/DecTest/SsbSipMfcDecAPI.cpp
badd +38 ~/ANDROID_OSP/libdecodesip/DecTest/SsbSipMfcApi.h
badd +134 arch/arm/plat-s5p/include/plat/regs-mfc.h
badd +59 drivers/media/video/samsung/mfc50/mfc_shared_mem.c
badd +294 ~/ANDROID_OSP/libdecodesip/DecTest/mfc_interface.h
badd +179 drivers/media/video/samsung/mfc50/mfc_intr.c
badd +35 drivers/media/video/samsung/mfc50/mfc_buffer_manager.h
badd +21 drivers/media/video/samsung/mfc50/mfc_shared_mem.h
badd +356 ~/ANDROID_OSP/libdecodesip/DecTest/MfcTest_arla.cpp
badd +103 ~/ANDROID_OSP/libdecodesip/DecTest/mfcdec.cpp
badd +368 ~/ANDROID_OSP/libdecodesip/DecTest/(clewn)_console
badd +23 ~/ANDROID_OSP/libdecodesip/DecTest/__Scratch__
badd +165 ~/SRC/yay-20100327-1/yay.c
badd +34 include/linux/types.h
badd +305 drivers/media/video/samsung/mfc50/mfc_interface.h
silent! argdel *
edit drivers/media/video/samsung/mfc50/mfc_opr.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
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
let s:l = 1649 - ((27 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1649
normal! 0
tabedit ~/ANDROID_OSP/libdecodesip/DecTest/SsbSipMfcDecAPI.cpp
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
exe '2resize ' . ((&lines * 15 + 24) / 48)
argglobal
enew
file ~/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
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
let s:l = 613 - ((0 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
613
normal! 025l
wincmd w
exe '1resize ' . ((&lines * 29 + 24) / 48)
exe '2resize ' . ((&lines * 15 + 24) / 48)
tabedit ~/SRC/yay-20100327-1/yay.c
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
exe '2resize ' . ((&lines * 15 + 24) / 48)
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
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
let s:l = 92 - ((6 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
92
normal! 011l
lcd ~/SRC/yay-20100327-1
wincmd w
exe '1resize ' . ((&lines * 29 + 24) / 48)
exe '2resize ' . ((&lines * 15 + 24) / 48)
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
call settabvar(1, "unite_buffer_session", ['/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc_buffer_manager.c', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc_opr.c', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc_logmsg.h', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/arch/arm/plat-s5p/include/plat/regs-mfc.h', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc_shared_mem.c', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc.c', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc_intr.c', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc_buffer_manager.h', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc_shared_mem.h', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/include/linux/types.h', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc_interface.h', '/home/arch/ANDROID_OSP/Asure-Dropad-kernel-2.6.35.7-6592f72/drivers/media/video/samsung/mfc50/mfc_memory.h'])
call settabvar(2, "unite_buffer_session", ['/home/arch/ANDROID_OSP/libdecodesip/DecTest/SsbSipMfcApi.h', '/home/arch/ANDROID_OSP/libdecodesip/DecTest/mfc_interface.h', '/home/arch/ANDROID_OSP/libdecodesip/DecTest/SsbSipMfcDecAPI.cpp', '/home/arch/ANDROID_OSP/libdecodesip/DecTest/MfcTest_arla.cpp', '/home/arch/ANDROID_OSP/libdecodesip/DecTest/mfcdec.cpp'])
call settabvar(3, "unite_buffer_session", ['/home/arch/SRC/yay-20100327-1/yay.c'])
