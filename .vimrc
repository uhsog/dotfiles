" Plugins
"" vim-plug : https://github.com/junegunn/vim-plug
"" Specify a directory for plugins
"" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Color Schema
Plug 'KeitaNakamura/neodark.vim'

Plug 'bronson/vim-trailing-whitespace'

" A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'

" コメントON/OFFを手軽に実行
Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'

" ', " 等の入れ替え
Plug 'tpope/vim-surround'
" (), [], {} 等の自動補完
Plug 'cohama/lexima.vim'

" for status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File Search by fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Rails
Plug 'tpope/vim-rails'
"" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'

" for Lint
Plug 'w0rp/ale'

" indent visualization
Plug 'yggdroot/indentline'

" Plug 'andrewradev/switch.vim'

" Git
Plug 'tpope/vim-fugitive'
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
"" 変更した行を強調
Plug 'airblade/vim-gitgutter'
call plug#end()

"################################################

filetype plugin indent on

" Visual setteings
syntax enable
set number
set ruler
set title
set showmatch
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
" allows moving the buffer without saving
set hidden
"" [WIP] linter
let g:ale_fixers = {
\  'ruby': ['rubocop'],
\}
let g:ale_sign_column_always = 1 " 左端にsymbol用のcolumnを表示させておく
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
set updatetime=500 " Linterのチェックの反映を 0.5秒にする
" let g:ale_fix_on_save = 1 " 保存時にauto correctを実行
let g:ale_lint_on_enter = 1 " ファイルを開いたときにlint実行
let g:ale_lint_on_save = 1 " ファイルを保存したときにlint実行
" let g:ale_lint_on_text_changed = 'never' " 編集中のlintはしない

"" color scheme
set t_Co=256
colorscheme neodark
let g:neodark#terminal_transparent = 1 " default: 0"

"" Directories for swp files
set nobackup
set noswapfile

" Search settings in file
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" ctags
set tags=.tags;$HOME
"" tagsジャンプの時に複数ある時は一覧で表示する
nnoremap <C-]> g<C-]>

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Map leader to ,
let mapleader = "\<Space>"

" Key mappings
noremap YY "+y<CR>
noremap PP "+p<CR>
"" Buffer nav
noremap <leader>h :bp<CR>
noremap <leader>l :bn<CR>
"" Close buffer
noremap <leader>c :bd<CR>
"" Save file
noremap <leader>w :w<CR>
"" Clean search (highlight)
nnoremap <leader><leader> :noh<CR>

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
noremap <Leader>b :Buffers<CR>
nnoremap <Leader>x :Commands<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>a :Ag<CR>

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" vim-airline
let g:airline_theme = 'night_owl'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" for ale
let g:airline#extensions#ale#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste     = 'ρ'
let g:airline_symbols.paste     = 'Þ'
let g:airline_symbols.paste     = '∥'
let g:airline_symbols.whitespace = '_'
