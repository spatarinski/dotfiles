if &compatible
  set nocompatible
endif
" Setup dein  ---------------------------------------------------------------{{{
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('majutsushi/tagbar')
  call dein#add('editorconfig/editorconfig-vim')

  " colorscheme
  call dein#add('NLKNguyen/papercolor-theme')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('mhartington/oceanic-next')


  " syntax
  call dein#add('othree/html5.vim')
  call dein#add('othree/yajs.vim')
  " call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('leafgarland/typescript-vim')

  call dein#add('othree/jsdoc-syntax.vim')
  call dein#add('heavenshell/vim-jsdoc')
  call dein#add('elzr/vim-json')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('skwp/vim-html-escape')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('ap/vim-css-color')
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
  call dein#add('nelstrom/vim-markdown-folding', {'on_ft': 'markdown'})
  call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})


  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Quramy/tsuquyomi')
  call dein#add('vim-syntastic/syntastic')
  " call dein#add('sbdchd/neoformat')
  call dein#add('Chiel92/vim-autoformat')

  " call dein#add('mhartington/nvim-typescript')

  call dein#add('Shougo/denite.nvim')
  call dein#add('nixprime/cpsm', {'build': 'PY3=ON ./install.sh'})
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('ryanoasis/vim-devicons')


  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  "Vim plugin for auto closing PaperColor ( => (|) and quotations " => "|" , and more
  call dein#add('itmammoth/doorboy.vim')

  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-commentary')

  call dein#add('mattn/emmet-vim')

  " git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('junegunn/gv.vim')

  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
  filetype plugin indent on
" }}}

" System Settings  ----------------------------------------------------------{{{
  language en_US
  syntax on
  set hlsearch incsearch ignorecase smartcase
  set tabstop=2 shiftwidth=2 expandtab
  set rnu
  set noswapfile
  set relativenumber
  set list


  " Set this after the plugins have been loaded
  set background=dark
  colorscheme PaperColor
  " let g:oceanic_next_terminal_bold = 1
  " colorscheme OceanicNext
  " let g:jellybeans_overrides = {
  " \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
  " \}

  set autoread
  " Remember cursor position between vim sessions
  autocmd BufReadPost *
               \ if line("'\"") > 0 && line ("'\"") <= line("$") |
               \   exe "normal! g'\"" |
               \ endif
               " center buffer around cursor when opening files
  autocmd BufRead * normal zz

" }}}

" System mappings  ----------------------------------------------------------{{{
  let mapleader = ' '
  inoremap jk <esc>

  nnoremap <leader>ev :e $MYVIMRC<cr>
  nnoremap <leader>sv :so $MYVIMRC<cr>
  nnoremap <leader>w :w<CR>
  " Navigation in splits
  noremap <C-J> <C-W>w
  noremap <C-K> <C-W>W
  noremap <C-L> <C-W>l
  noremap <C-H> <C-W>h

  noremap <C-J> <C-W>w
  noremap <C-K> <C-W>W
  noremap <C-L> <C-W>l
  noremap <C-H> <C-W>h
  nnoremap  <silent> <leader>h :nohlsearch<CR>

  "select all
  nnoremap <C-a>a ggVG

  nnoremap <F9> :bw<CR>
  nnoremap <F10> :NERDTreeToggle <bar> bw <bar> NERDTreeToggle<CR> <C-W>l

  nnoremap <Tab> >>
  nnoremap <S-Tab> <<
  vnoremap <Tab> >gv
  vnoremap <S-Tab> <gv

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

"}}}

" airline  ------------------------------------------------------------------{{{

  let g:webdevicons_enable_airline_statusline = 0
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#mike#enabled = 1
  set hidden
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='papercolor'

  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9

"}}}

" gv.vim  ------------------------------------------------------------------{{{

nnoremap <silent> <leader>gv :<C-u>GV?<CR>

"}}}

" fugitive  ------------------------------------------------------------------{{{

  nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>
  nnoremap <silent> <leader>gw :<C-u>Gwrite<CR>
  nnoremap <silent> <leader>gr :<C-u>Gread<CR>
  nnoremap <silent> <leader>gc :<C-u>Gcommit<CR>
  nnoremap <silent> <leader>gb :<C-u>Gblame<CR>
  nnoremap <silent> <leader>gd :<C-u>Gdiff<CR>
  nnoremap <silent> <leader>gj :<C-u>Gpull<CR>
  nnoremap <silent> <leader>gk :<C-u>Gpush<CR>
  nnoremap <silent> <leader>gf :<C-u>Gfetch<CR>

" }}}
"

" NERDTree ------------------------------------------------------------------{{{

  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=45
  let NERDTreeMinimalUI=1
  let NERDTreeHijackNetrw=1
  let NERDTreeCascadeSingleChildDir=0
  let NERDTreeCascadeOpenSingleChildDir=0
  let g:NERDTreeAutoDeleteBuffer=1
  let g:NERDTreeShowIgnoredStatus = 0
  let NERDTreeIgnore=['\.git$[[dir]]']
  let g:WebDevIconsOS = 'Darwin'
  " autocmd FileType nerdtree setlocal nolist

  noremap <silent> <leader>n :NERDTreeToggle<CR>
  map <silent> <leader>r :NERDTreeFind<cr>

" }}}

" Deoplete ------------------------------------------------------------------{{{

" enable deoplete
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 0
  let g:echodoc_enable_at_startup=1
  set splitbelow
  set completeopt+=noselect,menuone
  set completeopt-=preview
  autocmd CompleteDone * pclose

  function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete=2
  endfunction
  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete=0
  endfunction
  let g:deoplete#file#enable_buffer_path=1
  call deoplete#custom#source('buffer', 'mark', 'ℬ')
  call deoplete#custom#source('tern', 'mark', '')
  call deoplete#custom#source('omni', 'mark', '⌾')
  call deoplete#custom#source('file', 'mark', '')
  call deoplete#custom#source('jedi', 'mark', '')
  call deoplete#custom#source('neosnippet', 'mark', '')
  call deoplete#custom#source('typescript',  'rank', 630)
  let g:deoplete#omni_patterns = {}
  let g:deoplete#omni_patterns.html = ''
  let g:deoplete#omni_patterns.css = ''
  function! Preview_func()
    if &pvw
      setlocal nonumber norelativenumber
     endif
  endfunction
  autocmd WinEnter * call Preview_func()
  let g:deoplete#ignore_sources = {}
  let g:deoplete#ignore_sources._ = ['around']

  " let g:deoplete#enable_debug = 1
  " let g:deoplete#enable_profile = 1
  " let g:deoplete#enable_logging = {'level': 'DEBUG','logfile': 'deoplete.log'}
  " call deoplete#enable_logging('DEBUG', 'deoplete.log')
  " call deoplete#custom#source('typescript', 'debug_enabled', 1)
"}}}

" typescript ------------------------------------------------------------------{{{

  " let g:nvim_typescript#max_completion_detail=100
  " let g:nvim_typescript#completion_mark=''
  " " let g:nvim_typescript#default_mappings=1
  " " let g:nvim_typescript#type_info_on_hold=1
  " let g:nvim_typescript#javascript_support=1

  let g:tsuquyomi_disable_quickfix = 1
  let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

  nnoremap <F12> :TsuDefinition<CR>
  nnoremap <leader>ti :TsuImport<CR>
  nnoremap <leader><F12> :TsuReferences<CR>
"}}}

" typescript ------------------------------------------------------------------{{{

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_html_tidy_quiet_messages=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

"}}}

" Code formatting -----------------------------------------------------------{{{
  nnoremap <leader>f :Autoformat<CR>
  " noremap <silent> <leader>f :Neoformat<CR>
  " let g:standard_prettier_settings = {
  "             \ 'exe': 'prettier',
  "             \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote'],
  "             \ 'stdin': 1,
  "             \ }
" }}}

" Denite ------------------------------------------------------------------{{{

  nnoremap <silent> <c-p> :Denite file_rec<CR>
  nnoremap <silent> <leader>b :Denite buffer<CR>
  nnoremap <silent> <leader>a :Denite grep:::!<CR>

" Change mappings.
	call denite#custom#map(
	      \ 'insert',
	      \ '<C-j>',
	      \ '<denite:move_to_next_line>',
	      \ 'noremap'
	      \)
	call denite#custom#map(
	      \ 'insert',
	      \ '<C-k>',
	      \ '<denite:move_to_previous_line>',
	      \ 'noremap'
	      \)

  call denite#custom#source('file_rec', 'vars', {
        \ 'command': [
        \ 'ag', '--follow','--nogroup','--hidden', '--column', '-g', '',
        \ '--ignore', '.git',
        \ '--ignore', '*.png',
        \ '--ignore', 'dist',
        \ '--ignore', 'node_modules'
        \] })

  call denite#custom#source(
        \ 'file_rec', 'matchers', ['matcher_cpsm'])

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

" Change ignore_globs
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        \ [ '.git/', '.ropeproject/', '__pycache__/', 'node_modules/',
        \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

"}}}

let g:ruby_host_prog = '/Users/stanimir_patarinski/.gem/ruby/2.3.0/bin/neovim-ruby-host'

