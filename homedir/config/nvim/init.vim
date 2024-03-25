" config {{{
set autoindent smartindent
set autoread
set background=dark
set colorcolumn=70,80,110
set cmdheight=2
set cursorline
set expandtab
set foldmethod=syntax
set incsearch
set laststatus=2
set lazyredraw
set number
set relativenumber
set shiftwidth=4
set showmatch
set smarttab
set softtabstop=4
set tabstop=4
set scrolloff=13

let mapleader=","

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufNewFile,BufRead *.code-workspace set filetype=json
autocmd BufNewFile,BufRead *.dtrace set filetype=dtrace
" }}}

" toggle settings {{{
map <Leader>ts :setlocal spell! spelllang=en<CR>
" }}}

" plugins {{{ {{{
call plug#begin('~/.config/vim_plugs')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'github/copilot.vim'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'elixir-editors/vim-elixir'
Plug 'vim-erlang/vim-erlang-runtime'
call plug#end()
" }}}

"" fzf {{{
map <F12> :Files<CR>
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
" }}}

"" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Align '\' characters at the end of the line
let g:easy_align_delimiters = {
  \ '\': {
  \     'pattern': '\\$',
  \ },
  \ }
" }}}

"" Lignline {{{
let g:lightline = {
\   'theme': 'solarized',
\   'active': {
\       'left': [['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified']],
\       'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
\   }
\}
let g:lightline.tabline = { 'left': [ ['buffers'] ] }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
" }}}

"" NERDTree {{{
map <F7> :NERDTreeToggle<CR>
" }}}

"" TagBar {{{
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }
" }}}

"" Rainbow {{{
let g:rainbow_active = 1
" }}}

" color theme {{{
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

let g:lightline.colorscheme = 'solarized'
colorscheme solarized8
" }}}

" vim: foldmethod=marker

