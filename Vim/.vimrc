
" An example for a vimrc file.
"
" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" set statusline+=\{…\}%3{codeium#GetStatusString()}

"———VERBOSE DEBUGGING———
function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.log/vim/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction



" -- General --
set number
set relativenumber
set cursorline
set noswapfile
set nowrap
syntax on

" -- Indentation --
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set expandtab

" -- Editor
set showmatch
set laststatus=2
set wildmenu
set noswapfile
set nobackup
set undofile
set clipboard=unnamedplus


" -- Search settings --
set hlsearch
set incsearch
set ignorecase
set smartcase

" -- Visual settings --
" Note: winborder is not a standard global option in Vim/Neovim, 
" but if you use a GUI or plugin that supports it, this is the syntax.
" set winborder=rounded 
set signcolumn=yes

" -- Keymaps --
let mapleader = " "

" Source config
nnoremap <leader>so :update<CR> :source<CR>

nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" -- Better indenting in visual mode --
vnoremap < <gv
vnoremap > >gv

" -- Move lines up and down --
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" -- Quick file navigation --
nnoremap <leader>e :Explore<CR>
nnoremap <leader>ff :find 

" -- Better J behavior --
nnoremap J mzJ`z

" -- Quick config editing --
nnoremap <leader>rc :e $MYVIMRC<CR>

" -- Copy Full File-Path --
" Explaining the logic: 
" 1. let @+ = expand... (sets system clipboard register +)
" 2. echo ... (prints the message)
nnoremap <leader>pa :let @+ = expand("%:p") <bar> echo "file: " . expand("%:p")<CR>

" -- Basic autocommands --
augroup UserConfig
    autocmd!
    " Pure Vimscript implementation of Highlight on Yank
    autocmd TextYankPost * silent! call s:highlight_yank()
augroup END

function! s:highlight_yank()
    " Only highlight on yank (not delete)
    if v:event.operator !=? 'y' | return | endif

    " Get the range of the yanked text
    let [beg, end] = [getpos("'["), getpos("']")]
    let type = v:event.regtype
    let pattern = ''

    " Construct regex pattern based on selection type
    if type ==# 'v' " Characterwise
        " Matches from start char to end char (across lines if necessary)
        let pattern = '\%'.beg[1].'l\%'.beg[2].'c\_.*\%'.end[1].'l\%'.end[2].'c'
    elseif type ==# 'V' " Linewise
        " Matches full lines from start to end
        let pattern = '\%'.beg[1].'l\_.*\%'.end[1].'l'
    elseif type ==# "\<C-v>" " Blockwise (approximate)
        " Blockwise is complex in pure vimscript, falling back to simple blink
        let pattern = '\%'.beg[1].'l\_.*\%'.end[1].'l'
    else
        return
    endif

    " Apply the highlight (using the 'IncSearch' highlight group)
    let l:id = matchadd("IncSearch", pattern)
    
    " Remove the highlight after 150ms
    call timer_start(150, {-> execute('silent! call matchdelete(' . l:id . ')', 'silent!')})
endfunction
