let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +18 ANDROID_OSP/buildroot-2011.11/output/images/rootfs/etc/init.d/rcS
badd +93 ANDROID_OSP/buildroot-2011.11/output/images/rootfs/etc/init.d/S92Arla
badd +10 ANDROID_OSP/buildroot-2011.11/output/images/cortex\ pipeline\ set.txt
badd +35 ANDROID_OSP/buildroot-2011.11/output/images/ARLA_audio_stream.sh
badd +258 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-bad-0.10.22/sys/fbdev/gstfbdevsink.c
badd +58 ANDROID_OSP/buildroot-2011.11/output/images/__rootfs/home/scripts/device_preferences
badd +604 ANDROID_OSP/buildroot-2011.11/output/build/libv4l-0.8.3/lib/libv4l2/libv4l2.c
badd +638 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2src.c
badd +1 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/v4l2_calls.h
badd +456 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/v4l2_calls.c
badd +44 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2object.h
badd +29 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2src.h
badd +1 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2object.c
badd +1 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2sink.h
badd +26 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2xoverlay.h
badd +62 ANDROID_OSP/buildroot-2011.11/output/build/gstreamer-0.10.35/libs/gst/base/gstbasesrc.h
badd +2816 ANDROID_OSP/buildroot-2011.11/output/build/gstreamer-0.10.35/gst/gstpad.c
badd +158 ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/gst/rtp/README
badd +7 ANDROID_OSP/buildroot-2011.11/output/images/rootfs/root/audio.sh
badd +1 ANDROID_OSP/buildroot-2011.11/output/images/rootfs/root/videosend.sh
badd +7 ANDROID_OSP/buildroot-2011.11/output/images/rootfs/root/videoreceive.sh
silent! argdel *
edit ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2object.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 1resize ' . ((&columns * 103 + 84) / 168)
exe '2resize ' . ((&lines * 23 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 103 + 84) / 168)
exe '3resize ' . ((&lines * 16 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 64 + 84) / 168)
exe '4resize ' . ((&lines * 29 + 24) / 48)
exe 'vert 4resize ' . ((&columns * 64 + 84) / 168)
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
let s:l = 1914 - ((14 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1914
normal! 0
wincmd w
argglobal
enew
file ~/ANDROID_OSP/buildroot-2011.11
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/ANDROID_OSP/buildroot-2011.11
wincmd w
argglobal
edit ~/ANDROID_OSP/buildroot-2011.11/output/images/rootfs/root/videosend.sh
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 8 - ((2 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 0159l
lcd ~/
wincmd w
argglobal
edit ~/ANDROID_OSP/buildroot-2011.11/output/images/rootfs/root/videoreceive.sh
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 5 - ((3 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 1resize ' . ((&columns * 103 + 84) / 168)
exe '2resize ' . ((&lines * 23 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 103 + 84) / 168)
exe '3resize ' . ((&lines * 16 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 64 + 84) / 168)
exe '4resize ' . ((&lines * 29 + 24) / 48)
exe 'vert 4resize ' . ((&columns * 64 + 84) / 168)
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
call settabvar(1, "unite_buffer_session", ['/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2object.c', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2sink.h', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2xoverlay.h', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gstreamer-0.10.35/libs/gst/base/gstbasesrc.h', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gstreamer-0.10.35/gst/gstpad.c', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/gst/rtp/README', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/images/rootfs/root/audio.sh', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/images/rootfs/root/videosend.sh', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/images/rootfs/root/videoreceive.sh', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/images/rootfs/etc/init.d/rcS', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/images/rootfs/etc/init.d/S92Arla', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/images/cortex pipeline set.txt', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/images/ARLA_audio_stream.sh', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-bad-0.10.22/sys/fbdev/gstfbdevsink.c', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/images/__rootfs/home/scripts/device_preferences', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/libv4l-0.8.3/lib/libv4l2/libv4l2.c', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2src.c', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/v4l2_calls.h', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/v4l2_calls.c', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2object.h', '/home/arch/ANDROID_OSP/buildroot-2011.11/output/build/gst-plugins-good-0.10.30/sys/v4l2/gstv4l2src.h'])
