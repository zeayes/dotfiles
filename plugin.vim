call plug#begin('~/.vim/plugged')

" Plug 'nsf/gocode'
" Plug 'tomasr/molokai'
Plug 'vim-scripts/DrawIt'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
" Plug 'zeayes/vim-snippets'
Plug 'zeayes/jinja-syntax', {'for': 'jinja'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'othree/html5.vim', {'for': ['html', 'jinja']}
Plug 'ap/vim-css-color', {'for': ['css', 'scss', 'sass']}
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'sass']}
Plug 'cakebaker/scss-syntax.vim', {'for': ['scss']}
Plug 'evanmiller/nginx-vim-syntax'
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'maralla/completor.vim'
" Plug 'kentaroi/cocoa.vim'
" Plug 'b4winckler/vim-objc'
" Plug 'kballard/vim-swift'
" Plug 'eraserhd/vim-ios.git'
" Plug 'rhysd/vim-clang-format'
" Plug 'gilligan/vim-lldb'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-endwise'
Plug 'uarun/vim-protobuf'
Plug 'solarnz/thrift.vim', {'for': 'thrift'}
" Plug 'jeaye/color_coded'
" Plug 'rdnetto/YCM-Generator'

" Plug 'artur-shaik/vim-javacomplete2'
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

Plug 'rust-lang/rust.vim', {'for': 'rust'}
" let g:rustfmt_autosave = 1

Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
let javascript_enable_domhtmlcss = 1

Plug 'ternjs/tern_for_vim', {'for': 'javascript'}
let g:tern_show_signature_in_pum = 1

Plug 'tpope/vim-markdown', {'for': ['markdown']}
" Plug 'suan/vim-instant-markdown'
" let g:instant_markdown_slow = 1
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}

Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

Plug 'zeayes/vim-coloresque'
" let g:coloresque_keywords = ["-", "#"]

" Plug 'Chiel92/vim-autoformat'

Plug 'ntpeters/vim-better-whitespace'
autocmd BufWritePre <buffer> StripWhitespace

Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'hdima/python-syntax', {'for': 'python'}
let python_highlight_all = 1

Plug 'Valloric/MatchTagAlways'

Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

Plug 'airblade/vim-gitgutter'
let g:gitgutter_highlight_lines = 1

Plug 'Raimondi/delimitMate'
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
" exclude <:> matchpair
au FileType rust let b:delimitMate_quotes = "\" ' ` | %"
au FileType swift,go,c,cpp let b:delimitMate_expand_cr = 2
au FileType rust let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType ruby,python,go,groovy,cpp,swift let b:delimitMate_matchpairs = "(:),[:],{:}"

Plug 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1  " 自动添加前置空格
au FileType python let NERDSpaceDelims = 0

" Plug 'klen/python-mode'
" let g:pymode_lint_checkers = ['flake8']
" let g:pymode_trim_whitespaces = 0
" let g:pymode_options = 0
" let g:pymode_rope = 0

Plug 'mattn/emmet-vim', {'for': ['html', 'jinja', 'xml', 'css', 'scss', 'sass']}
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<C-Z>'
autocmd FileType html,css,scss EmmetInstall

" supported by ycm
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for': 'go'}
" au FileType go nmap dt <Plug>(go-def-tab)
" au FileType go nmap ds <Plug>(go-def-split)
" let g:go_def_mode = 'guru'
let g:go_def_mode = 'godef'
au FileType go nmap <c-d> <Plug>(go-def)
au FileType go nmap <c-e> <Plug>(go-def-pop)
" au FileType go nmap <c-d> <Plug>(go-def-vertical)
" au FileType go nmap <Leader>s <Plug>(go-implements))
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" autocmd FileType go autocmd BufWritePre <buffer> GoImports

Plug 'vim-airline/vim-airline-themes'

Plug 'bling/vim-airline'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme = 'solarized'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>

Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

Plug 'scrooloose/nerdtree'
nmap nt :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\~$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeWinPos='right'
let g:nerdtree_tabs_open_on_gui_startup=0
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

Plug 'godlygeek/tabular'
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>

Plug 'majutsushi/tagbar'
nmap tb :TagbarToggle <CR>
let tagbar_left = 1
let tagbar_width = 32
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
            \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
            \ 'r:constructor', 'f:functions' ],
            \ 'sro' : '.',
            \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
            \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }

Plug 'Valloric/YouCompleteMe', {'do': '~/.vim/plugged/YouCompleteMe/install.py --clang-completer'}
" set completeopt=longest,menu,preview
set completeopt=longest,menu
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" [ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
" let g:ycm_goto_buffer_command='vertical-split'
let g:ycm_goto_buffer_command='same-buffer'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_rust_src_path = '/usr/local/rustc-1.8.0/src'
let g:ycm_filetype_blacklist = {'tagbar' : 1, 'nerdtree' : 1}
" 导致vim出现卡顿现象
" nnoremap jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F2> :YcmForceCompileAndDiagnostics<CR>
if &filetype != 'go'
    nnoremap <c-d> :YcmCompleter GoToDefinition<CR>
    nnoremap <c-h> :YcmCompleter GoToDeclaration<CR>
    nnoremap <c-e> :YcmCompleter GoToDefinitionElseDeclaration<CR>
endif


Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsSnippetDirectories=["bundle/ultisnips/UltiSnips"]
let g:UltiSnipsEditSplit="vertical"

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

Plug 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_css_csslint_args = '--ignore=ids,box-model,gradients,duplicate-background-images'
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_scss_scss_lint_args = '--config ~/.scsslint.yml'
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers=['tidy', 'jshint']
let g:syntastic_html_tidy_quiet_messages = {"level": "warnings"}
let g:syntastic_html_tidy_ignore_errors = [
            \ 'Expected a string and instead saw',
            \ 'escaping malformed URI reference',
            \ 'trimming empty'
            \ ]
" let g:syntastic_html_tidy_args = '--show-warnings false'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '
    \ --max-line-length=120 --max-complexity=12
    \ --ignore="E127,E128,E241,E261,E701,E712,W801,C901"'
" let g:syntastic_python_checkers=['pyflakes']
" let g:syntastic_python_checkers=['pylint']
" let g:syntastic_quiet_messages = {'level': 'warning'}
let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_go_gometalinter_args = ['--fast']
" let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
let g:syntastic_swift_checkers = ['swiftlint']
" let g:syntastic_go_gometalinter_args = ['-disable deadcode']
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['java']}
highlight SyntasticErrorSign guifg=white guibg=black


Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plug 'ctrlpvim/ctrlp.vim'
" let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'r'
" let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|bin|include|lib|node_modules|.sass_cache)$',
  \ 'file': '\v\.(exe|so|dll|pyc|swp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

Plug 'mileszs/ack.vim'
if executable("ag")
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
nmap <C-a> <ESC>:Ack
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_context = '-B 3 -A 3'
let g:ctrlsf_default_root = 'project'
nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordPath
vmap <C-F>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Plug 'szw/vim-ctrlspace'
Plug 'vim-ctrlspace/vim-ctrlspace'
" set showtabline=0
nmap <C-F>s <ESC>:CtrlSpace<CR>
let g:CtrlSpaceSearchTiming = 500
let g:airline_exclude_preview = 1
hi link CtrlSpaceNormal   PMenu
hi link CtrlSpaceSelected PMenuSel
hi link CtrlSpaceSearch   Search
hi link CtrlSpaceStatus   StatusLine
if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif



Plug 'tacahiroy/ctrlp-funky'
" nmap <C-A> <ESC>:execute 'CtrlPFunky ' . expand('<cword>')<CR>
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_data_directory='~/.vim/.cache/unite'
" nnoremap <leader>u :<C-u>Unite -buffer-name=files -start-insert file_rec/async:!<CR>
nnoremap <leader>t :<C-u>Unite -buffer-name=tab tab<CR>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffer buffer<CR>
nnoremap <leader>f :<C-u>Unite -buffer-name=files -start-insert file<CR>
" nnoremap <leader>r :<C-u>Unite -buffer-name=mru -start-insert file_mru<CR>
nnoremap <leader>a :<C-u>execute "Unite -buffer-name=ack grep::" . escape(expand('<cword>'),' :\')<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    nnoremap <ESC> :UniteClose<cr>
endfunction

call plug#end()
