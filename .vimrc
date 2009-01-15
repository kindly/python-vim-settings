set guioptions-=m
set guioptions-=T

:nnoremap j h
:nnoremap i k
:nnoremap l l
:nnoremap k j
:vnoremap j h
:vnoremap i k
:vnoremap l l
:vnoremap k j
:onoremap j h
:onoremap i k
:onoremap l l
:onoremap k j

:inoremap <c-j> <LEFT>
:inoremap <c-i> <UP>
:inoremap <c-l> <RIGHT>
:inoremap <c-k> <DOWN>

:nnoremap I <C-U>
:nnoremap K <C-D>
:nnoremap L <End>
:nnoremap J <Home> 
:vnoremap I <C-U>
:vnoremap K <C-D>
:vnoremap L <End>
:vnoremap J <Home>
:onoremap I <C-U>
:onoremap K <C-D>
:onoremap L <End>
:onoremap J <Home>


:noremap <m-i> gg
:noremap <m-k> G

:nnoremap g i
:nnoremap h a
:nnoremap G I
:nnoremap H A
:nnoremap <C-space> G


map <C-e> :py EvaluateCurrentRange()<CR>
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
map \l :tabnext<CR>
map \j :tabnext<CR>
map <silent><A-J> :tabprevious<CR>
map <silent>\h :tabprevious<CR>
map <silent>\k :tabprevious<CR>
map <silent><C-F> <C-w>gf
map <silent><C-N> :tabnew<CR>
map <silent><C-S-S> :vsplit<CR>
map <silent><C-S-A> :vsplit<CR>
map <silent><C-S-Up> <C-w><C-f><C-w>K
map <silent><C-S-Down> <C-w><C-f><C-w>J   
map <silent><C-S-Left> <C-w><C-f><C-w>H
map <silent><C-S-Right> <C-w><C-f><C-w>L
map <silent><C-Up> <C-w>k
map <silent><C-Down> <C-w>j
map <silent><C-left> <C-w>h
map <silent><C-Right> <C-w>l
map <silent><C-H> <C-w>h
map <silent><C-L> <C-w>l
map <silent><C-J> <C-w>j
map <silent><C-K> <C-w>k
inoremap <Nul> <C-x><C-n>
set guioptions-=m
set guioptions-=T
map <F5> :py saveandrunpython()<CR>
map <F6> :py saveandrunnose()<CR>
map <F8> :!git commit -a<CR>

colorscheme = cool














python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

autocmd FileType python set omnifunc=pysmell#Complete
set tags+=$HOME/.vim/tags/python.ctags
syntax on
set hlsearch
set mouse=a
filetype plugin indent on
set completeopt=menu,longest

python << EOL
import vim
def EvaluateCurrentRange():
	eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL

python << EOL
import vim
def saveandrunnose():
	vim.command(r":w")
	vim.command(r":NoseTest")
EOL

python << EOL
import vim
def saveandrunpython():
	vim.command(r":w")
	vim.command(r":!python -i %")
EOL

