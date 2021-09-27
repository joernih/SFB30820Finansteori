let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
map  :echo expand('%:p') 
map  :Explore
snoremap <silent>  "_c
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippet()
map  :NERDTreeToggle
snoremap  "_c
map  :bel terminal
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
map ca :qall!
map c0 :bel vertical terminal
map c1 :split
map cc :call RClearAll()
map c5 :5tabnext
map c4 :4tabnext
map c3 :3tabnext
map c2 :vsplit
map fq :FloatermKill
map fm :FloatermToogle
map fn :FloatermNew
map fh :FZF ~
map ff :FZF
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
map gd :bd 
map gp :bp
map gn :bn
map rm :RMarkdown
map wa :wqall!
map wq :wq
map ww :w 
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
snoremap <C-R> "_c
snoremap <silent> <C-H> "_c
snoremap <silent> <Del> "_c
snoremap <silent> <BS> "_c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
map <C-A> :echo expand('%:p') 
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
set backspace=indent,eol,start
set backupdir=~/.cache/vim/backup//
set belloff=all
set clipboard=unnamedplus
set directory=~/gitclones/homepageJIH/external/sessions/swap/
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=nb
set ruler
set runtimepath=~/.vim,~/.vim/plugged/AutoComplPop,~/.vim/plugged/vimtex,~/.vim/plugged/fzf,~/.vim/plugged/Nvim-R,~/.vim/plugged/vim-floaterm,~/.vim/plugged/ncm2,~/.vim/plugged/vim-hug-neovim-rpc,~/.vim/plugged/UltiSnips,~/.vim/plugged/ncm2-ultisnips,~/.vim/plugged/Vundle.vim,~/.vim/plugged/vim-matlab,~/.vim/plugged/vim-orgmode,~/.vim/plugged/popup.nvim,~/.vim/plugged/plenary.nvim,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after,~/.vim/after,~/.vim/plugged/vimtex/after,~/.vim/plugged/UltiSnips/after,~/.vim/bundle/Vundle.vim
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
argglobal
enew
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
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
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
if &filetype != ''
setlocal filetype=
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
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
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
setlocal omnifunc=
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
if &syntax != ''
setlocal syntax=
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
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
tabnext 1
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
