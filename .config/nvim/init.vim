"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dein plugin manager setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:dein_dir = expand('~/.config/nvim/dein')
let g:dein_plugin_dir = expand('~/.config/nvim/dein_plugins')

" Clone Dein of not already
if empty(glob(g:dein_dir))
    exec 'silent !mkdir -p '.g:dein_dir
    exec '!git clone https://github.com/Shougo/dein.vim.git '.g:dein_dir
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
exec 'set runtimepath^='.g:dein_dir
if dein#load_state(g:dein_plugin_dir)
    call dein#begin(g:dein_plugin_dir)
    call dein#add(g:dein_dir)

    " Plugins block start
    call dein#add('airblade/vim-gitgutter')
    call dein#add('chr4/nginx.vim')
    call dein#add('chriskempson/base16-vim')
    call dein#add('ddnomad/dockerfile.vim')
    call dein#add('editorconfig/editorconfig-vim')

    call dein#add('iamcco/markdown-preview.nvim', {
        \'on_ft': [
            \'markdown',
            \'pandoc.markdown',
            \'rmd'
        \],
        \'build': 'cd app & yarn install'
    \})

    call dein#add('jeffkreeftmeijer/vim-numbertoggle')
    call dein#add('lepture/vim-jinja')
    call dein#add('neomake/neomake')
    call dein#add('reedes/vim-pencil')
    call dein#add('RobRoseKnows/lark-vim')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('scrooloose/nerdtree')
    call dein#add('tpope/vim-markdown')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('Yggdroot/indentLine')
    " Plugins block end

  call dein#end()
  call dein#save_state()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set nocompatible
filetype plugin indent on
syntax on

" Color scheme
set t_Co=256
set termguicolors
let base16colorspace=256
colorscheme base16-default-dark

" ALlow to copy/paste from the main clipboard buffer
set clipboard=unnamed

" Just a superior way to move around
set number relativenumber
set cursorline

" Do not fold files by default
set nofoldenable

" Set display for non-printable characters
set list listchars=tab:▸\ ,trail:·,eol:¬
set showbreak=↳\ \ \ 
set cpo+=n

" Default indentation
:set tabstop=4
:set shiftwidth=4
:set expandtab

" Use terminal cursor & fonts
set guicursor=
set guifont=

" Explicitly disable modeline for security reasons
" More info: https://security.stackexchange.com/a/157739/90606
set nomodeline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific fixes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not expand tab in Golang files
autocmd Filetype go setlocal noexpandtab

" Fix Lark Parser highligting
autocmd BufRead,BufNewFile *.lark set filetype=antlr4

" Fix .conf files highlighting
autocmd BufRead,BufNewFile *.conf set filetype=texmf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
map <F3> :set spell!<CR>
map <F4> :noh<CR>
map <F5> :MarkdownPreview<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='base16'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols={}
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IndentLine plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost,BufEnter * Neomake

let g:neomake_error_sign={'text': "\uf00d", 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign ={'text': "\uf12a", 'texthl': 'NeomakeWarningSign'}
let g:neomake_info_sign ={'text': "\uf129", 'texthl': 'NeomakeInfoSign'}
let g:neomake_message_sign ={'text': "\uf129", 'texthl': 'NeomakeMessageSign'}

let g:neomake_python_python_exe='/usr/local/bin/python3'
let g:neomake_python_enabled_makers=[
    \'python',
    \'pylama',
    \'flake8',
    \'pyflakes',
    \'pycodestyle',
    \'pydocstyle',
    \'pylint'
\]

let g:neomake_go_enabled_makers= ['go', 'gometalinter', 'golint']

let g:neomake_javascript_enabled_makers= ['eslint', 'stylelint']
let g:neomake_typescript_enabled_makers= ['tsc', 'tslint', 'eslint']

" FIXME: For some reason adding 'clippy' as another maker does not work
let g:neomake_rust_enabled_makers=['cargo', 'cargotest', 'rustc']
autocmd BufWritePost,BufEnter *.rs Neomake! clippy


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pencil plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType markdown,md,mkd,text call pencil#init({'wrap': 'hard'})
let g:airline_section_x = '%{PencilMode()}'
let g:pencil#textwidth = 80
