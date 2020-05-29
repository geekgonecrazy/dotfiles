set nocompatible              " be iMproved, required
filetype off                  " required

syntax on
set number
set paste

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'scrooloose/nerdtree' " file drawer

" Add your plugin entries bellow this line

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin Settings
"close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>

" map fuzzyfinder (CtrlP) plugin
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" CtrlP ignore patterns
 let g:ctrlp_custom_ignore = {
        \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$'
	\ }


" Lets go hard core and turn arrow keys off
map <Down> <NOP>
map <Up> <NOP>
map <Left> <NOP>
map <Right> <NOP>
