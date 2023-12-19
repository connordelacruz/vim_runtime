" ============================================================================
" General configs
" ============================================================================

" General ====================================================================
" Command history size
set history=500
" Enable filetype plugins
filetype plugin on
filetype indent on
" Update files modified outside of vim
set autoread

" UI =========================================================================
" TODO reorganize section? Kinda generic
" Enable syntax highlighting
syntax enable 
" Number of lines to keep above and below cursor
set scrolloff=7
" Enable multiple sign columns
if has('nvim')
    set signcolumn=auto:9
else
    set signcolumn=auto
endif
" Show line numbers
set number
" Backspace behavior in insert mode
set backspace=eol,start,indent
" Wrap to first/last character if moving cursor at end/beginning of line
set whichwrap+=<,>,h,l
" Show matching brackets when cursor is over one
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2
" Add cursor support (excluding visual mode)
set mouse=nic
" Highlight current cursor line
set cursorline
" Hide '~' at end of file
set fillchars+=eob:\ 

" Splits =====================================================================
" Open new horizontal splits below current window
set splitbelow
" Open new vertical splits to the right of current window
set splitright

" Menu =======================================================================
" Enable wildmenu (enhanced tab completion for commands)
set wildmenu
" Ignore case when completing file/dir names
set wildignorecase
" Ignore compiled files, VCS, etc
set wildignore+=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Search =====================================================================
" Ignore case
set ignorecase
" Don't ignore case if pattern contains upper case chars
set smartcase
" Highlight search results 
set hlsearch
" Unhighlight previous session search when opening vim
nohls
" When searching, show results of pattern as it's typed so far 
set incsearch
" Enable regex characters 
set magic

" Tabs =======================================================================
" Use spaces instead of tab characters
set expandtab
" Enable smart tab 
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Auto indent
set autoindent 
" Smart indent
set smartindent

" Wrapping ===================================================================
" Wrap lines
set wrap
" Wrap at breakat character
set linebreak
" Disable list so linebreak works properly (disabled by default but just to be sure)
set nolist

" Performance ================================================================
" Don't redraw while executing macros
set lazyredraw
" Apparently, vim has issues with updatetime < 1000 prior to 7.4.427
if v:version > 704 || (v:version == 704 && has('patch427'))
    set updatetime=250
else
    set updatetime=1000
endif

" GUI ========================================================================
" Set extra options when running in GUI mode
if has("gui_running")
    " TODO doc what these are (or just remove?)
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
" Disable scrollbars 
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Editing ====================================================================
" Return to last edit position when opening files 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Backups and Undo ===========================================================
" Disable backups and swap file
set nobackup
set nowritebackup
set noswapfile
" Enable persistent undo (even when you close a buffer)
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Buffers ====================================================================
" Specify the behavior when switching between buffers 
set switchbuf=useopen,usetab,newtab

" Tabline ====================================================================
" Always show tabline
set showtabline=2

" Saving =====================================================================
" Create directories on save if filepath doesn't exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Delete trailing white space on save
" TODO MOVE TO functions.vim, variable in filetypes.vim? Also s: prefix like above?
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.scss :call CleanExtraSpaces()
endif

" Reloading vimrcs ===========================================================
" TODO: do this for vimrcs/ files too
autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim

" Encoding ===================================================================
" utf8 encoding
set encoding=utf8
" Use Unix as the standard file type for end-of-line
set fileformats=unix,dos,mac

" Misc =======================================================================
" Incrementing for alphabet, octal, and hex sequences
set nrformats=alpha,octal,hex
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

