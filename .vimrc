"gvim options to get rid of title and add tabs all the time.
set nocompatible
call pathogen#helptags()
call pathogen#runtime_append_all_bundles() 
set guioptions-=m
set guioptions-=T
set gfn=monospace\ 10
set showtabline =2 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)
set laststatus=2
let leave_my_cursor_position_alone=1
set enc=utf-8
set backspace=2
:inoremap jj <esc>


:noremap ,sS :call SwapParams("forwards")<cr>
map ,ss @=',sS'<cr>

:noremap ,,S :call SwapParams("backwards")<cr>
map ,,s @=',,S'<cr>

"vimwiki

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Dropbox/vimwiki_html/', 'auto_export': 1}]
set dir=~/tmp

let space_no_jump=1

:inoremap <c-h> <LEFT>
:inoremap <c-k> <UP>
:inoremap <c-l> <RIGHT>
:inoremap <c-j> <DOWN>
:cnoremap <c-h> <LEFT>
:cnoremap <c-l> <RIGHT>

:cnoremap <m-l> <END>
:cnoremap <m-h> <HOME>
:inoremap <m-l> <END>
:inoremap <m-h> <HOME>

:inoremap <m-k> <PageUp>
:inoremap <m-j> <PageDown>

:nnoremap <S-RIGHT> :cn<cr>
:nnoremap <S-LEFT> :cp<cr>

:nnoremap K <C-U>
:nnoremap J <C-D>
:nnoremap L <End>
:nnoremap H <Home>
:vnoremap K <C-U>
:vnoremap J <C-D>
:vnoremap L <End>
:vnoremap H <Home>
:onoremap K <C-U>
:onoremap J <C-D>
:onoremap L <End>
:onoremap H <Home>

:noremap <m-k> gg
:noremap <leader>k gg
:noremap <m-j> G
:noremap <leader>j G


:noremap <m-h> :tabprevious<CR>
:noremap <leader>h :tabprevious<CR>
:noremap <m-l> :tabnext<CR>
:noremap <leader>l :tabnext<CR>

:noremap <c-s> :w<CR>
:noremap <m-s> :wa<CR>
:noremap <c-q> :q<CR>
:noremap <m-q> :qa<CR>

:noremap <M-p> "+p
:noremap <M-y> "+y

:noremap <C-b> gJ

:noremap <C-d> :call BlockAction('id')<CR>
:noremap <C-p> :call BlockAction('ip')<CR>
:noremap <C-y> :call BlockAction('iy')<CR>


:noremap <leader>c :call BlockAction('ic')<CR>
:noremap <leader>d :call BlockAction('id')<CR>
:noremap <leader>p :call BlockAction('ip')<CR>
:noremap <leader>y :call BlockAction('iy')<CR>

:noremap <leader><leader>c :call BlockAction('ac')<CR>
:noremap <leader><leader>d :call BlockAction('ad')<CR>
:noremap <leader><leader>p :call BlockAction('ap')<CR>
:noremap <leader><leader>y :call BlockAction('ay')<CR>

:noremap <leader><leader>s :set spell<CR>
:noremap <leader><leader>S :set nospell<CR>
:noremap <leader>s z=

:nnoremap <CR> g<c-]>
:nnoremap <BS> <c-t>
:nnoremap <c-cr> :tab sts<cr>
"some less odd potentially useful keybindings for working with tabs and
"windows
nnoremap <silent><A-Right> :tabnext<CR>
nnoremap <silent><A-Left> :tabprevious<CR>

"open new things
nnoremap <C-T> :tabnew 
nnoremap <C-N> :vnew 

"navigate windows
nnoremap <silent><C-Up> <C-w>W
nnoremap <silent><C-Down> <C-w>w
nnoremap <silent><C-left> :tabprevious<CR>
nnoremap <silent><C-Right> :tabnext<CR>
"navigate using my wierd bindings
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-l> <C-w>l
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k

" local or local window competion only
"inoremap <C-SPACE> <C-x><C-l>
set complete=.,w,] "b potentially if want all buffers

"tlist
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
map <leader>tl :TlistToggle<CR>

"nerd tree
map <leader>dt :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

"fuzzy


noremap ,,t :FufTag!<cr>
noremap ,t :FufBufferTagAll!<cr>
noremap ,tt :FufBufferTag!<cr>
noremap <c-o> :FufFile!**/<cr>
noremap <c-u> :FufMruFile!<cr>

let g:fuf_mrufile_maxItem = 1000
let g:fuf_mrucmd_maxItem = 400
let g:fuf_modesDisable = []
let g:fuf_keyOpenTabpage = '<cr>'
let g:fuf_keyOpen = '<c-o>'
let g:fuf_keyOpenVsplit = '<C-l>'
let g:fuf_mrufile_exclude = '\.tmp$'
let g:fuf_mrufile_keyExpand = '<c-u>'

"no jump for space
let g:space_no_jump = 1
let g:space_no_search = 1
"basic options
syntax on
set hlsearch
set mouse=""
filetype plugin indent on
set completeopt=menu,longest
set wildmode=longest,list
colorscheme = wombat
set tags=./../tags,./tags,./../../tags,./../../../tags
set switchbuf=usetab,useopen 
"runstuff
map <F5> :py saveandrunpython()<CR>
map <C-F5> :py saveandrunipython()<CR>
map <F6> :py saveandrunnose()<CR>
map <F4> :py saveandrunnosethis()<CR>
map <F9> :py opentraceback()<CR>
map <C-F3> :py openjslint()<CR>
map <F8> :GitCommit -a<CR>
map <F10> :py open_from_list()<CR>
map <C-F10> :py delete_scratch()<CR>
map <F3> :Jslint<CR>

map <c-F2> :silent !gnome-terminal -e "java -jar /home/david/.vim/JsTestDriver-1.2.jar --port 9876 --browser firefox-3.6 --captureConsole "<CR>

map <F2> :JsTest<CR>

map <leader>cd :cd %:p:h<CR>

noremap <leader>cn g,
noremap <leader>cp g;
noremap <leader>cl g;
noremap <leader>cf g,
noremap <leader>cb g;

noremap <leader>hf <C-i>
noremap <leader>hb <C-o>
noremap <leader>hl <C-o>
noremap <leader>hn <C-i>
noremap <leader>hp <C-o>

noremap <leader>/ :PyFind 



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
def weeee():
    buf = vim.current.buffer
    x1, y1 = buf.mark("<")
    x2, y2 = buf.mark(">")
    print x1, y1
    print x2, y2


    lines = []
    for line in buf[x1-1:x2]:
        lines.append(line)

    first_line_sel = lines[0][y1:]
    end_line_sel = lines[-1][:y2+1]

    new_lines = first_line_sel[:y1]


    print lines


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
import re
def openjslint():
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1] # 0 vs 1 based
    r = line.split(",")
    vim.command(r":tabnew %s" % r[0])
    buffer = vim.current.buffer.number
    vim.command(r":q")
    if buffer in [buf.number for buf in vim.buffers]:
        vim.command(r"tab sb %s" % r[0])
    else:
        vim.command(r":tabnew %s" % r[0])
    vim.command(r":%s" % (int(r[1]) + 1))
EOL


if (exists("*SaveAndSource") == 0)
    fu SaveAndSource()
        :w
        :source %
    endf
endif


fu! BlockAction(action)
 	let current = getline(".")[col(".") - 1]
    let cur_col = col(".")
    let cur_line = line(".")
    let all_braces = ["(", '"', "'", "{", "[" ,"<"]
    if (a:action[1] == "p")
        if (count(all_braces, current) == 1)
            exe 'normal "_d'. a:action[0] . current
        else
            exe 'normal "_d' . a:action[0] . "w" 
        endif
        let cur_col_new = col(".")
        let cur_line_new = line(".") 
        let line_len = len(getline("."))
        let new_char = getline(".")[col(".") - 1]
        if (cur_col_new != line_len || cur_col == line_len || new_char != " ")
            normal P
        else
            normal p
        endif
    else
        if (count(all_braces, current) == 1) 
            exe ":normal " . a:action[1] . a:action[0] . current
        else
            exe ":normal " . a:action[1] . a:action[0] . "w"
        endif
    endif
endf

map ,,, :call SaveAndSource()<cr>

python << EOL
import vim
def block_action(action):
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1] # 0 vs 1 based
    char = line[col]
    if action == "p":
        if char in ("(", '"', "'", "{", "[" ,"<") :
            vim.command(':normal "_dg%s' % (char) )
            vim.command(':normal P')
            return
        else:
            vim.command(':normal "_dgw' )
            rownew, colnew = vim.current.window.cursor
            line = vim.current.buffer[rownew-1]
            if col == colnew or colnew <> len(line)-1:
                vim.command(':normal P')
            else:
                vim.command(':normal p')
            return
        
    if char in ("(", '"', "'", "{", "[" ,"<") :
        vim.command(":normal %sg%s" % (action, char) )
    else:
        vim.command(":normal %sgw" % action)
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

function! PyFindFunc(find)
    exec ":vim " . a:find . " " . "**/*.py"
endfunction

command! -nargs=1 PyFind call PyFindFunc(<q-args>)

autocmd BufWriteCmd *.js,*.html,*.css,*.gtpl :call Refresh_firefox()

function! Refresh_firefox()
    if &modified
        write
        silent !echo  'vimYo = content.window.pageYOffset;
                     \ vimXo = content.window.pageXOffset;
                     \ BrowserReload();
                     \ content.window.scrollTo(vimXo,vimYo);
                     \ repl.quit();'  |
                     \ nc -q 1 localhost 4242 2>&1 > /dev/null
    endif
endfunction 



set enc=utf-8
