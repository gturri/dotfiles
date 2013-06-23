set t_Co=256"

set ts=4
set sw=4
set sts=4
set expandtab
set autoindent
set hlsearch

set incsearch
set ignorecase
set cindent shiftwidth=2
set wildmode=list:longest
set fileencoding=utf8
" always show ^M in DOS files
set fileformats=unix
syntax on

"Let quit insert mode with "kj"
inoremap kj <Esc> 

"when a file called .vimrc is written, we load ~/.vimrc
autocmd! BufWritePost .vimrc source ~/.vimrc
