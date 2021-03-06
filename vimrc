" Use bundles {
if filereadable(expand("~/.vim/plugin.vim"))
    source ~/.vim/plugin.vim
endif
"}

syntax enable
" 配色方案
set t_Co=256
" set termguicolors
set background=dark
colorscheme solarized
" colorscheme desert
" colorscheme molokai
" 设置语法高亮
syntax on
set nocompatible
set hidden
"set colorcolumn=4,80
"set modeline
set history=700
set textwidth=120
set backspace=indent,eol,start
set showmode
set linespace=0
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
" 启用行号
set number
" 禁用相对行号
set nornu
" set relativenumber
" 光标离上下3行滚动
set scrolloff=3
" 显示当前模式
set showcmd
" 行高亮
set cursorline
" 列高亮
set cursorcolumn
" 启用鼠标
set mouse=v
" 输入时隐藏鼠标
set mousehide
" 设定tab长度
set tabstop=4
" 空格代替tab
set expandtab
"设定<<和>>命令移动时的宽度
set shiftwidth=4
" backspace delete indent
set softtabstop=4
" 显示TAB字符威<+++
" set list
" set listchars=tab:<+
" 输入搜索内容时就显示搜索结果
set incsearch
" 搜索时高亮显示被找到的文本
set hlsearch
" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase
" 禁止在搜索到文件两端时重新搜索
set nowrapscan
" 禁止拆行
set nowrap
" 输入括号时短暂跳到与之匹配处
set showmatch
" 匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>
" 覆盖文件时不备份
set nobackup
"不产生swp文件
set nowb
" 自动切换目录为当前文件所在的目录
set autochdir
" 启用自动缩进
set autoindent
" 为C程序提供自动缩进
set smartindent
" 使用C风格的缩进方案
set cindent
" set breakindent
set showbreak=>>>
" vsplit分屏显示在右边
set splitright
" split分屏显示在下面
set splitbelow
" 检测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 显示所用的编码（取决于“LANG环境变量”）
set encoding=utf-8
scriptencoding utf-8
set fileformats=unix,dos
" vim自动判断文件的编码时尝试的顺序
set fileencodings=utf-8,gb2312,cp936,big5,euc-jp,euc-kr,latin1,ucs-bom
set wildignore=*.o,*~,*.pyc,*.bin,#*#
set wildignore+=*/.git/*,*/.DS_Store
" 让汉字以2个宽度显示
" set ambiwidth=double
" 设置帮助的语言为中文
set helplang=cn
" 输出到客户终端（Term）采用的编码类型
set termencoding=utf-8
" 总是显示装态行
set laststatus=2
" set showtabline=2
" 格式化粘贴，设置默认的缓冲寄存器为
set clipboard=unnamed
set pastetoggle=<F3>
" J合并行时以一个空格分割
set nojoinspaces
" 设置按缩进折叠
set foldmethod=indent
" 设置折叠深度
set foldnestmax=3
" 默认不折叠
set nofoldenable
" set foldenable
" 设置split跳转快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"""""""""""""""""""""自定义函数"""""""""""""""""""""""
map <F5> :call CompileRun()<CR>
function! CompileRun()
    exec "w!"
    if &filetype == 'c'
        exec "!gcc % -g -std=c99 && ../a.out"
    elseif &filetype == 'cpp'
        exec "!g++ % -g && ./a.out"
    elseif &filetype == 'objc'
        exec "!clang -fobjc-arc % && ./a.out"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'java'
        exec "!javac % && java %:r"
    elseif &filetype == 'scala'
        exec "!scalac % && scala %:r"
    elseif &filetype == 'ruby'
        exec "!ruby %"
    elseif &filetype == 'swift'
        exec "!xcrun swift %"
    elseif &filetype == 'go'
        exec "!go run %"
    elseif &filetype == 'sh'
        exec "!bash %"
    elseif &filetype == 'lua'
        exec "!lua %"
    elseif &filetype == 'php'
        exec "!php %"
    elseif &filetype == 'rust'
        exec "!rustc % && ./%:r"
    elseif &filetype == 'vim'
        source %
    elseif &filetype == 'javascript'
        exec "!node %"
    endif
endfunction

autocmd BufNewFile *.sh :call append(0, "\#!/bin/bash")
autocmd BufNewFile *.py :call append(0, "\# -*- coding: utf-8 -*-")
autocmd BufNewFile *.rb :call append(0, "\# -*- coding: utf-8 -*-")
autocmd BufNewFile *.css :call append(0, '@charset "utf-8;"')
" autocmd BufNewFile *.scss :call append(0, '@charset "utf-8;"')
" autocmd BufNewFile *.sass :call append(0, '@charset "utf-8;"')
autocmd BufNewFile *.lua :call append(0, "\#!/usr/local/bin/lua")
" autocmd BufNewFile *.swift :call append(0, "#!/usr/bin/env swift")
autocmd FileType make set noexpandtab
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
autocmd BufNewFile,BufRead *.h,*.m set filetype=objc | set makeprg=clang\ -fobjc-arc\ -o\ %:r\ %:p
autocmd BufNewFile,BufRead *.mm set filetype=objcpp
autocmd BufNewFile,BufRead *.asm set filetype=nasm
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" autocmd BufNewFile,BufReadPost *.vue set filetype=html
" reset iskeyword and add - to iskeyword
augroup Frontend
    au!
    autocmd FileType vue,xml,css,scss,sass,html,htmldjango,javascript set iskeyword& | set iskeyword+=-
    autocmd FileType vue,xml,css,scss,sass,html,htmldjango,javascript setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
    autocmd BufRead,BufNewFile *.scss set filetype=scss.css
augroup END
" autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
" autocmd FileType python autocmd BufWritePre <buffer> %!yapf
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" change the mapleader from \ to ,
" let mapleader=","
" 十六进制格式查看
nmap <leader>16 <ESC>:%!xxd<ESC>
" 返回普通格式
nmap <leader>r16 <ESC>:%!xxd -r<ESC>
