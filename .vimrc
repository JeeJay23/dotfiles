let mapleader =" "

" Let vim use a posix compliant shell instead of fish
if &shell =~# 'fish$'
    set shell=sh
endif

" PLUGINS

call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-python/python-syntax'
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'dag/vim-fish'
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

" MISC

set nocompatible
filetype plugin indent on
syntax on

colorscheme wal

set number
set relativenumber
set tabstop=4 " number of spaces per tab
set softtabstop=4 " idem but while editing
set expandtab " tabs are spaces
set wildmenu " visual feedback for tab complete on commandline
set lazyredraw 
set showmatch " highlights matching char
set incsearch " start searching while typing
set hlsearch " highlight matches
set foldenable
set foldlevelstart=10

" KEYBINDS

map <leader>f :Goyo<CR> " zen mode
" move by visual line
map j gj
map k gk

"Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" move to beginning eol
nnoremap B ^
nnoremap E $

" easy buffer switching
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>

nnoremap <leader>ev :vsp $MYVIMRC<CR> " edit vim keybinds
nnoremap <leader>s :mksession<CR> " saves session to be opened by vim -S

nnoremap f H:call EasyMotion#WB(0, 0)<CR>

" easy insert date
" :nnoremap <F5> "=strftime("%A, %H:%M %d-%m-%y")<CR>P
:nnoremap <F5> "=strftime("%Y-%m-%d %A %H:%M")<CR>P

" backup settings
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Spellchecking
nnoremap <leader>p z=
" turn on spellchecking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md set spelllang=nl,en_us
set complete+=kspell

" markdown preview

command! -nargs=* RunSilent
    \ | execute ':silent !'.'<args>'
    \ | execute ':redraw!'
nmap <leader>pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf %<CR>
nmap <Leader>pp :RunSilent zathura /tmp/vim-pandoc-out.pdf &<CR>


" PLUGIN SETTINGS

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" close preview window after exiting insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

nmap <leader>mp <Plug>MarkdownPreviewToggle

set mouse=a

" AUTOCMDS

autocmd BufWritePost .Xresources ~/.Xresources.d/ !xrdb -merge ~/.Xresources-regolith
autocmd BufWritePost .vimrc source ~/.vimrc
