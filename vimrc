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
nnoremap <C-n> :NERDTreeToggle<CR>

" Leader C is the prefix for code related mappîngs
noremap <silent> <Leader>cc :TComment<CR>

" absolute width of netrw window
" Leader F is for file related mappîngs (open, browse...)
"nnoremap <silent> <Leader>f :CtrlP<CR>
"nnoremap <silent> <Leader>fm :CtrlPMRU<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl B for buffer related mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cycle between buffer
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" Creat (N)ew buffer
nnoremap <silent> <Leader>bb :bn<CR>
nnoremap <silent> <Leader>bp :bp<CR>
nnoremap <silent> <C-k> :bp<CR>
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-c> :q<CR>

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
let g:syntastic_check_on_open = 0                               "syntastic
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

set ts=2
set noexpandtab

" Cscope related settings
if has('cscope')
		set cscopetag cscopeverbose

		if has('quickfix')
				set cscopequickfix=s-,c-,d-,i-,t-,e-
		endif

		cnoreabbrev csa cs add
		cnoreabbrev csf cs find
		cnoreabbrev csk cs kill
		cnoreabbrev csr cs reset
		cnoreabbrev css cs show
		cnoreabbrev csh cs help

		"command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" s: Find this C symbol
nmap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>

" g: Find this definition
nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>

" d: Find functions called by this function
nmap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>

" " c: Find functions calling this function
nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>

" " t: Find this text string
nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>

" " e: Find this egrep pattern
nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>

" " f: Find this file
nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>

" " i: Find files #including this file
nmap <leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

" Horizontal Split
nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Vertical Split
nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

" move in the tag list
nmap <leader>q :cp<CR>
nmap <leader>w :cn<CR>

" tab management
nmap <leader>tn :tabnew<CR>
nmap <leader>tc :tabclose<CR>
nmap <leader>m :tabNext<CR>

" Change window resize
nmap <leader>ri :vertical resize +10<CR>
nmap <leader>rd :vertical resize -10<CR>
