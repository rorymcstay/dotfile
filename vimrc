set nocompatible              " be iMproved, required
set backspace=2
filetype off                  " required
set wrap!

let g:clang_library_path="/usr/lib/llvm-6.0/lib/libclang-6.0.so.1"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line

Plugin 'Valloric/YouCompleteMe'
"Plugin 'plasticboy/vim-markdown'
Plugin 'vim-vdebug/vdebug'
Plugin 'cespare/vim-toml'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Vdebug
"
"let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector

"open where left off
au BufWinLeave * if &diff | diffoff | endif | mkview
au BufWinEnter ?* silent loadview

" run python script
nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
" compile latex
nnoremap <buffer> <F4> :exec '!pdflatex -synctex=1 -interaction=nonstopmode' shellescape(@%, 1)<cr> 
" compile c++
nnoremap <buffer> <F5> :exec '!cd build && make install -j32 && cd ../' shellescape(@%, 1)<cr> 
nnoremap <buffer> <F6> :exec '!./autogen-aero.sh -DCMAKE_BUILD_TYPE=Debug' shellescape(@%, 1)<cr> 

"function! DebugPy(...)
"    let g:vdebug_options['break_on_open'] = 1
"    let g:vdebug_options['continuous_mode'] = 0
"    let str_args = join(a:000, ' ')
"    "with -S it doesn't work in virtual env
    "let last_cmd = '!python -S ~/pydbgp/bin/pydbgp -d localhost:9000 -k vim_debug ' . str_args
"    let last_cmd = '!python pydbgp -d localhost:9000 -k vim_debug ' . str_args
"    execute 'silent !echo "' . str_args . '" > ~/vim.last.arg.txt &'
"    execute 'silent !echo "' . last_cmd . '" > ~/vim.last.cmd.txt &'
"    execute 'silent ' . last_cmd . ' > ~/vim.last.out.txt 2> ~/vim.last.err.txt &'
"    python3 debugger.run()
"endfunction
"command! -nargs=* -complete=file DebugPy call DebugPy('% <args>')

syntax on
filetype on

" Enable syntax highlighting for python codes
let python_highlight_all = 1
" Display line numbers in each line
set number
" Add 4 spaces for each tab
set ts=4
" Highlight the matching part of the brackets, (), {} and []
set showmatch
" It is used to control the number of tabs that will be used by vim when tab 
set hlsearch

set softtabstop=4
"It is used to control the number of columns when left or right shift is pressed
set shiftwidth=0
"It is used for automatic text wrapping
"set textwidth=79
"It is used to convert all new tab character into space
set expandtab
"It is used for adding automatic indention in vim
set autoindent
"It is used to inform vim about the file format and how to read the file
set fileformat=unix

set background=dark

"Status bar
"set statusline=
"set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
"set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
"set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
"set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
"set statusline+=\ %n\           " buffer number
"set statusline+=%#Visual#       " colour
"set statusline+=%{&paste?'\ PASTE\ ':''}
"set statusline+=%{&spell?'\ SPELL\ ':''}
"set statusline+=%#CursorIM#     " colour
"set statusline+=%R                        " readonly flag
"set statusline+=%M                        " modified [+] flag
"set statusline+=%#Cursor#               " colour
"set statusline+=%#CursorLine#     " colour
"set statusline+=" "     
"set statusline+=%{expand('%:~:h')}/
"set statusline+=\%t\                   "filepath 
"set statusline+=%=                          " right align
"set statusline+=%#CursorLine#   " colour
"set statusline+=\ %Y\                   " file type
"set statusline+=%#CursorIM#     " colour
"set statusline+=\ %3l:%-2c\         " line + column
"set statusline+=%#Cursor#       " colour
"set statusline+=\ %3p%%\                " percentage
set laststatus=2

" clang tidy script.
"let g:clang_format_path="/usr/bin/clang-tidy-10"
"map <C-K> :py3f /usr/lib/llvm-10/share/clang/run-clang-tidy.py<cr>
"imap <C-K><c-o>:py3f /usr/lib/llvm-10/share/clang/run-clang-tidy.py<cr>
" Put these lines at the very end of your vimrc file.


