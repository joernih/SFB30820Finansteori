let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
xmap  <Plug>SpeedDatingUp
nmap  <Plug>SpeedDatingUp
smap  :echo expand('%:p') 
omap  :echo expand('%:p') 
map  :Explore
snoremap <silent>  "_c
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippet()
map  :NERDTreeToggle
snoremap  "_c
map  :bel terminal
xmap  <Plug>SpeedDatingDown
nmap  <Plug>SpeedDatingDown
map  :vertical terminal
map  :tabe %
vmap ,rp :call RClearAll()
nmap ,rp :call RClearAll()
vmap ,rc <Plug>RClearAll
nmap ,rc <Plug>RClearAll
map 7 :FloatermNew
map 9 :FloatermKill
nmap <silent> ^M :call SendLineToR("down")
map cw0 <C-w 0>
map cz ::tabe %
map cx :q!
map cw 
map ct :tabnew ~/.vimrc
map cs :source ~/.vimrc
map cm :mksession! abc.vim
map cp :vsplit
map cg :! gitp update
map cn :
map cr ?
map cf /
map cd :sh
map cb1 :buffer 1  
map cl :buffers 
map ce :tabedit 
map cb :buffer 
map ca :mksession! tex.vim
map c0 :bel vertical terminal
map c1 :split
map cc :call RClearAll()
map c5 :5tabnext
map c4 :4tabnext
map c3 :3tabnext
map c2 :vsplit
nmap d<C-X> <Plug>SpeedDatingNowLocal
nmap d <Plug>SpeedDatingNowLocal
nmap d<C-A> <Plug>SpeedDatingNowUTC
nmap d <Plug>SpeedDatingNowUTC
map fq :FloatermKill
map fm :FloatermToogle
map fn :FloatermNew
map fh :FZF ~
map ff :FZF
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
map gd :bd 
map gp :bp
map gn :bn
map mw 
map rm :RMarkdown
map wa :wqall!
map wq :wq
map ww :w 
xmap <C-X> <Plug>SpeedDatingDown
xmap <C-A> <Plug>SpeedDatingUp
nmap <C-X> <Plug>SpeedDatingDown
nmap <C-A> <Plug>SpeedDatingUp
nnoremap <Plug>SpeedDatingFallbackDown 
nmap <Plug>SpeedDatingFallbackUp :echo expand('%:p') 
nnoremap <silent> <Plug>SpeedDatingNowUTC :call speeddating#timestamp(1,v:count)
nnoremap <silent> <Plug>SpeedDatingNowLocal :call speeddating#timestamp(0,v:count)
xnoremap <silent> <Plug>SpeedDatingDown :call speeddating#incrementvisual(-v:count1)
xnoremap <silent> <Plug>SpeedDatingUp :call speeddating#incrementvisual(v:count1)
nnoremap <silent> <Plug>SpeedDatingDown :call speeddating#increment(-v:count1)
nnoremap <silent> <Plug>SpeedDatingUp :call speeddating#increment(v:count1)
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
snoremap <C-R> "_c
snoremap <silent> <C-H> "_c
snoremap <silent> <Del> "_c
snoremap <silent> <BS> "_c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
smap <C-A> :echo expand('%:p') 
omap <C-A> :echo expand('%:p') 
map <C-E> :Explore
map <C-N> :NERDTreeToggle
map <C-Z> :tabe %
map <C-Y> :vertical terminal
map <C-T> :bel terminal
inoremap <silent> 	 =UltiSnips#ExpandSnippet()
imap ,rp :call RClearAll()
imap ,rc <Plug>RClearAll
imap jj 
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set backupdir=~/.cache/vim/backup//
set belloff=all
set clipboard=unnamedplus
set directory=~/gitclones/homepageJIH/external/sessions/swap/
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=nb
set pyxversion=3
set ruler
set runtimepath=~/.vim,~/.vim/pack/tpope/start/speeddating,~/.vim/plugged/AutoComplPop,~/.vim/plugged/vimtex,~/.vim/plugged/fzf,~/.vim/plugged/Nvim-R,~/.vim/plugged/vim-floaterm,~/.vim/plugged/ncm2,~/.vim/plugged/vim-hug-neovim-rpc,~/.vim/plugged/UltiSnips,~/.vim/plugged/ncm2-ultisnips,~/.vim/plugged/Vundle.vim,~/.vim/plugged/vim-matlab,~/.vim/plugged/vim-orgmode,~/.vim/plugged/popup.nvim,~/.vim/plugged/plenary.nvim,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after,~/.vim/after,~/.vim/plugged/vimtex/after,~/.vim/plugged/UltiSnips/after,~/.vim/bundle/Vundle.vim
set shell=zsh
set statusline=%F
set suffixes=.bak,~,.o,.info,.swp,.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set noswapfile
set undodir=~/.cache/vim/undo//
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/gitclones/homepageJIH/rprojects/teaching/SFB30820Finansteori
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd draft.R
edit draft.R
argglobal
vnoremap <buffer> <silent> ,rd :call RSetWD()
nnoremap <buffer> <silent> ,rd :call RSetWD()
onoremap <buffer> <silent> ,rd :call RSetWD()
vnoremap <buffer> <silent> ,ko :call RMakeRmd("odt_document")
nnoremap <buffer> <silent> ,ko :call RMakeRmd("odt_document")
onoremap <buffer> <silent> ,ko :call RMakeRmd("odt_document")
vnoremap <buffer> <silent> ,kh :call RMakeRmd("html_document")
nnoremap <buffer> <silent> ,kh :call RMakeRmd("html_document")
onoremap <buffer> <silent> ,kh :call RMakeRmd("html_document")
vnoremap <buffer> <silent> ,kw :call RMakeRmd("word_document")
nnoremap <buffer> <silent> ,kw :call RMakeRmd("word_document")
onoremap <buffer> <silent> ,kw :call RMakeRmd("word_document")
vnoremap <buffer> <silent> ,kl :call RMakeRmd("beamer_presentation")
nnoremap <buffer> <silent> ,kl :call RMakeRmd("beamer_presentation")
onoremap <buffer> <silent> ,kl :call RMakeRmd("beamer_presentation")
vnoremap <buffer> <silent> ,kp :call RMakeRmd("pdf_document")
nnoremap <buffer> <silent> ,kp :call RMakeRmd("pdf_document")
onoremap <buffer> <silent> ,kp :call RMakeRmd("pdf_document")
vnoremap <buffer> <silent> ,kr :call RMakeRmd("default")
nnoremap <buffer> <silent> ,kr :call RMakeRmd("default")
onoremap <buffer> <silent> ,kr :call RMakeRmd("default")
vnoremap <buffer> <silent> ,r- :call RBrOpenCloseLs("C")
nnoremap <buffer> <silent> ,r- :call RBrOpenCloseLs("C")
onoremap <buffer> <silent> ,r- :call RBrOpenCloseLs("C")
vnoremap <buffer> <silent> ,r= :call RBrOpenCloseLs("O")
nnoremap <buffer> <silent> ,r= :call RBrOpenCloseLs("O")
onoremap <buffer> <silent> ,r= :call RBrOpenCloseLs("O")
vnoremap <buffer> <silent> ,ro :call RObjBrowser()
nnoremap <buffer> <silent> ,ro :call RObjBrowser()
onoremap <buffer> <silent> ,ro :call RObjBrowser()
vnoremap <buffer> <silent> ,rb :call RAction("plotsumm", "v")
vnoremap <buffer> <silent> ,rg :call RAction("plot", "v")
vnoremap <buffer> <silent> ,rs :call RAction("summary", "v")
nnoremap <buffer> <silent> ,rb :call RAction("plotsumm")
onoremap <buffer> <silent> ,rb :call RAction("plotsumm")
nnoremap <buffer> <silent> ,rg :call RAction("plot")
onoremap <buffer> <silent> ,rg :call RAction("plot")
nnoremap <buffer> <silent> ,rs :call RAction("summary")
onoremap <buffer> <silent> ,rs :call RAction("summary")
vnoremap <buffer> <silent> ,rh :call RAction("help")
nnoremap <buffer> <silent> ,rh :call RAction("help")
onoremap <buffer> <silent> ,rh :call RAction("help")
vnoremap <buffer> <silent> ,re :call RAction("example")
nnoremap <buffer> <silent> ,re :call RAction("example")
onoremap <buffer> <silent> ,re :call RAction("example")
vnoremap <buffer> <silent> ,ra :call RAction("args")
nnoremap <buffer> <silent> ,ra :call RAction("args")
onoremap <buffer> <silent> ,ra :call RAction("args")
vnoremap <buffer> <silent> ,td :call RAction("dputtab", "v")
vnoremap <buffer> <silent> ,vh :call RAction("viewobj", "v", ", howto='above 7split', nrows=6")
vnoremap <buffer> <silent> ,vv :call RAction("viewobj", "v", ", howto='vsplit'")
vnoremap <buffer> <silent> ,vs :call RAction("viewobj", "v", ", howto='split'")
vnoremap <buffer> <silent> ,rv :call RAction("viewobj", "v")
vnoremap <buffer> <silent> ,rt :call RAction("str", "v")
vnoremap <buffer> <silent> ,rn :call RAction("nvim.names", "v")
vnoremap <buffer> <silent> ,rp :call RAction("print", "v")
nnoremap <buffer> <silent> ,td :call RAction("dputtab")
onoremap <buffer> <silent> ,td :call RAction("dputtab")
nnoremap <buffer> <silent> ,vh :call RAction("viewobj", ", howto='above 7split', nrows=6")
onoremap <buffer> <silent> ,vh :call RAction("viewobj", ", howto='above 7split', nrows=6")
nnoremap <buffer> <silent> ,vv :call RAction("viewobj", ", howto='vsplit'")
onoremap <buffer> <silent> ,vv :call RAction("viewobj", ", howto='vsplit'")
nnoremap <buffer> <silent> ,vs :call RAction("viewobj", ", howto='split'")
onoremap <buffer> <silent> ,vs :call RAction("viewobj", ", howto='split'")
nnoremap <buffer> <silent> ,rv :call RAction("viewobj")
onoremap <buffer> <silent> ,rv :call RAction("viewobj")
nnoremap <buffer> <silent> ,rt :call RAction("str")
onoremap <buffer> <silent> ,rt :call RAction("str")
nnoremap <buffer> <silent> ,rn :call RAction("nvim.names")
onoremap <buffer> <silent> ,rn :call RAction("nvim.names")
nnoremap <buffer> <silent> ,rp :call RAction("print")
onoremap <buffer> <silent> ,rp :call RAction("print")
vnoremap <buffer> <silent> ,rr :call RClearConsole()
nnoremap <buffer> <silent> ,rr :call RClearConsole()
onoremap <buffer> <silent> ,rr :call RClearConsole()
vnoremap <buffer> <silent> ,rl :call g:SendCmdToR("ls()")
nnoremap <buffer> <silent> ,rl :call g:SendCmdToR("ls()")
onoremap <buffer> <silent> ,rl :call g:SendCmdToR("ls()")
noremap <buffer> <silent> ,ud :call RAction("undebug")
noremap <buffer> <silent> ,bg :call RAction("debug")
noremap <buffer> <silent> ,su :call SendAboveLinesToR()
let s:cpo_save=&cpo
set cpo&vim
noremap <buffer> <silent> ,r<Right> :call RSendPartOfLine("right", 0)
noremap <buffer> <silent> ,r<Left> :call RSendPartOfLine("left", 0)
noremap <buffer> <silent> ,m :set opfunc=SendMotionToRg@
vnoremap <buffer> <silent> ,o :call RWarningMsg("This command does not work over a selection of lines.")
nnoremap <buffer> <silent> ,o :call SendLineToRAndInsertOutput()0
onoremap <buffer> <silent> ,o :call SendLineToRAndInsertOutput()0
noremap <buffer> <silent> ,d :call SendLineToR("down")0
noremap <buffer> <silent> ,l :call SendLineToR("stay")
noremap <buffer> <silent> ,pa :call SendParagraphToR("echo", "down")
noremap <buffer> <silent> ,pd :call SendParagraphToR("silent", "down")
noremap <buffer> <silent> ,pe :call SendParagraphToR("echo", "stay")
noremap <buffer> <silent> ,pp :call SendParagraphToR("silent", "stay")
vnoremap <buffer> <silent> ,so :call SendSelectionToR("echo", "stay", "NewtabInsert")
vnoremap <buffer> <silent> ,sa :call SendSelectionToR("echo", "down")
vnoremap <buffer> <silent> ,sd :call SendSelectionToR("silent", "down")
vnoremap <buffer> <silent> ,se :call SendSelectionToR("echo", "stay")
vnoremap <buffer> <silent> ,ss :call SendSelectionToR("silent", "stay")
nnoremap <buffer> <silent> ,sa :call SendSelectionToR("echo", "down", "normal")
onoremap <buffer> <silent> ,sa :call SendSelectionToR("echo", "down", "normal")
nnoremap <buffer> <silent> ,sd :call SendSelectionToR("silent", "down", "normal")
onoremap <buffer> <silent> ,sd :call SendSelectionToR("silent", "down", "normal")
nnoremap <buffer> <silent> ,se :call SendSelectionToR("echo", "stay", "normal")
onoremap <buffer> <silent> ,se :call SendSelectionToR("echo", "stay", "normal")
nnoremap <buffer> <silent> ,ss :call SendSelectionToR("silent", "stay", "normal")
onoremap <buffer> <silent> ,ss :call SendSelectionToR("silent", "stay", "normal")
vnoremap <buffer> <silent> ,fa :call SendFunctionToR("echo", "down")
nnoremap <buffer> <silent> ,fa :call SendFunctionToR("echo", "down")
onoremap <buffer> <silent> ,fa :call SendFunctionToR("echo", "down")
vnoremap <buffer> <silent> ,fd :call SendFunctionToR("silent", "down")
nnoremap <buffer> <silent> ,fd :call SendFunctionToR("silent", "down")
onoremap <buffer> <silent> ,fd :call SendFunctionToR("silent", "down")
vnoremap <buffer> <silent> ,fe :call SendFunctionToR("echo", "stay")
nnoremap <buffer> <silent> ,fe :call SendFunctionToR("echo", "stay")
onoremap <buffer> <silent> ,fe :call SendFunctionToR("echo", "stay")
vnoremap <buffer> <silent> ,ff :call SendFunctionToR("silent", "stay")
nnoremap <buffer> <silent> ,ff :call SendFunctionToR("silent", "stay")
onoremap <buffer> <silent> ,ff :call SendFunctionToR("silent", "stay")
noremap <buffer> <silent> ,ba :call SendMBlockToR("echo", "down")
noremap <buffer> <silent> ,bd :call SendMBlockToR("silent", "down")
noremap <buffer> <silent> ,be :call SendMBlockToR("echo", "stay")
noremap <buffer> <silent> ,bb :call SendMBlockToR("silent", "stay")
noremap <buffer> <silent> ,ks :call RSpin()
noremap <buffer> <silent> ,ao :call ShowRout()
noremap <buffer> <silent> ,ae :call SendFileToR("echo")
noremap <buffer> <silent> ,aa :call SendFileToR("silent")
vnoremap <buffer> <silent> ,; :call MovePosRCodeComment("selection")
nnoremap <buffer> <silent> ,; :call MovePosRCodeComment("normal")
onoremap <buffer> <silent> ,; :call MovePosRCodeComment("normal")
vnoremap <buffer> <silent> ,xu :call RSimpleCommentLine("selection", "u")
nnoremap <buffer> <silent> ,xu :call RSimpleCommentLine("normal", "u")
onoremap <buffer> <silent> ,xu :call RSimpleCommentLine("normal", "u")
vnoremap <buffer> <silent> ,xc :call RSimpleCommentLine("selection", "c")
nnoremap <buffer> <silent> ,xc :call RSimpleCommentLine("normal", "c")
onoremap <buffer> <silent> ,xc :call RSimpleCommentLine("normal", "c")
vnoremap <buffer> <silent> ,xx :call RComment("selection")
nnoremap <buffer> <silent> ,xx :call RComment("normal")
onoremap <buffer> <silent> ,xx :call RComment("normal")
vnoremap <buffer> <silent> ,rw :call RQuit('save')
nnoremap <buffer> <silent> ,rw :call RQuit('save')
onoremap <buffer> <silent> ,rw :call RQuit('save')
vnoremap <buffer> <silent> ,rq :call RQuit('nosave')
nnoremap <buffer> <silent> ,rq :call RQuit('nosave')
onoremap <buffer> <silent> ,rq :call RQuit('nosave')
vnoremap <buffer> <silent> ,rc :call StartR("custom")
nnoremap <buffer> <silent> ,rc :call StartR("custom")
onoremap <buffer> <silent> ,rc :call StartR("custom")
vnoremap <buffer> <silent> ,rf :call StartR("R")
nnoremap <buffer> <silent> ,rf :call StartR("R")
onoremap <buffer> <silent> ,rf :call StartR("R")
vnoremap <buffer> <silent> <Plug>RClearAll :call RClearAll()
nnoremap <buffer> <silent> <Plug>RClearAll :call RClearAll()
onoremap <buffer> <silent> <Plug>RClearAll :call RClearAll()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#',:###,:##,:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'r'
setlocal filetype=r
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=cq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetRIndent()
setlocal indentkeys=0{,0},:,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,.
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=CompleteR
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=8
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'r'
setlocal syntax=r
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext 1
badd +0 draft.R
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOS
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
