" Define Dein dirs
let g:dein_dir = expand('~/.config/nvim/dein')
let g:dein_plugin_dir = expand('~/.config/nvim/dein_plugins')

" Clone Dein of not already
if empty(glob(g:dein_dir))
  exec 'silent !mkdir -p '.g:dein_dir
  exec '!git clone https://github.com/Shougo/dein.vim.git '.g:dein_dir
endif

exec 'set runtimepath^='.g:dein_dir

" Plugins
if dein#load_state(g:dein_plugin_dir)
  call dein#begin(g:dein_plugin_dir)
  call dein#add(g:dein_dir)

  call dein#add('chriskempson/base16-vim')
  call dein#add('neomake/neomake')
  call dein#add('ddnomad/dockerfile.vim')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('gabrielelana/vim-markdown')
  call dein#add('andrewferrier/vim-wrapping-softhard')
  call dein#add('jeffkreeftmeijer/vim-numbertoggle')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('scrooloose/nerdtree')
  call dein#add('kien/ctrlp.vim')
  call dein#add('nathanaelkane/vim-indent-guides')

  call dein#end()
  call dein#save_state()
endif

" Color scheme
let base16colorspace=256
colorscheme base16-default-dark

" General usability
set number relativenumber
set guicursor=  " TODO: Make sense of this option
set modeline  " TODO: Make sense  of this option
set encoding=utf8
set list listchars=tab:▸\ ,trail:·,eol:¬
set clipboard=unnamed
set nocompatible
filetype plugin indent on  " TODO: Make sense of this option
syntax on  " TODO: Make sense of this option (in this context)

" Mac specific fix
set t_Co=256  " TODO:
set termguicolors  " TODO:

" Default indentation
:set tabstop=4
:set shiftwidth=4
:set expandtab

" Go specific indentation
autocmd Filetype go setlocal noexpandtab

" Show soft linebreaks
set showbreak=↳\ \ \ 
set cpo+=n  " TODO: Make sense of this option

map <F2> :NERDTreeToggle<CR>
map <F3> :set spell!<CR>
map <F4> :noh<CR>
map <F5> :IndentGuidesToggle<CR>

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_python_enabled_makers= ['python', 'pylama', 'flake8', 'pyflakes', 'pycodestyle', 'pydocstyle', 'pylint']
let g:neomake_go_enabled_makers= ['go', 'gometalinter', 'golint']

" Markdown
let g:markdown_enable_conceal=1

let g:airline_theme='base16'

" Templates (Skeletons)
" TODO: https://github.com/pgilad/vim-skeletons -- integrate
