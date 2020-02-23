set hidden lazyredraw showmode novisualbell number relativenumber ttyfast

" Whitespace configuration
set nowrap tabstop=2 shiftwidth=2 softtabstop=2 expandtab smartindent nofixendofline

" Menu stuff
set wildmode=list:full
set wildignore+=*.d.ts,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=deploy/**,dist/**,release/**,*.min.js,*.js.map

" Search
set hlsearch incsearch ignorecase smartcase

" Use modeline overrides
set modeline modelines=10

set mouse=a

" Undo and backup
set undofile
set nobackup
set nowritebackup
set noswapfile

set undodir=~/.config/nvim/undo
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/swp

let mapleader=" "

set clipboard=unnamedplus

autocmd FileType gitcommit setlocal tw=72 | set spell | set colorcolumn=50

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""
" general
""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
Plug 'wellle/targets.vim'

Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

""""""""""""""""""""""""""""""""""""""
" Rust/toml
""""""""""""""""""""""""""""""""""""""
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

""""""""""""""""""""""""""""""""""""""
" yaml
""""""""""""""""""""""""""""""""""""""
Plug 'stephpy/vim-yaml'
Plug 'xavierchow/vim-swagger-preview'
nmap <unique> <leader>v <Plug>GenerateDiagram

""""""""""""""""""""""""""""""""""""""
" TypeScript / tsx
""""""""""""""""""""""""""""""""""""""
Plug 'HerringtonDarkholme/yats.vim'
Plug 'peitalin/vim-jsx-typescript'


""""""""""""""""""""""""""""""""""""""
" JavaScript / tsx
""""""""""""""""""""""""""""""""""""""
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'

""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

""""""""""""""""""""""""""""""""""""""
" Ack
""""""""""""""""""""""""""""""""""""""
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


""""""""""""""""""""""""""""""""""""""
" No idea who needs these
""""""""""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'
Plug 'ConradIrwin/vim-bracketed-paste'

""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <C-p> :FZF<CR>
nnoremap <leader>b :Buffers<CR>

""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""
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
" NERDTree
""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
noremap <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let NERDTreeIgnore=['\.git$[[dir]]']
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"

Plug 'ryanoasis/vim-devicons'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsOS = 'Darwin'
let g:NERDTreeGitStatusNodeColorization = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" 
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tsx'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sql'] = ''



Plug 'janko/vim-test'

""""""""""""""""""""""""""""""""""""""
" Misc stuff
""""""""""""""""""""""""""""""""""""""
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'elzr/vim-json'

Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dominikduda/vim_es7_javascript_react_snippets'

Plug 'easymotion/vim-easymotion'

Plug 'editorconfig/editorconfig-vim'
call plug#end()

map , <Plug>(easymotion-prefix)

let g:gruvbox_italic = 0
let g:gruvbox_contrast_light = 'soft'
set background=dark

let g:jellybeans_overrides = {
\    'background': { 'guibg': 'NONE' },
\}
colorscheme jellybeans

nnoremap <Leader>w :w<CR>
nnoremap <Leader>ev :e $MYVIMRC<cr>
nnoremap <Leader>sv :so $MYVIMRC<cr>

imap jk <Esc>

nnoremap <F9> :bw<CR>
nnoremap <F10> :NERDTreeToggle <bar> bw <bar> NERDTreeToggle<CR> <C-W>l

cnoremap <C-n> <Up>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


nnoremap <leader>d :bp<cr>:bd #<cr>
nnoremap <Leader>h :nohlsearch<cr>
nnoremap <Leader>s :setlocal spell! spell?<cr>

nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gd :Gvdiff<cr>
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gb :Gblame<cr>

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" nnoremap <Tab> >>
" nnoremap <S-Tab> <<
" vnoremap <Tab> >gv
" vnoremap <S-Tab> <gv


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> td <Plug>(coc-definition)
nmap <silent> ty <Plug>(coc-type-definition)
nmap <silent> ti <Plug>(coc-implementation)
nmap <silent> tr <Plug>(coc-references)


" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>f  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:markdown_fenced_languages = ['ts=typescript', 'python', 'tsx=typescript']


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
