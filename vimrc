" general
set number                " show line numbers
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set nowrap                " don't wrap text


" pathogen
let g:pathogen_disabled = [ 'pathogen' ]    " don't load self 
call pathogen#infect()                      " load everyhting else
call pathogen#helptags()                    " load plugin help files
  
" code folding
set foldmethod=indent
set foldlevel=2
set foldnestmax=4

" indentation
set autoindent
set softtabstop=4 
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere

" visual
highlight Normal ctermbg=black
set background=dark
set cursorline
set t_Co=256
 
" syntax highlighting
syntax enable             " enable syntax highlighting (previously syntax on).
filetype on                 " enables filetype detection
filetype plugin indent on   " enables filetype specific plugins
 
" colorpack
colorscheme vibrantink
 
" gundo
nnoremap <F5> :GundoToggle<CR>
 
" lusty
set hidden
 
" pep8
let g:pep8_map='<leader>8'
 
" supertab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview











