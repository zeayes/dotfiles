set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'Valloric/YouCompleteMe'
Bundle 'zeayes/vim-golang'
Bundle 'SirVer/ultisnips'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'klen/python-mode'
Bundle 'jstemmer/gotags'
Bundle 'nsf/gocode'
Bundle 'taglist.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'sjl/gundo.vim'


set backspace=indent,eol,start
filetype plugin indent on     " required!
"设置语法高亮
syntax on
"配色方案
colorscheme desert
"启用行号
set nu
"显示当前模式
set showcmd
"在左下角显示当前文件所在的行
set ruler
"显示修改次数
set report=0
"行高亮
"set cursorline
"启用鼠标
set mouse=v
"设定tab长度
set tabstop=4
"空格代替tab
set expandtab
"设定<<和>>命令移动时的宽度
set shiftwidth=4
"显示TAB字符威<+++
"set list
"set listchars=tab:<+
"输入搜索内容时就显示搜索结果
set incsearch
"搜索时高亮显示被找到的文本
set hlsearch
"搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase
"禁止在搜索到文件两端时重新搜索
set nowrapscan
"输入括号时短暂跳到与之匹配处
set showmatch
"匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>
"覆盖文件时不备份
set nobackup
"不产生swp文件
set nowb
"自动切换目录为当前文件所在的目录
set autochdir
"启用自动缩进，并设置自动缩进的宽度为4
set autoindent shiftwidth=4
"为C程序提供自动缩进
set smartindent
"使用C风格的缩进方案
set cindent
"显示制表位（ctrl+i）和 行尾标志（$）
"set list
"侦测文件类型
filetype off
"载入文件类型插件
filetype plugin on
"为特定文件类型载入相关缩进文件
filetype indent on
"显示所用的编码（取决于“LANG环境变量”）
set encoding=utf-8
set fileformats=unix,dos
"vim自动判断文件的编 码时尝试的顺序
set fileencodings=utf-8,gb2312,cp936,big5,euc-jp,euc-kr,latin1,ucs-bom
"让汉字以2个宽度显示
set ambiwidth=double
"设置帮助的语言为中文
set helplang=cn
"输出到客户终端（Term）采用的编码类型
set termencoding=utf-8
"与windows共享剪贴板
"设置默认的缓冲寄存器为"*
"set clipboard+=unnamed
set clipboard=unnamed
"状态行显示的内容
hi User1 ctermfg=gray
hi User2 ctermfg=red
hi User3 ctermfg=white
hi StatusLine ctermbg=DarkBlue
set statusline=%f%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"总是现实状态行
set laststatus=2
"设置按缩进折叠
set foldmethod=indent
"设置折叠深度
set foldnestmax=3
"默认不折叠
set nofoldenable
"""""""""""""""""""""自定义函数"""""""""""""""""""""""
"运行程序
func CompileRun()
    exec "w!"
    if &filetype == 'c'
        exec "!gcc % -g "
        exec "!a.out"
    elseif &filetype == 'cpp'
        exec "!g++ % -g "
        exec "!a.out"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'sh'
        exec "!bash %"
    elseif &filetype == 'go'
        exec "!go run %"
    endif
endfunc
map <F5> :call CompileRun()<CR>
"添加文件说明
autocmd BufNewFile *.py :call append(0, "\# -*- coding: utf-8 -*-")
autocmd BufNewFile *.sh :call append(0, "\#!/bin/bash")
"重新打开文件
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufRead,BufNewFile *.go set filetype=go
"autocmd VimEnter * NERDTreeToggle
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :TagbarToggle<CR>
""""""""""""""""""""""""""""插件配置""""""""""""""""""""""""""""
"Taglist
"<leader>t 打开TagList窗口，窗口在右边
map <silent> tl :TlistToggle<CR>
"保持格式的跨文件复制
nmap cp "+p
set pastetoggle=<F10>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721  --max-line-length=84'
let g:flake8_ignore="E501,W293,W191"
let g:flake8_max_line_length=99
let g:SuperTabDefaultCompletionType="context"
"let g:airline#extensions#tabline#enabled = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
