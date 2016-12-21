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

" Terminal
set t_Co=256 mouse=a ttymouse=xterm2

" Use modeline overrides
set modeline modelines=10
set splitright

" Undo and backup
set undofile
set nobackup
set nowritebackup
if (has("win32") || has("win64"))
    set undodir=~/vimfiles/undo
    set backupdir=~/vimfiles/backup
    set directory=~/vimfiles/swp
else
    set undodir=~/.vim/undo
    set backupdir=~/.vim/backup
    set directory=~/.vim/swp
endif

" Remember last location in file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Auto-clean whitespace
autocmd BufWritePre * :%s/\s\+$//e

" File types
autocmd BufReadPost *cshtml              set filetype=html
autocmd BufRead,BufEnter .babelrc        set filetype=javascript

set pastetoggle=<F10>

let mapleader=" "
nnoremap <leader>w :w<CR>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
cnoremap <C-n> <Up>
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <F9> :bw<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F7> :setlocal spell! spell?<CR>


" noremap <C-J> <C-W>w
" noremap <C-K> <C-W>W
" noremap <C-L> <C-W>l
" noremap <C-H> <C-W>h

" Navigation in splits
""""""""""""""""""""""""""""""
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
    wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

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

" map ; to open command prompt
" nnoremap ; :

"""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""

if (has("win32") || has("win64"))
  call plug#begin('~/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'majutsushi/tagbar'
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
\ }

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
    if (has("win32") || has("win64"))
          let g:ackprg = 'c:\Users\patarinski\.ag\ag --vimgrep'
    else
          let g:ackprg = 'ag --vimgrep'
    endif
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
nnoremap <F12> :TernDef<CR>
nnoremap <leader><F12> :TernRefs<CR>
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
let g:syntastic_check_on_open=1
let g:syntastic_java_checkers=['']
let g:syntastic_javascript_checkers=['jshint', 'eslint', 'standard']

nnoremap <leader>f :Fixmyjs<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

autocmd BufRead,BufEnter,BufNew *.jsx             let b:syntastic_checkers = ["jshint"]
autocmd BufRead,BufEnter .babelrc                 let b:syntastic_checkers = ["jshint"]
autocmd BufRead,BufEnter *.json                   let b:syntastic_checkers = ["jshint"]
autocmd BufRead,BufEnter,BufNew */kendo-*/*.js    let b:syntastic_checkers = ["jshint"]

""""""""""""""""""""""""""""""""""""""
" Typescript
""""""""""""""""""""""""""""""""""""""
Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_tsc_fname = ''
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:syntastic_typescript_checkers = ['tsc'] " You shouldn't use 'tsc' checker.

nmap <leader>ti :TsuImport<cr>
nmap <leader>td :TsuDefinition<cr>
nmap <leader>tr :TsuReferences<cr>

""""""""""""""""""""""""""""""""""""""

Plug 'tpope/vim-commentary'

""""""""""""""""""""""""""""""""""""""
" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts=1
if (has("win32") || has("win64"))
    let g:airline_left_sep=''
    let g:airline_right_sep=''
endif

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

""""""""""""""""""""""""""""""""""""""
" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
noremap <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
""""""""""""""""""""""""""""""""""""""

Plug 'othree/html5.vim'

""""""""""""""""""""""""""""""""""""""
Plug 'mattn/emmet-vim'
""""""""""""""""""""""""""""""""""""""
Plug 'christoomey/vim-tmux-navigator'

""""""""""""""""""""""""""""""""""""""
call plug#end()
""""""""""""""""""""""""""""""""""""""

" Set this after the plugins have been loaded
set background=dark
" colorscheme Solarized
colorscheme PaperColor

" GUI, should wrap in has(gui)
if has("gui_running")
    if (has("win32") || has("win64"))
        set guifont=Consolas:h12:cDEFAULT anti linespace=0
    else
        set guifont=Source\ Code\ Pro\ Light:h14 anti linespace=0
    endif

  set guioptions=aci
endif

set relativenumber
set list

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

" Do not close gui on :q if it is not the last editing file.
function! NumberOfWindows()
  let i = 1
  while winbufnr(i) != -1
  let i = i+1
  endwhile
  return i - 1
endfunction

function! DonotQuitLastWindow()
  if NumberOfWindows() != 1
    let v:errmsg = ""
    silent! quit
    if v:errmsg != ""
        "echohl ErrorMsg | echomsg v:errmsg | echohl NONE
        "echoerr v:errmsg
        echohl ErrorMsg | echo v:errmsg | echohl NONE
    endif
  else
     echohl Error | echo "Can't quit the last window..." | echohl None
  endif
endfunction

if has("gui_running")
    cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'call DonotQuitLastWindow()' : 'q'
    cnoreabbrev <expr> qa getcmdtype() == ":" && getcmdline() == 'qa' ? 'call DonotQuitLastWindow()' : 'qa'
endif

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap <leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
inoremap jk <esc>
