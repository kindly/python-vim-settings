python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

autocmd FileType python set omnifunc=pythoncomplete#Complete
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
	vim.command(r":!nosetests")
EOL

set suffixesadd=.py

map <C-e> :py EvaluateCurrentRange()<CR>
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
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
map :inoremap <C-space> <C-x><C-n>

map <F6> :py saveandrunnose()<CR>
map <F8> :!git commit -a<CR>
