"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/vagrant/.cache/dein//repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.cache/dein')
let s:toml_dir = expand('~/.config/nvim/dein/toml/')

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  "Load TOML
  let s:toml = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  " Let dein manage dein
  " Required:
  call dein#add('/home/vagrant/.cache/dein//repos/github.com/Shougo/dein.vim')
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" call color scheme
call dein#source('molokai')

"End dein Scripts-------------------------

" =================================================================
" Basic Setting
" =================================================================

colorscheme molokai

if &term == "xterm-256color"
	colorscheme molokai
	hi Comment ctermfg=102
	hi Visual ctermbg=236
endif

set t_Co=256
set termguicolors
set background=dark
set nofsync "setting to enable to write on mnt directory for macvim

set encoding=utf-8
set fenc=utf-8
syntax enable "
"set nobackup 万が一のために無効化
set noswapfile
set autoread
set hidden
set showcmd
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
"set expandtab 既存コードとの兼ね合いのため無効化
set tabstop=2
set softtabstop=2
set smartindent
set shiftwidth=2
set incsearch
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
"set whichwrap=b,s,h,l,<.>,[,],~
set number
"set cursorline
set backspace=indent,eol,start
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set wildmenu
set history=5000
if has('persistent_undo')
	set undodir=~/.vimundo
	augroup vimrc-undofile
		autocmd!
		autocmd BufReadPre ~/* setlocal undofile
	augroup END
endif
"mouse Setting
"if has('mouse')
"    set mouse=a
"    if has('mouse_sgr')
"        set ttymouse=sgr
"    elseif v:version > 703 || v:version is 703 && has('patch632')
"        set ttymouse=sgr
"    else
"        set ttymouse=xterm2
"    endif
"endif
"mouse setting end
"paste setting
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"shortcut for esc as jj in insertmode
inoremap jj <ESC>
