call plug#begin()
  Plug 'scrooloose/syntastic'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-rails'
  Plug 'shaunsingh/nord.nvim'
  Plug 'tpope/vim-fugitive'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme nord

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=35
au VimEnter *  NERDTree " Open tree view on vim enter

let g:ctrlp_dont_split = 'NERD'

nmap <Leader>' :NERDTreeToggle<CR>

map q :q<CR>
map w :w<CR>

" nnoremap <silent> <C-Right> :bn<CR>
" nnoremap <silent> <C-Left> :bp<CR>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
