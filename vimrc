" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"  You will load your plugin here
"  Make sure you use single quotes
" Initialize plugin system
"
Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
"Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'

call plug#end()

" Change leader
let mapleader = ','

" map keys
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Leader C is the prefix for code related mappîngs
noremap <silent> <Leader>cc :TComment<CR>

" absolute width of netrw window
" Leader F is for file related mappîngs (open, browse...)
nnoremap <silent> <Leader>f :CtrlP<CR>
nnoremap <silent> <Leader>fm :CtrlPMRU<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl B for buffer related mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cycle between buffer
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" Creat (N)ew buffer
nnoremap <silent> <Leader>bb :bn<CR>
nnoremap <silent> <Leader>bp :bp<CR>

" (D)elete the current buffer
nnoremap <silent> <Leader>bd :bdelete<CR>

" (U)nload the current buffer
nnoremap <silent> <Leader>bu :bunload<CR>

" (L)ock the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR>

" Color scheme
"let g:solarized_contrast="high" "vim-colors-solarized
"set background=dark
" colorscheme solarized 
colorscheme elflord

" reloads .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

if !has('gui_running')
	set t_Co=256
endif

let g:lightline = { 'colorscheme': 'wombat', }               "vim-lightline
set laststatus=2                                                "vim-lightline
set noshowmode                                                  "vim-lightline

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set statusline+=%#warningmsg#                                   "syntastic
set statusline+=%{SyntasticStatuslineFlag()}                    "syntastic
set statusline+=%*                                              "syntastic

let g:syntastic_always_populate_loc_list = 1                    "syntastic
let g:syntastic_auto_loc_list = 1                               "syntastic
let g:syntastic_check_on_open = 1                               "syntastic
let g:syntastic_check_on_wq = 0                                 "syntastic

vnoremap <silent> <Leader>cee    :Tabularize /=<CR>              "tabular
vnoremap <silent> <Leader>cet    :Tabularize /#<CR>              "tabular
vnoremap <silent> <Leader>ce     :Tabularize /

" make backspaces delete sensibly
set backspace=indent,eol,start

set autowrite

" Invisible charachters
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Ignore case when search patter is all in lower case
set smartcase
set ignorecase

set backupdir=~/.vim/tmp/    "for backup files
set directory=~/.vim/tmp/    "for swap files

" WIll prompt sudo to write otherwise non writable file
cmap w!! %!sudo tee > /dev/null %

set ts=4
set noexpandtab
