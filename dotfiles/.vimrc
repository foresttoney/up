let mapleader = "\<Space>" " Remap leader to space bar

map <leader>wh :wincmd h<CR>
map <leader>wj :wincmd j<CR>
map <leader>wk :wincmd k<CR>
map <leader>wl :wincmd l<CR>

set autoread                      " automatic refresh
set backspace=indent,eol,start    " set expected backspace behavior
set clipboard=unnamed,unnamedplus " use sysem clipboard
set cursorline                    " highlight current line
set expandtab                     " replace <Tab> with spaces
set encoding=utf-8                " set encoding to UTF-8
set foldmethod=manual             " use manual folding
set lazyredraw                    " only redraw when necessary 
set mouse=                        " disable mouse
set noswapfile                    " disable creating *.swp files
set number                        " show line numbers
set shiftwidth=2                  " set number of columns with << and >> 
set showmatch                     " highlight matching braces [{()}]
set softtabstop=2                 " set number of columns with <Tab> in insert mode
set tabstop=2                     " set number of columns with <Tab> 

" Laod filetype-specific indent files
autocmd BufEnter * lcd %:p:h      

" Set cwd to current buffer
filetype indent on

" Enable syntax processing 
syntax enable

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Initialize Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
	let g:NERDTreeMinimalUI = 1
	nmap <leader>nf :NERDTreeFind<cr>
	nmap <leader>nt :NERDTreeToggle<cr>

Plug 'valloric/youcompleteme', { 'do': './install.py' }

Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

	" Set ignore files for ctrlP
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(bower_components|_build|deps|elm-stuff|git|node_modules|pub|vendor)$',
		\ 'link': 'manager'
		\ }

	" Use ag for ctrlP
	if executable('ag')
		set grepprg=ag\ --nogroup\ --nocolor
		let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	endif

	nmap <leader>f :CtrlP<cr>

Plug 'tpope/vim-fugitive'
  let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gs :Gstatus<CR>

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/syntastic'
	let g:syntastic_enable_elixir_checker = 0
	let g:syntastic_elixir_checkers = ['elixir']
	let g:syntastic_javascript_checkers = ['eslint']
	let g:syntastic_python_checkers = ['flake8']
	let g:syntastic_vim_checkers = ['vint']

Plug 'junegunn/goyo.vim'

Plug 'elmcast/elm-vim'
  let g:elm_format_autosave = 1

Plug 'mattn/emmet-vim'
  let g:user_emmet_expandabbr_key = '<c-e>'

Plug 'elixir-lang/vim-elixir'

Plug 'slashmili/alchemist.vim'

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'StanAngeloff/php.vim'

Plug 'hynek/vim-python-pep8-indent'

Plug 'joonty/vdebug'

Plug 'rust-lang/rust.vim'

Plug 'majutsushi/tagbar'
	nmap <leader>ttb :TagbarToggle<cr>

Plug 'jiangmiao/auto-pairs'

Plug 'alvan/vim-closetag'

Plug 'wikitopian/hardmode'

Plug 'vim-airline/vim-airline'
  set laststatus=2

Plug 'vim-airline/vim-airline-themes'

Plug 'raichoo/purescript-vim'

Plug 'FrigoEU/psc-ide-vim'
  au FileType purescript nmap <leader>mia :PSCIDEimportIdentifier<CR>
  au FileType purescript nmap <leader>miq :PSCIDEaddImportQualifications<CR>
  au FileType purescript nmap <leader>mia :PSCIDEaddTypeAnnotation<CR>
  au FileType purescript nmap <leader>mgg :PSCIDEgoToDefinition<CR>
  au FileType purescript nmap <leader>mcs :PSCIDEcaseSplit<CR>
  au FileType purescript nmap <leader>ms :PSCIDEstart<CR>
  au FileType purescript nmap <leader>me :PSCIDEend<CR>

call plug#end()
