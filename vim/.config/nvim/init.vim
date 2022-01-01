" NEOVIM CONFIGURATION
" vim: sw=2 ts=2 et ft=vim
" set encoding to utf8 by default
set encoding=utf-8
" this vim configuration is in utf8
scriptencoding utf-8

" the vimrc config file is somewhere in the nix store and passed 
" to neovim with the -c option in the wrapper script
" This finds out where this vimrc lies during runtime
" for certain plugins to work like UltiSnips
let $MYVIMRC=expand('<sfile>:p')

" no VI compatibility
set nocompatible


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/pack')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Syntax analysis for different languages
Plug 'nvim-treesitter/nvim-treesitter'

" for colorscheme base16-horizon-dark
Plug 'chriskempson/base16-vim'

call plug#end()

runtime basics.vim
runtime treesitter.vim

