"gvim options to get rid of title and add tabs all the time.
set guioptions-=m
set guioptions-=T
set showtabline =2 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

" my wierd keybindings, needs a lot of work to get back some functionality
" especially concerning loss of g key
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

:nnoremap ai gk
:nnoremap al gl
:nnoremap aj gh
:nnoremap ak gj

:inoremap <c-j> <LEFT>
:inoremap <c-i> <UP>
:inoremap <c-l> <RIGHT>
:inoremap <c-k> <DOWN>
:cnoremap <c-j> <LEFT>
:cnoremap <c-l> <RIGHT>

:cnoremap <m-l> <END>
:cnoremap <m-j> <HOME>
:inoremap <m-l> <END>
:inoremap <m-j> <HOME>

:inoremap <m-i> <PageUp>
:inoremap <m-k> <PageDown>


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
:vnoremap g i
:vnoremap h a
:vnoremap G I
:vnoremap H A

:nnoremap a g
:nnoremap A G


:noremap <m-j> :tabprevious<CR>
:noremap <m-l> :tabnext<CR>
:noremap <c-s> :w<CR>
:noremap <m-s> :wa<CR>
:noremap <c-q> :q<CR>
:noremap <m-q> :qa<CR>

:noremap <M-p> "+p
:noremap <M-y> "+y

:noremap <C-b> gJ

:onoremap gw iw
:onoremap g" i"
:onoremap g' i'
:onoremap g( i(
:onoremap g{ i{
:onoremap g[ i[
:onoremap g< i<

:noremap <C-c> :py block_action('c')<CR>a
:noremap <C-d> :py block_action('d')<CR>
:noremap <C-p> :py block_action('p')<CR>
:noremap <C-y> :py block_action('y')<CR>

:nnoremap <CR> g<c-]>
:nnoremap <BS> <c-t>
:nnoremap <c-cr> :tab sts<cr>
"some less odd potentially useful keybindings for working with tabs and
"windows
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

"open new things
map <C-T> :tabnew 
map <C-N> :vnew 

"navigate windows
map <silent><C-Up> <C-w>k
map <silent><C-Down> <C-w>j
map <silent><C-left> <C-w>h
map <silent><C-Right> <C-w>l
"navigate using my wierd bindings
map <silent><C-j> <C-w>h
map <silent><C-L> <C-w>l
map <silent><C-k> <C-w>j
map <silent><C-i> <C-w>k

" local or local window competion only
inoremap <C-SPACE> <C-x><C-l>
set complete=.,w,] "b potentially if want all buffers

"basic options
syntax on
set hlsearch
set mouse=a
filetype plugin indent on
set completeopt=menu,longest
set wildmode=longest,list
colorscheme = wombat
set tags=./../tags,./tags
set switchbuf=usetab,useopen 
"runstuff
map <F5> :py saveandrunpython()<CR>
map <C-F5> :py saveandrunipython()<CR>
map <F6> :py saveandrunnose()<CR>
map <F4> :py saveandrunnosethis()<CR>
map <F9> :py opentraceback()<CR>
map <F8> :GitCommit -a<CR>
map <F10> :py open_from_list()<CR>
map <C-F10> :py delete_scratch()<CR>
map <F3> :Jslint<CR>

map <c-F2> :silent !gnome-terminal -e "java -jar ~/.vim/JsTestDriver-1.0b.jar --port 8080 --browser firefox"<CR>
map <F2> :JsTest<CR>


"adds python patha so can find files when used with gf
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

"mapping using goto file
map <silent><C-F> <C-w>gf
map <silent><C-S-Up> <C-w><C-f><C-w>K
map <silent><C-S-Down> <C-w><C-f><C-w>J   
map <silent><C-S-Left> <C-w><C-f><C-w>H
map <silent><C-S-Right> <C-w><C-f><C-w>L

python << EOL
import vim
def saveandrunnose():
    vim.command(r":w")
    buffer = vim.current.buffer.number
    vim.command(r":NoseTest")
    results = vim.current.buffer
    for line in results[0:12]:
        if line[:2] == "OK":
            vim.command(r":q")
            vim.command(r"sb %s" % buffer )
            vim.command("call GreenBar()")
            print "nose tests fine"
            break
EOL

python << EOL
import vim
def saveandrunnosethis():
    vim.command(r":w")
    buffer = vim.current.buffer.number
    vim.command(r":NoseThis")
    results = vim.current.buffer
    for line in results[0:12]:
        if line[:2] == "OK":
            vim.command(r":q")
            vim.command(r"sb %s" % buffer )
            vim.command("call GreenBar()")
            print "nose this file fine"
            break

EOL

python << EOL
import vim
def saveandrunpython():
    vim.command(r":w")
    vim.command(r':silent !gnome-terminal -e "python -i %"')
EOL

python << EOL
import vim
def saveandrunipython():
    vim.command(r":w")
    vim.command(r':silent !gnome-terminal -e "ipython -i %"')
EOL

python << EOL
import vim
import re
def opentraceback():
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1] # 0 vs 1 based
    r = re.search(r"""[^"]*"([^"]*)", line ([^,]*).*""", line)
    vim.command(r":tabnew %s" % r.group(1))
    buffer = vim.current.buffer.number
    vim.command(r":q")
    if buffer in [buf.number for buf in vim.buffers]:
        vim.command(r"tab sb %s" % r.group(1))
    else:
        vim.command(r":tabnew %s" % r.group(1))
    vim.command(r":%s" % r.group(2))
EOL


python << EOL
import vim
def block_action(action):
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1] # 0 vs 1 based
    char = line[col]
    if action == "p":
        if char in ("(", '"', "'", "{", "[" ,"<") :
            vim.command(':normal "_dg%s' % (char) )
            vim.command(':normal jp')
            return
        else:
            vim.command(':normal "_dgw' )
            rownew, colnew = vim.current.window.cursor
            line = vim.current.buffer[rownew-1]
            if len(line) == colnew+1:
                vim.command(':normal p')
            elif colnew == 0:
                vim.command(':normal P')
            else:    
                vim.command(':normal jp')
            return
        
    if char in ("(", '"', "'", "{", "[" ,"<") :
        vim.command(":normal %sg%s" % (action, char) )
    else:
        vim.command(":normal %sgw" % action)
EOL

python << EOL
import vim
import re
def open_from_list():
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1] # 0 vs 1 based
    word =[]
    col = col  
    for letter in line[:col][::-1]:
        if letter in (" ","(",")","[","]"):
            break
        word.insert(0, letter)
    for letter in line[col:]:
        if letter in (" ","(",")","[","]"):
            break
        word.append(letter)

    output = "".join(word)

    pop = """'python ~/.vim/pythonlook.py %s'""" % output 
    vim.command(r"""let nose_output = system(%s)""" % pop )
    bb = vim.current.buffer
    vim.command(r""":winc l""")
    cc = vim.current.buffer
    if bb != cc:
        vim.command(":q")
    vim.command(r"""execute 'vnew'""")
    vim.command(r""":winc L""")
    vim.command(r""":vertical res 70""")
    vim.command(r"""setlocal buftype=nofile readonly modifiable""")
    vim.command(r"""silent put=nose_output""")
    vim.command(r"""keepjumps 0d""")
    vim.command(r"""setlocal nomodifiable""")
    vim.command(r""":winc h""")
EOL

python << EOL
import vim
def delete_scratch():
    cur = vim.current.buffer.number
    name = vim.current.buffer.name
    for buffer in vim.buffers:
        if buffer.name is None:
            vim.command( ":sb %s" % buffer.number)
            vim.command( ":q")
    if name is not None:
        vim.command( ":sb %s" % cur)
EOL

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
endfunction

inoremap <Tab> <C-R>=CleverTab()<CR>

function! RedBar()
    hi RedBar ctermfg=white ctermbg=red guibg=red
    echohl RedBar
    echon repeat(" ",&columns - 1)
    echohl
endfunction

function! GreenBar()
    hi GreenBar ctermfg=white ctermbg=green guibg=green
    echohl GreenBar
    echon repeat(" ",&columns - 1)
    echohl
endfunction

