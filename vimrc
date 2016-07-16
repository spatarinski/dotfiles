set nocompatible
filetype off

" Basics
set hidden lazyredraw showmode novisualbell number ttyfast

" Whitespace configuration
set nowrap tabstop=4 shiftwidth=4 softtabstop=4 expandtab smartindent

" Menu stuff
set wildmode=list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=deploy/**,dist/**,release/**,*.min.js,*.js.map

" Search
set hlsearch incsearch ignorecase smartcase

" GUI, should wrap in has(gui)
set guifont=Source\ Code\ Pro\ Light:h14 anti linespace=0
set guioptions=aci

" Terminal
set t_Co=256 mouse=a ttymouse=xterm2

" Use modeline overrides
set modeline modelines=10

" Undo and backup
set undofile
set nobackup
set nowritebackup
set undodir=~/.vim/undo
set backupdir=~/.vim/backup
set directory=~/.vim/swp

" Remember last location in file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Auto-clean whitespace
autocmd BufWritePre * :%s/\s\+$//e

" File types
autocmd BufReadPost *cshtml              set filetype=html
autocmd BufRead,BufEnter .babelrc        set filetype=javascript

""""""""""""""""""""""""""""""""""""""
" Shortcuts
set pastetoggle=<F10>

let mapleader=" "
let maplocalleader = "|"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>ev :e $MYVIMRC<cr>
nnoremap <Leader>sv :so $MYVIMRC<cr>
cnoremap <C-n> <Up>
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <F9> :bw<CR>
nnoremap <F8> :setlocal spell! spell?<CR>
inoremap jk <esc>

noremap <C-J> <C-W>w
noremap <C-K> <C-W>W
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h

nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap  <silent> <leader>h :nohlsearch<CR>

"paste from outside buffer
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>

"copy to outside buffer
nnoremap <leader>y "+yy
vnoremap <leader>y "+y

"select all
nnoremap <leader>a ggVG

"paste from 0 register
"Useful because `d` overwrites the <quote> register
nnoremap <leader>P "0p
vnoremap <leader>P "0p


"""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""

call plug#begin('~/vimfiles/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

" Color themes
Plug 'Lokaltog/vim-distinguished'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'

""""""""""""""""""""""""""""""""""""""
" ack vim
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""""""""
" vim-easymotion
Plug 'Lokaltog/vim-easymotion'
map \ <Plug>(easymotion-prefix)
""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
" ultisnips
Plug 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
""""""""""""""""""""""""""""""""""""""

Plug 'helino/vim-json'
Plug 'pangloss/vim-javascript'

""""""""""""""""""""""""""""""""""""""
" Git, Fugitive, Extradite, Gutter
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <leader>gw :<C-u>Gwrite<CR>
nnoremap <silent> <leader>gr :<C-u>Gread<CR>
nnoremap <silent> <leader>gc :<C-u>Gcommit<CR>
nnoremap <silent> <leader>gb :<C-u>Gblame<CR>
nnoremap <silent> <leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <leader>gj :<C-u>Gpull<CR>
nnoremap <silent> <leader>gk :<C-u>Gpush<CR>
nnoremap <silent> <leader>gf :<C-u>Gfetch<CR>

Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter'

Plug 'Valloric/YouCompleteMe'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

""""""""""""""""""""""""""""""""""""""
" vim-indent-guides
" Plug 'nathanaelkane/vim-indent-guides'
" nnoremap <silent> <leader>ti :IndentGuidesToggle<CR>
" let g:indent_guides_enable_on_vim_startup=1
" " let g:indent_guides_auto_colors=0

" augroup indent_guide_settings
"   autocmd!
"   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
"   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
" augroup END

""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""
" Syntastic!!
" npm i -g jshint eslint babel-eslint eslint-plugin-react
Plug 'scrooloose/syntastic'
Plug 'ruanyl/vim-fixmyjs'

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:syntastic_json_checkers = ["jshint"]

let g:syntastic_typescript_checkers = []

let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_javascript_eslint_exec = 'eslint'

nnoremap <Leader>f :Fixmyjs<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

autocmd BufRead,BufEnter,BufNew *.jsx             let b:syntastic_checkers = ["eslint"]
autocmd BufRead,BufEnter .babelrc                 let b:syntastic_checkers = ["jshint"]
autocmd BufRead,BufEnter *.json                   let b:syntastic_checkers = ["jshint"]
autocmd BufRead,BufEnter,BufNew */kendo-*/*.js    let b:syntastic_checkers = ["eslint"]

""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
""""""""""""""""""""""""""""""""""""""

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_lazy_update = 100
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = '\v[\/](node_modules)$'

if executable("ag")
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

Plug 'tpope/vim-commentary'

""""""""""""""""""""""""""""""""""""""
" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
noremap <Leader>n :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""

call plug#end()
""""""""""""""""""""""""""""""""""""""

" Set this after the plugins have been loaded
set background=dark
colorscheme PaperColor

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap <Leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=400
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=200
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction
