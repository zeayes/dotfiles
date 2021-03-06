call plug#begin('~/.vim/plugged')


Plug 'sjl/gundo.vim'
Plug 'vim-scripts/DrawIt'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'posva/vim-vue'
Plug 'zeayes/jinja-syntax', {'for': 'jinja'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'othree/html5.vim', {'for': ['html', 'jinja']}
Plug 'ap/vim-css-color', {'for': ['css', 'scss', 'sass']}
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'sass']}
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'uarun/vim-protobuf', {'for': 'protobuf'}
Plug 'solarnz/thrift.vim', {'for': 'thrift'}

Plug 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete

Plug 'rust-lang/rust.vim', {'for': 'rust'}
let g:rustfmt_autosave = 1

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
let javascript_enable_domhtmlcss = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

Plug 'ternjs/tern_for_vim'
let g:tern_show_signature_in_pum = 1

Plug 'tpope/vim-markdown', {'for': ['markdown']}
" Plug 'suan/vim-instant-markdown'
" let g:instant_markdown_slow = 1
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}

Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

Plug 'gko/vim-coloresque'

Plug 'ntpeters/vim-better-whitespace'
autocmd BufWritePre <buffer> StripWhitespace

Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'hdima/python-syntax', {'for': 'python'}
let python_highlight_all = 1

Plug 'Valloric/MatchTagAlways'

Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

Plug 'Raimondi/delimitMate'
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
" exclude <:> matchpair
au FileType rust let b:delimitMate_quotes = "\" ' ` | %"
au FileType rust,scala,swift,go,c,cpp,java,html,javascript,css,htmldjango,proto,vue let b:delimitMate_expand_cr = 2
au FileType rust,java let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType ruby,python,go,groovy,cpp,swift,rust let b:delimitMate_matchpairs = "(:),[:],{:}"

Plug 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1  " 自动添加前置空格
au FileType python let NERDSpaceDelims = 0

Plug 'mattn/emmet-vim', {'for': ['html', 'htmldjango', 'jinja', 'xml', 'css', 'scss', 'sass', 'vue']}
let g:user_emmet_leader_key = '<C-Z>'

Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for': 'go'}
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_enabled = ['vet', 'errcheck']


Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {'main': 'CtrlPStatusFunc_1',  'prog': 'CtrlPStatusFunc_2'}

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"


Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_highlight_lines = 1
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

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
nmap nt :NERDTreeToggle<CR>
let NERDTreeWinSize=15
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\~$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$']
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeWinPos='left'
let g:nerdtree_tabs_open_on_gui_startup=0
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

Plug 'majutsushi/tagbar'
nmap tb :TagbarToggle <CR>
let tagbar_right = 1
let tagbar_width = 15
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1

Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
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
let g:ycm_python_binary_path = '/usr/local/bin/python3'
" [ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
" let g:ycm_goto_buffer_command='vertical-split'
let g:ycm_goto_buffer_command='same-buffer'
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '/Users/zeayes/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_rust_src_path = '/Users/zeayes/develop/github/rust/src'
let g:ycm_filetype_blacklist = {'tagbar' : 1, 'nerdtree' : 1}
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
" 导致vim出现卡顿现象
" nnoremap jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F2> :YcmForceCompileAndDiagnostics<CR>
if &filetype != 'go'
    nnoremap <c-d> :YcmCompleter GoToDefinition<CR>
    nnoremap <c-i> :YcmCompleter GoToInclude<CR>
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

" autocmd FileType python set formatprg=yapf
" autocmd BufWritePre *.py silent normal mzgggqG`z

Plug 'dense-analysis/ale'
let g:ale_open_list = 1
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 1
let g:ale_completion_enabled = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_go_gometalinter_options = ' --fast --disable=golint'
"let g:ale_python_flake8_options = '
"    \ --max-line-length=120 --max-complexity=12
"    \ --ignore="E127,E128,E241,E261,E701,E712,W801,C901"'
" let g:ale_linters = {'python': ['flake8']}
" let g:ale_fixers = {'python': ['autopep8']}
" let g:ale_python_pylint_options = '--disable=C0111'
let g:ale_linters = {'python': ['pylint']}
" let g:ale_fixers = {'javascript': ['eslint'], 'python': ['yapf'], 'go': ['gometalinter']}


Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|lib|include|bin|dist)|(\.(swp|ico|git|svn|sass_cache))$',
  \ 'file': '\v\.(exe|so|dll|pyc|swp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

Plug 'mileszs/ack.vim'
if executable("ag")
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
    let g:ackprg = 'rg --vimgrep'
    let g:ctrlsf_ackprg = 'rg'
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif
nmap <C-a> <ESC>:Ack
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_context = '-B 3 -A 3'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_ignore_dir = ['qbservice']
nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordPath
vmap <C-F>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

Plug 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

call plug#end()
