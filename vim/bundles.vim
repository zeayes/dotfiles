set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'cespare/vim-golang'
Bundle 'jstemmer/gotags'
Bundle 'dgryski/vim-godef'
Bundle 'nsf/gocode'
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/emmet-vim'

Bundle 'scrooloose/nerdtree'
nmap nt :NERDTree<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

Bundle 'majutsushi/tagbar'
nmap tb :TagbarToggle<CR> 
let g:tagbar_autofocus = 1

Bundle 'vim-scripts/taglist.vim'
nmap tl :Tlist<CR><c-l>
let Tlist_Show_One_File = 1 
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Sort_Type = "name" 

Bundle 'Valloric/YouCompleteMe'
set completeopt=longest,menu
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_confirm_extra_conf=0 
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2	
let g:ycm_cache_omnifunc=0	
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 

Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories=["bundle/ultisnips/UltiSnips"]
let g:UltiSnipsEditSplit="vertical"

Bundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1                        " 自动添加前置空格

Bundle 'Raimondi/delimitMate'
au FileType python let b:delimitMate_nesting_quotes = ['"']

Bundle 'hdima/python-syntax'
let python_highlight_all = 1

Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black
