set t_Co=256"

set ts=4
set sw=4
set sts=4
set expandtab
set autoindent
set hlsearch
set smartcase

set incsearch
set ignorecase
set cindent shiftwidth=2
set wildmode=list:longest
set fileencoding=utf8
" always show ^M in DOS files
set fileformats=unix
syntax on

set backspace=indent,eol,start
set laststatus=2
set ruler
set showcmd
set scrolloff=1
set sidescrolloff=5

"Let quit insert mode with "kj"
inoremap kj <Esc> 

"when a file called .vimrc is written, we load ~/.vimrc
autocmd! BufWritePost .vimrc source ~/.vimrc

" Highlight redundant whitespaces and tabs.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

function RemoveTrailingSpaces()
  %s/\s\+$//
endfunction
