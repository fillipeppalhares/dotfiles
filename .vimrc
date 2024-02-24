call plug#begin()
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag'
Plug 'takac/vim-hardtime'
Plug 'kooparse/vim-color-desert-night'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi'
call plug#end()

syntax on

set background=dark
set termguicolors
set autoindent
set encoding=utf-8
set fileencoding=utf-8
set ignorecase
set incsearch
set list
set listchars=tab:→·,trail:~
set number
set shiftwidth=2
set smartcase
set smartindent
set smarttab
set softtabstop=2
set laststatus=2
set statusline=%f

filetype on
filetype indent on
filetype plugin indent on

autocmd FileType eruby let b:AutoPairs = AutoPairsDefine({'<%' : '%>', '<%=' : '%>'})

"autocmd FileType eruby
  " \ let b:endwise_addition = '<% end %>' |
  " \ let b:endwise_words = '<% if %>' |
  " \ let b:endwise_pattern = '<%\(\(if\|unless\|case\|while\|until\|for\|def\)\>\%([^#]*\<end\>\)\@!\|do\ze\%(\s*|.*|\)\=\s*$\)'

" Mapping
imap <c-b>  debugger<esc><esc>:w<cr>
nmap <f3>   :vertical terminal<cr>
nmap <f9>   :set relativenumber!<cr>

" Closetag
let g:closetag_filenames = '*.html,*.erb'

" Hardtime
let g:hardtime_default_on = 1

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

" Rails projections
let g:rails_projections = {
    \ "app/services/*.rb": {
    \   "command": "service",
    \   "template": "# frozen_string_literal: true\n\nclass {camelcase|capitalize|colons}\nend,
    \ },
    \ "app/enumerations/*.rb": {
    \   "command": "enum",
    \ },
    \ "config/routes.rb": {
    \   "command": "routes"
    \ },
    \ "app/controllers/concerns/*.rb": {
    \   "command": "concon",
    \   "template": "# frozen_string_literal: true\n\nmodule {camelcase|capitalize|colons}\nend,
    \ },
    \ "app/models/concerns/*.rb": {
    \   "command": "modcon",
    \   "template": "# frozen_string_literal: true\n\nmodule {camelcase|capitalize|colons}\nend,
    \ },
    \ "config/initializers/*.rb": {
    \   "command": "initializer"
    \ },
    \ "app/javascript/controllers/*.js": {
    \   "command": "stimulus"
    \ }}

colorscheme desert-night
