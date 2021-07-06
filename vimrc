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

set cursorline

"Let quit insert mode with "kj"
inoremap kj <Esc> 

"when a file called .vimrc is written, we load ~/.vimrc
autocmd! BufWritePost .vimrc source ~/.vimrc

"yaml support
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab foldmethod=indent
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim

" Highlight redundant whitespaces and tabs.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

function RemoveTrailingSpaces()
  %s/\s\+$//
endfunction

" pulgin "rainbow": https://github.com/luochen1990/rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
