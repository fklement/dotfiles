set nocompatible          
filetype off           

set rtp+=~/.config/nvim/bundle/VundleVim
" TODO: Move vrom vundle to vim-plug
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

" Language support
Plugin 'alvan/vim-closetag'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'          
Plugin 'elixir-editors/vim-elixir'                                       
Plugin 'slashmili/alchemist.vim'
Plugin 'mhinz/vim-mix-format'


call vundle#end()           
filetype plugin indent on


call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'dkprice/vim-easygrep'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
" set relativenumber
set showcmd
set cursorline
filetype indent on
set wildmenu
set showmatch
set mat=2
set so=7
set incsearch
set hlsearch
set lazyredraw 
set ruler
set cmdheight=1
set splitbelow
set splitright
set title


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }
let g:NERDTreeNodeDelimiter = "\u00a0"

" sync open file with NERDTree
" " Check if NERDTree is open or active
" function! IsNERDTreeOpen()        
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" " Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=SauceCodePro\ Nerd\ Font\ 18

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set laststatus=2
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = "\uE0C6"
let g:airline_right_sep = "\uE0B2"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.notexists=' ⚡'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme escuro
set background=dark

" Spaces & Tabs
set tabstop=4
set softtabstop=4
set expandtab
set smarttab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" No annoying sound on errors
set noerrorbells
set novisualbell
set noeb vb t_vb=.
set tm=500

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

:imap jk <Esc>

" Fast saving
nmap <leader>w :w!<cr>

map ; :Files<CR>
map <leader>t :NERDTreeToggle<cr>
map <leader>tb :NERDTreeFromBookmark 
map <leader>tf :NERDTreeFind<cr>


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

map <leader>q :q!<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Splitting windows
map <leader>vs :vsplit<cr>
map <leader>s :split<cr>

" Search with GREP
map <leader>f :Grep 

map <leader>tn :tab new<cr>
map <leader>tr :tabclose<cr>
map <leader>tra :tabo
map  <S-n> :tabn<cr>
map  <S-j> :tabp<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

map  <A-d> :t.<CR>
map  <A-o> [[
map  <A-p> ]]


" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Put all temporary files under the same directory
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("*mkdir")
  for dir in ["files", "files/backup", "files/swap", "files/undo", "files/info"]
    if !isdirectory($HOME . "/.config/nvim/" . dir)
      call mkdir($HOME . "/.config/nvim/" . dir)
    endif
  endfor
endif

set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.config/nvim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.config/nvim/files/undo/
set viminfo     ='100,n$HOME/.config/nvim/files/info/viminfo
unlet! skip_defaults_vim
filetype plugin indent on

let g:mix_format_on_save = 1

let g:alchemist_tag_map = '<C-]>'
let g:alchemist_tag_stack_map = '<C-T>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GitGutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FastMode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function MultiScroll(OnOff)
if a:OnOff == 1
  noremap j 5j
  noremap k 5k
else
  noremap j j
  noremap k k
endif
endfunction

map fm :call MultiScroll(1)<RETURN>
map sm :call MultiScroll(0)<RETURN>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-elixir',
  \ 'coc-python'
  \ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

if has('nvim')
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
  aug END
end

:set mouse=n
