syntax on
filetype plugin indent on
set modeline
set nocompatible
set autoindent
set expandtab
colorscheme default
runtime ftplugin/man.vim
let mapleader = ' '
let maplocalleader = ' '
inoremap jk <Esc>
function! OpenTerminal(split_cmd, resize_cmd)
  let cwd = expand('%:p:h')
  execute 'term'
  if a:resize_cmd != ''
    execute a:resize_cmd
  endif
  execute 'lcd ' . cwd
endfunction

autocmd ColorScheme solarized
      \ highlight CopilotSuggestion guifg=#000000 ctermfg=0

nnoremap <silent> <leader>h :call OpenTerminal('botright split', 'resize 10')<CR>

nnoremap <silent> <leader>v :call OpenTerminal('vsplit', '')<CR> :wincmd =<CR>

tnoremap <silent> jk <C-\><C-n>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
