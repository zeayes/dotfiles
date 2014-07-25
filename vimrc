source ~/.vim/bundles.vim

syntax enable
set background=dark
"配色方案
colorscheme desert
"设置语法高亮
syntax on
"set colorcolumn=4,80
"set modeline
set textwidth=120
"启用行号
set nu
"禁用相对行号
"set nornu
"显示当前模式
set showcmd
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
filetype on
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
map <F5> :call CompileRun()<CR>
func CompileRun()
    exec "w!"
    if &filetype == 'c'
        exec "!gcc % -g -std=c99 "
        exec "!./a.out"
    elseif &filetype == 'cpp'
        exec "!g++ % -g "
        exec "!./a.out"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'go'
        exec "!go run %"
    elseif &filetype == 'sh'
        exec "!bash %"
    elseif &filetype == 'lua'
        exec "!lua %"
    elseif &filetype == 'javascript'
        exec "!node %"
    endif
endfunc
autocmd BufNewFile *.py :call append(0, "\# -*- coding: utf-8 -*-")
autocmd BufNewFile *.lua :call append(0, "\#!/usr/local/bin/lua")
autocmd BufNewFile *.sh :call append(0, "\#!/bin/bash")
autocmd BufRead,BufNewFile *.go set filetype=go
autocmd BufRead,BufNewFile *.html set filetype=html
autocmd FileType javascript set tabstop=2 autoindent shiftwidth=2
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd FileType make set noexpandtab
""""""""""""""""""""""""""""插件配置""""""""""""""""""""""""""""
"Taglist
map <silent> tl :TlistToggle<CR>
map <silent> cp "+p<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"MiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:indent_guides_guide_size=1
nmap <F8> :TagbarToggle<CR>
let g:godef_split=0
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
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pyflakes', 'pep8', 'pylint', 'flake8']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721  --max-line-length=84'
let g:flake8_ignore="E501,W293,W191"
let g:flake8_max_line_length=99

let g:SuperTabDefaultCompletionType="context"

let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
