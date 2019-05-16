" Plugins  ------------------------------------------------------------------{{{

" Setup dein {{{

  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))

  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('wsdjeg/dein-ui.vim')

"}}}

" system {{{

  call dein#add('matze/vim-move')
  call dein#add('itmammoth/doorboy.vim')
  call dein#add('eugen0329/vim-esearch')
  call dein#add('AndrewRadev/splitjoin.vim')

  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')

  call dein#add('tomtom/tcomment_vim')
  call dein#add('majutsushi/tagbar')

  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('sjl/vitality.vim')

  call dein#add('Shougo/context_filetype.vim')
  call dein#add('mhinz/vim-sayonara')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('simnalamburt/vim-mundo')

" }}}

" UI {{{

  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Yggdroot/indentLine')
  call dein#add('NLKNguyen/papercolor-theme')

" }}}


" Git {{{

  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('tpope/vim-git')
  call dein#add('tpope/vim-fugitive')
  call dein#add('junegunn/gv.vim')
  call dein#add('int3/vim-extradite')
  call dein#add('airblade/vim-gitgutter')

" }}}

" typscript {{{

  " call dein#add('leafgarland/typescript-vim')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build' : './install.sh'})

" }}}

" completion {{{

" call dein#add('Shougo/deoplete.nvim')
  call dein#add('Valloric/YouCompleteMe', {'build': './install.py'})

" }}}

" denite {{{

  call dein#add('Shougo/denite.nvim')
  call dein#add('raghur/fruzzy', {'hook_post_update': 'call fruzzy#install()'})
  call dein#add('nixprime/cpsm', {'build': 'PY3=ON ./install.sh'})
  call dein#add('Shougo/neomru.vim')
  call dein#add('neoclide/denite-git')
  call dein#add('chemzqm/denite-extra')
  call dein#add('pocari/vim-denite-gists')

" }}}

" Ack {{{

  call dein#add('mileszs/ack.vim')

" }}}

" code style {{{

  call dein#add('w0rp/ale')
  call dein#add('sbdchd/neoformat')
  call dein#add('editorconfig/editorconfig-vim')

" }}}

" javascript {{{

  call dein#add('othree/yajs.vim')
  call dein#add('heavenshell/vim-jsdoc')
  call dein#add('elzr/vim-json')

" }}}

" html {{{

  call dein#add('othree/html5.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})
  call dein#add('skwp/vim-html-escape')

" }}}

" css {{{

  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('ap/vim-css-color')

" }}}

" snippets {{{

  call dein#add('SirVer/ultisnips')

" }}}

" Has to be last according to docs
  call dein#add('ryanoasis/vim-devicons')

  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
  filetype plugin indent on

  nnoremap <silent> <leader>u :DeinUpdate<CR>

" }}}

" System Settings  ----------------------------------------------------------{{{
"

  " Basics
  set hidden lazyredraw showmode novisualbell number ttyfast

  " Search
  set hlsearch incsearch ignorecase smartcase

  " better colors
  set termguicolors

  set mouse=a

  set clipboard+=unnamedplus
  set pastetoggle=<f6>
  set nopaste
  autocmd BufWritePre * %s/\s\+$//e
  filetype on
  set numberwidth=1
  set tabstop=2 shiftwidth=2 expandtab
  set conceallevel=3
  set virtualedit=
  set wildmenu
  set laststatus=2
  set wrap linebreak nolist
  set wildmode=full
  set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
  set wildignore+=deploy/**,dist/**,release/**,*.min.js,*.js.map

  set autoread

  set updatetime=500
  set fillchars+=vert:│

" Remember cursor position between vim sessions
  autocmd BufReadPost *
             \ if line("'\"") > 0 && line ("'\"") <= line("$") |
             \   exe "normal! g'\"" |
             \ endif
             " center buffer around cursor when opening files
  autocmd BufRead * normal zz
  set complete=.,w,b,u,t,k

  set noshowmode
  set noswapfile
  set undofile
  set nobackup
  set nowritebackup
  set undodir=~/.config/nvim/undo
  set backupdir=~/.config/nvim/backup
  set directory=~/.config/nvim/swp

  let mapleader = ' '
  inoremap jk <esc>
  nnoremap <leader>w :w<CR>
  nnoremap <leader>d :bufdo bd<CR>
  nnoremap <leader>ev :e $MYVIMRC<cr>
  nnoremap <leader>sv :so $MYVIMRC<cr>

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

  nnoremap <F9> :bw!<CR>
  nnoremap <F10> :NERDTreeToggle <bar> bw <bar> NERDTreeToggle<CR> <C-W>l


  nnoremap <Leader>s :setlocal spell! spell?<CR>

  autocmd FileType gitcommit setlocal tw=72 | set spell | set colorcolumn=50
" }}}

" Themes, Commands, etc  ----------------------------------------------------{{{
  syntax on
  let g:one_allow_italics = 1

  set relativenumber
  set list
  set listchars=tab:‣\ ,trail:·

  colorscheme papercolor
  " colorscheme molokai
  set background=dark
" }}}

""""""""""""""""""""""""""""""""""""""
" NERDTree
" noremap <leader>n :NERDTreeToggle<CR>
" map <leader>r :NERDTreeFind<cr>

" NERDTree ------------------------------------------------------------------{{{

  noremap <leader>n :NERDTreeToggle<CR>
  map <leader>r :NERDTreeFind<cr>

  augroup ntinit
    autocmd FileType nerdtree call s:nerdtreeinit()
  augroup END
  function! s:nerdtreeinit() abort
    set nolist
    if !has("gui_running")
      nunmap <buffer> K
      nunmap <buffer> J
      map <silent> <Tab> :call nerdtree#ui_glue#invokeKeyMap("A")<CR>
    endif
  endf
  let NERDTreeIgnore=['\.git$[[dir]]', '\.vscode$[[dir]]']
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=45
  let NERDTreeMinimalUI=1
  let NERDTreeHijackNetrw=0
  let g:NERDTreeGitStatusNodeColorization = 1

  autocmd FileType nerdtree setlocal nolist

  let g:netrw_liststyle = 3
  let g:netrw_browse_split = 4
  let g:netrw_altv = 1
  let g:netrw_winsize = -28
  let g:netrw_banner = 0

  let NERDTreeCascadeSingleChildDir=0
  let NERDTreeCascadeOpenSingleChildDir=0
  let g:NERDTreeAutoDeleteBuffer=1
  " let g:NERDTreeShowIgnoredStatus = 1
  " let g:NERDTreeDirArrowExpandable = ''
  " let g:NERDTreeDirArrowCollapsible = ''
  let g:NERDTreeDirArrowExpandable = "\u00a0"
  let g:NERDTreeDirArrowCollapsible = "\u00a0"
" esearch settings {{{

  let g:esearch#cmdline#help_prompt = 1
   let g:esearch#cmdline#dir_icon = ''
   let g:esearch = {
   \ 'adapter':    'ag',
   \ 'backend':    'nvim',
   \ 'use':        ['visual', 'hlsearch', 'last'],
   \}

" }}}
"}}}

" git mappings -------------------------------------------------------------{{{

nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>:15wincmd_<CR>
nnoremap <silent> <leader>gw :<C-u>Gwrite<CR>
nnoremap <silent> <leader>gr :<C-u>Gread<CR>
nnoremap <silent> <leader>gb :<C-u>Gblame<CR>
nnoremap <silent> <leader>gd :<C-u>Gvdiff<CR>
nnoremap <silent> <leader>gj :<C-u>Gpull<CR>
nnoremap <silent> <leader>gg :<C-u>GitGutter<CR>
nnoremap <silent> <leader>gu :<C-u>GitGutterUndoHunk<CR>
nnoremap <silent> <leader>gv :<C-u>GV?<CR>

"}}}

" Nvim terminal -------------------------------------------------------------{{{

  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  autocmd BufEnter term://* startinsert
  autocmd TermOpen * set bufhidden=hide

" }}}

" Vim-Devicons --------------------------------------------------------------{{{
  highlight! link NERDTreeFlags NERDTreeDir
  " 
  let g:webdevicons_enable_denite = 0
  let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
  let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
  let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
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

" }}}

" YouCompleteMe  ------------------------------------------------------------------{{{

let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" }}}

" Deoplete ------------------------------------------------------------------{{{

" " enable deoplete
"   let g:deoplete#enable_at_startup = 1
"   inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"   " let g:deoplete#auto_complete_delay = 0
"   " let g:echodoc_enable_at_startup=1
"   " let g:echodoc#type="virtual"
"   " set splitbelow
"   " set completeopt+=menuone,noinsert,noselect
"   " set completeopt-=preview
"   " " autocmd CompleteDone * pclose

"   " Disable deoplete when in multi cursor mode
"   function! Multiple_cursors_before()
"       let b:deoplete_disable_auto_complete = 1
"   endfunction
"   function! Multiple_cursors_after()
"       let b:deoplete_disable_auto_complete = 0
"   endfunction
"   let g:deoplete#file#enable_buffer_path=1
"   call deoplete#custom#source('buffer', 'mark', 'ℬ')
"   call deoplete#custom#source('tern', 'mark', '')
"   call deoplete#custom#source('omni', 'mark', '⌾')
"   call deoplete#custom#source('file', 'mark', '')
"   call deoplete#custom#source('jedi', 'mark', '')
"   call deoplete#custom#source('neosnippet', 'mark', '')
"   call deoplete#custom#source('LanguageClient', 'mark', '')
"   call deoplete#custom#source('typescript',  'rank', 630)
"   call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
"   " call deoplete#custom#source('_', 'sorters', [])
"   let g:deoplete#omni_patterns = {
"         \ 'html': '',
"         \ 'css': '',
"         \ 'scss': ''
"         \}
"   " function! Preview_func()
"   "   if &pvw
"   "     setlocal nonumber norelativenumber
"   "    endif
"   " endfunction
"   " autocmd WinEnter * call Preview_func()
"   " let g:deoplete#ignore_sources = {'_': ['around', 'buffer' ]}

"}}}
" LanguageClient --------------------------------------------------------------------{{{

  set signcolumn=yes

"}}}

" Denite --------------------------------------------------------------------{{{

  let s:menus = {}

  call denite#custom#option('_', {
        \ 'prompt': '❯',
        \ 'winheight': 10,
        \ 'updatetime': 1,
        \ 'auto_resize': 0,
        \ 'highlight_matched_char': 'Underlined',
        \ 'highlight_mode_normal': 'CursorLine',
        \ 'reversed': 1,
        \ 'auto-accel': 1,
        \})

  call denite#custom#option('TSDocumentSymbol', {
        \ 'prompt': ' @' ,
        \})

  call denite#custom#option('TSWorkspaceSymbol', {
        \ 'prompt': ' #' ,
        \})

  call denite#custom#source('file/rec', 'vars', {
        \'command': ['rg', '--files', '--glob', '!.git'],
        \'matchers': ['matcher/fruzzy'],
        \'sorters':['sorter_sublime'],
        \})

        " \'matchers': ['matcher/cpsm']
  let fruzzy#usenative = 1
  "     \ 'command': ['ag', '--follow','--nogroup','--hidden', '--column', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'node_modules'

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep', '--ignore', '.git', '--ignore', 'node_modules', '--ignore', '*.jpg'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  " call denite#custom#var('grep', 'matchers', ['matcher/ignore_globs', 'matcher/regexp', 'matcher/pyfuzzy'])

"  call denite#custom#source('grep', 'vars', {
"         \'command': ['rg'],
"         \'default_opts': ['-i', '--vimgrep'],
"         \'recursive_opts': [],
"         \'pattern_opt': [],
"         \'separator': ['--'],
"         \'final_opts': [],
"         \'matchers': ['matcher/ignore_globs', 'matcher/regexp', 'matcher/pyfuzzy']
"         \})

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

  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

  call denite#custom#var('menu', 'menus', s:menus)

  nnoremap <silent> <c-p> :Denite file/rec<CR>
  " nnoremap <silent> <leader>h :Denite help<CR>
  " nnoremap <silent> <leader>v :Denite vison<CR>
  " nnoremap <silent> <leader>c :Denite -auto-preview colorscheme<CR>
  nnoremap <silent> <leader>b :Denite buffer<CR>
  " nnoremap <silent> <leader>l :Denite line<CR>
  nnoremap <silent> <c-f> :Denite grep:::!<CR>


"}}}

" vim-airline ---------------------------------------------------------------{{{
  let g:webdevicons_enable_airline_statusline = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#mike#enabled = 0
  set hidden
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline_powerline_fonts = 1
  let g:airline_symbols.branch = ''
  let g:airline_theme='papercolor'
  " cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'x' : 'bd'
  cnoreabbrev x Sayonara
  " cnoreabbrev x bd
  tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
  nmap <leader>, :bnext<CR>
  tmap <leader>, <C-\><C-n>:bnext<cr>
  nmap <leader>. :bprevious<CR>
  tmap <leader>. <C-\><C-n>:bprevious<CR>
  tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
  tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
  tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
  tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
  tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
  tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
  tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
  tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
  tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9

  let g:airline#extensions#branch#format = 0
  let g:airline_detect_spelllang=0
  let g:airline_detect_spell=0
  let g:airline#extensions#hunks#enabled = 0
  let g:airline#extensions#wordcount#enabled = 0
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_section_c = '%f%m'
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  " let g:airline_section_z = '%l:%c'
  let g:airline#parts#ffenc#skip_expected_string=''
  let g:airline_mode_map = {
        \ 'n' : '',
        \ 'i' : '',
        \ 'R' : '',
        \ 'v' : '',
        \ 'V' : '',
        \ 'c' : '',
        \ 's' : '',
        \ 'S' : '',
        \ ''  : '',
        \ 't' : '',
        \}
  let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 ',
        \}
"}}}

" Navigate between vim buffers and tmux panels ------------------------------{{{

  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
  tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
  tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
  tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
  tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
  tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>

"}}}

" Code formatting -----------------------------------------------------------{{{

" leader f to format code, requires formatters: read the docs

  noremap <silent> <leader>f :Neoformat<CR>
  let g:standard_prettier_settings = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote'],
    \ 'stdin': 1,
  \ }


  let g:standard_tsfmt_settings = {
    \ 'exe': 'tsfmt',
    \ 'args': ['%:p'],
    \ 'stdin': 1,
  \ }

" }}}

" CSS -----------------------------------------------------------------------{{{

  let g:neoformat_scss_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_scss = ['prettier']

"}}}

" typescript -----------------------------------------------------------{{{

  autocmd FileType typescript,typescript.tsx setl omnifunc=TSOmnicFunc
  let g:nvim_typescript#max_completion_detail=50
  let g:nvim_typescript#completion_mark=''
  let g:nvim_typescript#javascript_support=1
  let g:nvim_typescript#expand_snippet=0
  " map <silent> <leader>gd :TSDoc <cr>
  " map <silent> <leader>gt :TSType <cr>
  " map <silent> <leader>gtd :TSTypeDef <cr>
  map <silent> <leader>@ :Denite -buffer-name=TSDocumentSymbol TSDocumentSymbol <cr>
  map <silent> <leader># :Denite -buffer-name=TSWorkspaceSymbol TSWorkspaceSymbol <cr>
  map <silent> <leader>ti :TSImport <cr>
  nnoremap <F12> :TSDef<CR>
  nnoremap <leader><F12> :TSRefs<CR>
  nnoremap <leader>td :TSDoc<CR>
  nnoremap <leader>ts :TSGetDocSymbols<CR>
  nnoremap <m-Enter> :TSGetCodeFix<CR>

  let g:neoformat_typescript_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_typescript = ['prettier']

  let g:nvim_typescript#kind_symbols = {
      \ 'keyword': 'keyword',
      \ 'class': '',
      \ 'interface': '',
      \ 'script': 'script',
      \ 'module': '',
      \ 'local class': 'local class',
      \ 'type': '',
      \ 'enum': '',
      \ 'enum member': '',
      \ 'alias': '',
      \ 'type parameter': 'type param',
      \ 'primitive type': 'primitive type',
      \ 'var': '',
      \ 'local var': '',
      \ 'property': '',
      \ 'let': '',
      \ 'const': '',
      \ 'label': 'label',
      \ 'parameter': 'param',
      \ 'index': 'index',
      \ 'function': '',
      \ 'local function': 'local function',
      \ 'method': '',
      \ 'getter': '',
      \ 'setter': '',
      \ 'call': 'call',
      \ 'constructor': '',
      \}


  let s:menus.typescript = {
    \ 'description' : 'typescript commands',
    \}

  let s:menus.typescript.command_candidates = [
    \['Get Type', 'TSType' ],
    \['Get Doc', 'TSDoc'],
    \['Edit Project Config', 'TSEditConfig'],
    \['Restart Server', 'TSRestart'],
    \['Start Server', 'TSStart'],
    \['Stop Server', 'TSStop'],
    \]

  let g:neoformat_json_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_json = ['prettier']
  let g:vim_json_syntax_conceal = 0

" }}}

" HTML ----------------------------------------------------------------------{{{

  " let g:neoformat_enabled_html = ['htmlbeautify']
  let g:neoformat_html_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_html = ['prettier']

" }}}

" ultisnips ----------------------------------------------------------------------{{{

  let g:UltiSnipsExpandTrigger="<c-j>"
  let g:UltiSnipsSnippetDirectories=["UltiSnipsDir"]

" }}}

" Linting -------------------------------------------------------------------{{{

  let g:ale_sign_error = '•'
  let g:ale_sign_warning = '•'
  let g:airline#extensions#ale#error_symbol='• '
  let g:airline#extensions#ale#warning_symbol='•  '

  let g:ale_sign_column_always = 1

let g:ale_fixers = {
\  'html': ['prettier'],
\  'scss': ['prettier', 'stylelint', 'trim_whitespace'],
\  'typescript': ['tslint', 'prettier', 'trim_whitespace'],
\  'javascript': ['prettier', 'trim_whitespace'],
\}

  let g:ale_fix_on_save = 1
  let g:ale_javascript_prettier_use_local_config = 1

  let g:ale_linters = {
  \   'scss': ['stylelint'],
  \}

  augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
  augroup END

  nmap <Leader>m <Plug>(ALEFix)

  hi link ALEError SpellBad
  hi link ALEWarning SpellBad

  let g:ale_lint_on_text_changed = 'never'
  " let g:ale_lint_on_enter = 0
  " let g:ale_open_list = 1

"}}}

" Ack -------------------------------------------------------------------{{{

  if executable('ag')
    if (has("win32") || has("win64"))
      let g:ackprg = 'c:\Users\patarinski\.ag\ag --hidden --vimgrep --ingnore node_modules'
    else
      let g:ackprg = 'ag --hidden --vimgrep --ignore node_modules --ignore .git '
    endif
  endif

"}}}
