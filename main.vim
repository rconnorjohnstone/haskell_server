let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/hackend
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +5 app/main.hs
badd +110 src/Application.hs
badd +15 src/Settings.hs
badd +95 ~/.config/nvim/init.vim
badd +13 config/settings.yml
badd +1 config/routes
badd +1 handler
badd +1 src/Handler/Home.hs
badd +4 templates/homepage.hamlet
badd +1 templates/homepage.lucius
badd +1 templates/homepage.julius
badd +1 ~/Projects/react_site/src/App.js
badd +1 src/Foundation.hs
badd +7 src/Handler/NewHome.hs
badd +1 src/Handler/Profile.hs
badd +1 src/Handler/Comment.hs
badd +17 src/Handler/Common.hs
badd +1 templates/site-layout-wrapper.hamlet
badd +3 templates/site-layout-wrapper.lucius
badd +1 ~/Projects/react_site/src/App.css
badd +1 templates/home.lucius
badd +1 templates/banner/banner.hamlet
badd +1 templates/banner/banner.lucius
badd +2 templates/preview_card/preview_card.hamlet
badd +6 src/Handler/PreviewCard.hs
badd +14 templates/preview_card/preview_card.cassius
badd +24 .gitignore
badd +15 templates/projects/projects.hamlet
badd +36 templates/projects/projects.cassius
badd +7 templates/contact/contact.hamlet
badd +62 templates/contact/contact.cassius
badd +46 package.yaml
badd +50 stack.yaml
badd +7 templates/footer/footer.hamlet
badd +8 templates/footer/footer.cassius
badd +1 src/Handler/About.hs
badd +16 templates/navbar/navbar.hamlet
badd +1 templates/navbar/navbar.cassius
badd +94 config/keter.yml
badd +1 templates/about/about.hamlet
badd +1 templates/about/about.cassius
badd +1 templates/christmas/christmas.cassius
badd +73 templates/site-layout.lucius
badd +1 src/Handler/Resources.hs
badd +1 templates/resources/resources.hamlet
badd +4 Layouts/HomeLayout.hs
badd +1 src/Layouts/HomeLayout.hs
badd +0 README.md
badd +14 config/models.persistentmodels
badd +0 src/Model.hs
badd +0 src/Handler/NewPost.hs
argglobal
%argdel
$argadd app/main.hs
set stal=2
edit src/Foundation.hs
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 116 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 149 + 133) / 266)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 172 - ((25 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
172
normal! 026|
wincmd w
argglobal
if bufexists("src/Application.hs") | buffer src/Application.hs | else | edit src/Application.hs | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 50 - ((7 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
50
normal! 022|
lcd ~/Projects/hackend
wincmd w
exe 'vert 1resize ' . ((&columns * 116 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 149 + 133) / 266)
tabedit ~/Projects/hackend/src/Layouts/HomeLayout.hs
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ~/Projects/hackend/templates/site-layout-wrapper.hamlet
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 120 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 145 + 133) / 266)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 5 - ((4 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0121|
wincmd w
argglobal
if bufexists("~/Projects/hackend/templates/site-layout-wrapper.lucius") | buffer ~/Projects/hackend/templates/site-layout-wrapper.lucius | else | edit ~/Projects/hackend/templates/site-layout-wrapper.lucius | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 120 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 145 + 133) / 266)
tabedit ~/Projects/hackend/config/keter.yml
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 88 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 88 + 133) / 266)
exe 'vert 3resize ' . ((&columns * 88 + 133) / 266)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 4 - ((3 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 074|
lcd ~/Projects/hackend
wincmd w
argglobal
if bufexists("~/Projects/hackend/package.yaml") | buffer ~/Projects/hackend/package.yaml | else | edit ~/Projects/hackend/package.yaml | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 49 - ((18 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
49
normal! 021|
lcd ~/Projects/hackend
wincmd w
argglobal
if bufexists("~/Projects/hackend/config/routes") | buffer ~/Projects/hackend/config/routes | else | edit ~/Projects/hackend/config/routes | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 15 - ((14 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 020|
lcd ~/Projects/hackend
wincmd w
exe 'vert 1resize ' . ((&columns * 88 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 88 + 133) / 266)
exe 'vert 3resize ' . ((&columns * 88 + 133) / 266)
tabedit ~/Projects/hackend/src/Handler/Home.hs
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 120 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 145 + 133) / 266)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 3 - ((2 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
lcd ~/Projects/hackend
wincmd w
argglobal
if bufexists("~/Projects/hackend/templates/home.lucius") | buffer ~/Projects/hackend/templates/home.lucius | else | edit ~/Projects/hackend/templates/home.lucius | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 03|
lcd ~/Projects/hackend
wincmd w
exe 'vert 1resize ' . ((&columns * 120 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 145 + 133) / 266)
tabedit ~/Projects/hackend/src/Handler/About.hs
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 88 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 88 + 133) / 266)
exe 'vert 3resize ' . ((&columns * 88 + 133) / 266)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 3 - ((2 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
lcd ~/Projects/hackend
wincmd w
argglobal
if bufexists("~/Projects/hackend/templates/about/about.hamlet") | buffer ~/Projects/hackend/templates/about/about.hamlet | else | edit ~/Projects/hackend/templates/about/about.hamlet | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 15 - ((8 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 0901|
lcd ~/Projects/hackend
wincmd w
argglobal
if bufexists("~/Projects/hackend/templates/about/about.cassius") | buffer ~/Projects/hackend/templates/about/about.cassius | else | edit ~/Projects/hackend/templates/about/about.cassius | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 5 - ((3 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0
lcd ~/Projects/hackend
wincmd w
exe 'vert 1resize ' . ((&columns * 88 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 88 + 133) / 266)
exe 'vert 3resize ' . ((&columns * 88 + 133) / 266)
tabedit ~/Projects/hackend/src/Handler/Resources.hs
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 133 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 132 + 133) / 266)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 3 - ((2 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
lcd ~/Projects/hackend
wincmd w
argglobal
if bufexists("~/Projects/hackend/templates/resources/resources.hamlet") | buffer ~/Projects/hackend/templates/resources/resources.hamlet | else | edit ~/Projects/hackend/templates/resources/resources.hamlet | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 024|
lcd ~/Projects/hackend
wincmd w
exe 'vert 1resize ' . ((&columns * 133 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 132 + 133) / 266)
tabedit ~/Projects/hackend/src/Handler/NewPost.hs
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Projects/hackend
tabedit ~/Projects/hackend/README.md
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 7 - ((6 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 080|
lcd ~/Projects/hackend
tabedit ~/Projects/hackend/config/models.persistentmodels
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 132 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 133 + 133) / 266)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 21 - ((20 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
21
normal! 020|
lcd ~/Projects/hackend
wincmd w
argglobal
if bufexists("~/Projects/hackend/src/Model.hs") | buffer ~/Projects/hackend/src/Model.hs | else | edit ~/Projects/hackend/src/Model.hs | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 16 - ((15 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 031|
lcd ~/Projects/hackend
wincmd w
exe 'vert 1resize ' . ((&columns * 132 + 133) / 266)
exe 'vert 2resize ' . ((&columns * 133 + 133) / 266)
tabnext 8
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
