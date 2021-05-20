let mapleader =" "

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Let vim use a posix compliant shell instead of fish
if &shell =~# 'fish$'
    set shell=sh
endif

" PLUGINS

call plug#begin('~/.vim/plugged')
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
Plug 'ayu-theme/ayu-vim' 
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
call plug#end()

" MISC

set nocompatible
filetype plugin indent on
syntax on

let ayucolor="dark"

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
set mouse=a
set wrap
set linebreak

" KEYBINDS

nnoremap <F6> :buffers<CR>:buffer<Space>
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

" set wrap width
au BufRead,BufNewFile *.md setlocal textwidth=100

" markdown preview

command! -nargs=* RunSilent
    \ | execute ':silent !'.'<args>'
    \ | execute ':redraw!'

nmap <leader>pc :RunSilent pandoccer % /tmp/vim-pandoc-out.pdf<CR>
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
let g:ycm_always_populate_location_list = 1
let g:ycm_global_ycm_extra_conf = '~/repos/dotfiles/.ycm_extra_conf.py'

let g:vim_markdown_toc_autofit = 1

let g:goyo_width = 101

map <C-e> :NERDTreeToggle<CR>

" YCM Keybinds

autocmd FileType cpp nnoremap <buffer> gd :YcmCompleter GoTo<CR>
autocmd FileType cpp nnoremap <buffer> gF :YcmCompleter Format<CR>

nmap <leader>mp <Plug>MarkdownPreviewToggle

" AUTOCMDS

autocmd BufWritePost .Xresources ~/.Xresources.d/ !xrdb -merge ~/.Xresources-regolith
autocmd BufWritePost .vimrc source ~/.vimrc
