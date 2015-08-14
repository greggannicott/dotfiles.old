" To see a list of possible options, run `:options`.

" -------------------------------------------------------------------------------------------------------------------
" important
" -------------------------------------------------------------------------------------------------------------------

set nocompatible " Use Vim's new abilities (ie. don't act like vi)

" -------------------------------------------------------------------------------------------------------------------
" plugin management
" -------------------------------------------------------------------------------------------------------------------

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" list the plugins you wish to install here:

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'burnettk/vim-angular'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'nelstrom/vim-mac-classic-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve

" -------------------------------------------------------------------------------------------------------------------
" moving around, searching and patterns
" -------------------------------------------------------------------------------------------------------------------
 
set wrapscan " Continue search when bottom of document has been reached.
set hlsearch " highlight all matches for the last used search pattern
set ignorecase " ignore case when using a search pattern
set smartcase " override 'ignorecase' when pattern has upper case characters
set incsearch " highlight pattern matches as you search

" -------------------------------------------------------------------------------------------------------------------
" tags
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" displaying text
" -------------------------------------------------------------------------------------------------------------------

set number " Display line numbers.
set relativenumber " Display relative rather than absolute numbers. Makes jumping down/up lines with n+j or n+k much easier.
                   " Note that as "set number" has been run, the actual line number will be displayed rather than 0.
set scrolloff=3 " Number of screen lines to show around the cursor.
set wrap " long lines wrap

" -------------------------------------------------------------------------------------------------------------------
" syntax, highlighting and spelling
" -------------------------------------------------------------------------------------------------------------------

syntax enable
filetype plugin indent on " Vim will try to recognize the type of the file and set the 'filetype' option.
"set background=dark " 'dark' or 'light'; the background color brightness
"colorscheme solarized
set background=light " 'dark' or 'light'; the background color brightness
colorscheme mac_classic
set cursorline " Highlight the screen line of the cursor
set colorcolumn=80 " Display a pale line 80 chars in (to help maintain reasonable line width)
autocmd FileType ruby set sw=2 sts=2 et

" -------------------------------------------------------------------------------------------------------------------
" multiple windows
" -------------------------------------------------------------------------------------------------------------------

set laststatus=2 " 0, 1 or 2; when to use a status line for the last window (Always display status bar)
set splitbelow " new hoz splits go below
set splitright " new vert splits go right

" -------------------------------------------------------------------------------------------------------------------
" multiple tab pages
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" terminal
" -------------------------------------------------------------------------------------------------------------------

set ttyfast " Terminal connection is fast (smooth scrolling)
if !has("Win32")
  set term=screen-256color
endif

" -------------------------------------------------------------------------------------------------------------------
" using the mouse
" -------------------------------------------------------------------------------------------------------------------

set mouse=a  " Mouse in all modes
set mousehide  " Hide mouse after chars typed

" -------------------------------------------------------------------------------------------------------------------
" GUI
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" printing
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" messages and info
" -------------------------------------------------------------------------------------------------------------------

set cf " Start a dialog when a command fails
set showmode " Display the current mode in the status line
set showcmd " Show (partial / incomplete) command keys in the status line
set ruler " Show cursor position below each window

" -------------------------------------------------------------------------------------------------------------------
" selecting text
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" editing text
" -------------------------------------------------------------------------------------------------------------------

set nosm  " when inserting a bracket, do NOT briefly jump to it's match
set backspace=indent,eol,start " specifies what <BS>, CTRL-W, etc. can do in Insert mode
set formatoptions=qrn1 " list of flags that tell how automatic formatting works

" -------------------------------------------------------------------------------------------------------------------
" tabs and indenting
" -------------------------------------------------------------------------------------------------------------------

set tabstop=4 " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4 " Number of spaces to use for each step of (auto)indent. Used for 'cindent', >>, <<, etc.
set expandtab " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.

" -------------------------------------------------------------------------------------------------------------------
" folding
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" diff mode
" -------------------------------------------------------------------------------------------------------------------

set diffopt=vertical " Option settings for diff mode.

" -------------------------------------------------------------------------------------------------------------------
" mapping
" -------------------------------------------------------------------------------------------------------------------

set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" -------------------------------------------------------------------------------------------------------------------
" reading and writing files
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" the swap file
" -------------------------------------------------------------------------------------------------------------------

" Determine where to put swap files
if has("win32") || has("win64")
   set directory=$TMP
else
   set directory=/tmp
end 

" -------------------------------------------------------------------------------------------------------------------
" command line editing
" -------------------------------------------------------------------------------------------------------------------

set history=256  " How many command lines are remembered.
set wildmenu " Command-line completion shows a list of matches.
set wildmode=list:longest,full " Specifies how command line completion works

" -------------------------------------------------------------------------------------------------------------------
" executing external commands
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" running make and jumping to errors
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" system specific
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" language specific
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" multi-byte characters
" -------------------------------------------------------------------------------------------------------------------

" -------------------------------------------------------------------------------------------------------------------
" various
" -------------------------------------------------------------------------------------------------------------------

set virtualedit+=block " Allow moving after the end of the line in visual block mode
set gdefault " Apply global substitutions on all lines by default

" -------------------------------------------------------------------------------------------------------------------
" Other - ie. couldn't find a home above...
" -------------------------------------------------------------------------------------------------------------------

" Use standard windows shortcuts (eg. ctrl x, ctrl c, ctrl v). See `h: gui_w32` /mswin.vim for details.
source $VIMRUNTIME/mswin.vim
behave mswin	
set nobackup " Do not generate the ~files

" -------------------------------------------------------------------------------------------------------------------
" Plugin specific options
" -------------------------------------------------------------------------------------------------------------------

" dbext options
" -------------

let g:dbext_default_use_sep_result_buffer = 1
let g:dbext_default_window_width = 136
let g:dbext_default_buffer_lines = 15

" fugitive options
" ----------------
autocmd QuickFixCmdPost *grep* cwindow " have Glog open the quickfix list

" -------------------------------------------------------------------------------------------------------------------
" Remappings
" -------------------------------------------------------------------------------------------------------------------

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

" Map <F5> to insert date/time
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

" -------------------------------------------------------------------------------------------------------------------
" Leader key and mapped leader key commands
" -------------------------------------------------------------------------------------------------------------------

let mapleader = "," " Map a leader key

" Markdown related shortcuts:
" --------------------------

" Insert a line (h1 in Markdown) that equals length of current line
nnoremap <leader>1 yypVr=

" Insert a line (h2 in Markdown) that equals length of current line
nnoremap <leader>2 yypVr-

" -------------------------------------------------------------------------------------------------------------------
" Provide support for using Vim in ConEmu (with PowerShell)
" -------------------------------------------------------------------------------------------------------------------

if !empty($CONEMUBUILD)
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    set bs=indent,eol,start
    let g:solarized_termcolors=256
    set background=light " 'dark' or 'light'; the background color brightness
    colorscheme solarized
endif

" -------------------------------------------------------------------------------------------------------------------
" Provide a way to overide these settings locally by creating a '.local' file.
" -------------------------------------------------------------------------------------------------------------------
if has("Win32")
  if filereadable(expand("$VIM/_vimrc.local"))
    source $VIM/_vimrc.local
  endif
elseif has("mac")
  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif
endif
