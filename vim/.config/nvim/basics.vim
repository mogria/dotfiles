" GENERAL BEHAVIOUR {{{
"
" use space as the mapleader for easy combos to type
" these bindings can be user-defined
let mapleader = ' '
" and use \ as the maplocalleader (key bindings with <LocalLeader> prefix
" this one is global as the mapleader, but bindings from filetype plugins
" should use <LocalLeader> instead of <Leader>
let maplocalleader = '\'

set autowrite " save the opened file automatically when navigating, even tags
" set autowriteall " save the opened file automatically even when quitting
set autoread " reload file automatically when changed on disk, doesn't work in call cases, so see below
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
"autocmd FileChangedShellPost *
"   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
"
" NOTE: the two commands above dont work when being in q: or ex mode,
"       or probably when the current buffer is not backed by a file
au FocusGained,BufEnter * :checktime

" pattern completion in ex mode with * of all files in the
" working directory and in the folder of the current file

" have Vim jump to the last position when reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" open a quickfix window when using :grep or :Ggrep or :make(from vim-fugitive/git)
autocmd QuickFixCmdPost *grep* cwindow
autocmd QuickFixCmdPost *make* cwindow
" quickly jump in quickfix list
noremap <Leader>n :cnext<CR>
noremap <Leader>N :cprevious<CR>

noremap <Leader>l :lnext<CR>
noremap <Leader>L :lprevious<CR>

" activate mouse integration
set mouse=a

" have some minumum space between border
" and the cursor on the top and bottom
set scrolloff=5

" show line & column number
set ruler

if &term =~? '^screen' || &term =~? '^tmux'
" tmux will send xterm-style keys when its xterm-keys option
" is on
execute "set <xUp>=\e[1;*A"
execute "set <xDown>=\e[1;*B"
execute "set <xRight>=\e[1;*C"
execute "set <xLeft>=\e[1;*D"
endif

" allow saving with CTRL-S ($ stty -ixon # required)
noremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>a

" CTRL-l like in shell for top of the screen
noremap <C-l> zt<Esc>:redraw!<CR>
inoremap <C-l> <Esc>zt:redraw!<CR>a

" type ! in normal mode to run a command with the current
noremap ! :!

" SHIFT-ENTER builds not used and doesnt work
noremap <Leader>b :make %:p<CR>

" remove whitespace at end of lines
noremap <Leader>we :%s/\s\+$//g<CR>
vnoremap <Leader>we :s/\s\+$//g<CR>
" }}}

" SYSTEM CLIPBOARD CONFIGURATION {{{
map <Leader>y "+y
noremap <Leader>p :set paste<CR>"+p:set nopaste<CR>
noremap <Leader>P :set paste<CR>"+P:set nopaste<CR>
vnoremap <Leader>p <ESC>:set paste<CR>gv"+p:set nopaste<CR>
" }}}

" FINDING FILES WITH STANDARD VIM BEHAVIOUR {{{
" ignore these files
set wildignore+=*.o,*.so,*.a,*.dylib,*.dll,.*.sw?,.DS_STORE,.root,vendor,node_modules,.cache,.nix-profile
set wildignorecase " case insensitive
set wildoptions=tagfile " press CTRL-D while in ex mode to complete tags

" always show vim command autocompletion
set wildmenu
set wildmode=longest,list,full


" have all files in current directory in file and cd path
" when using ex commands or gf in normal mode
" Note: there will be language specific search paths generated
" by a nix expression appended to this file
set path +=.,,./src/**;$HOME/Code,./htdocs/**;$HOME/Code,.//**;$HOME/Code,./app/**;$HOME/Code
set suffixesadd=.php,.java.,.nix,/default.nix,.tpl,.scss,.css,.js,.jsx
set cdpath +=.,,
" }}}


" STATUS BAR (vim-airline) {{{
" show partial commands typed below the status line
set showcmd
set noshowmode " it's shown on the airline anyway

" }}}

" COMMAND MODE EMCAS/SHELL KEYBINDINGS {{{
" most of them already exist except C-A which autocompletes everything
" which is pretty useless? At least i'm more used to it getting me to
" the beginning of the line
cmap <C-A> <Home>
" }}}

" INSERT MODE EMACS/SHELL KEYBINDINGS {{{
inoremap <C-b> <Left>
inoremap <C-f> <Right>
" beginning of indented line"
imap <C-a> <Esc>^i
inoremap <C-e> <End>
" }}}

" CURSOR AND SIDEBAR LAYOUT {{{
set number
if has("gui_running")
set antialias
endif

set cursorline
" https://github.com/Yggdroot/indentLine

" }}}


" SEARCHING OPTIONS {{{
set hlsearch
" turn off hlsearch in normal mode with CTRL-N, disabled due to
" autocompletion on CTRL-N
" nnoremap <C-N> <ESC>:nohlsearch<CR>
set incsearch " move cursor while typing search

" the search pattern is case-insensitive when only using lowercase letters
" note: this can be disabled by using \c in the search pattern
set ignorecase
set smartcase
"because incsearch is set you can use CTRL-/ while searching to find the next match
cmap <C-_> <C-G>
" }}}

" SPELLING OPTIONS {{{
set spell
set spelllang=en,de
set spellsuggest=best

nnoremap <Leader>U gUiw
nnoremap <Leader>u viwbUl
" }}}



" BASE16 VIM THEME PLUGIN CONFIGURATIOJN {{{
set termguicolors
let base16colorspace=256
set background=dark

" but base16colorspace needs to be set first!
" colorscheme base16-horizon-dark
colorscheme base16-solarflare

hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl

" Comments in italics
hi Comment cterm=italic
hi Comment gui=undercurl

" }}}

" INDENTING / TABS & SPACING {{{
set autoindent
set smartindent " almost like cindent, but works better for most languages

set expandtab " convert tabs to spaces
set smarttab " delete whole tab at once on backspace, even when they are spaces


set list " enable showing other chars instead of spaces etc.
set listchars= " clear to not show $ at end of lin
set listchars+=tab:»· " show tabs
set listchars+=trail:· " show trailing spaces

set tabstop=4  "four is a good default
set softtabstop=4 " you can use :set sts=2 for temporarily changing tabstop & shiftwidth
set shiftwidth=4

" Language specific indents / align for tables
xmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" }}}

" LINE WRAPPING {{{
" wrap lines and show an arrow
set wrap
set linebreak
set breakindent
" set breakindentopt+=shift:0,sbr
set showbreak=↳
" in case nowrap gets set, show arrows
set listchars+=precedes:«,extends:»
" }}}

" BASIC UNIX COMMANDS AS EX COMMANDS {{{
" The plugin vim-eunuch provides most of these
" this also as the useful, :SudoWrite & s:SudoEdit
" have ranger mappings
noremap <F2> :Move <C-R>%
noremap <F5> :e<CR>
noremap <F7> :Mkdir 
noremap <F8> :Unlink<C-R>
" }}}



" TAGS GENERAL {{{
"" set tags+=./,, is relative to the current directory, not the current file
set cpoptions+=d
set tags +=./,,vimtags,~/tags
set tagcase=followscs
" show more information about a tag when completing
set showfulltag
" }}}


" FOLDING {{{
set foldmethod=marker
set foldnestmax=4 " at most 4 folds in each other, or it gets annoying

" set foldopen=block,hor,insert,mark,percent,quickfix,search,tag
set foldopen=all
set foldclose=all
set foldlevelstart=2
set foldcolumn=0
" augroup vimrc
" au BufReadPre * setlocal foldmethod=syntax
" au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
" augroup END
" }}}


" FILE MANAGER (NETRW + VINEGAR + SYNC) {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_fastbrowse = 1
let g:netrw_list_hide = netrw_gitignore#Hide().'.*\.sw.$'
let g:netrw_localmkdiropt = '-p'

" }}}

" " Required for operations modifying multiple buffers like rename.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" " Give more space for displaying messages.
set cmdheight=2

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
set signcolumn=yes
