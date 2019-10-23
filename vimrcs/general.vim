" ============================================================================
" General settings
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

" Enable syntax highlighting.
" See colors.vim for colorscheme configs
syntax enable 
" Number of lines to keep above and below cursor
set so=7
" Show line numbers
set nu
" Show ruler TODO REMOVE? Lightline handles this
set ru
" Command bar height TODO REMOVE? Default is 1
set ch=1
" Backspace behavior in insert mode TODO REMOVE? this is default
set bs=eol,start,indent
" Wrap to first/last character if at end/beginning of line
set ww+=<,>,h,l
" Show matching brackets when cursor is over one
set sm
" How many tenths of a second to blink when matching brackets
set mat=2
" Add cursor support (excluding visual mode)
set mouse=nic

" Splits =====================================================================
" Open new horizontal splits below current window
set sb
" Open new vertical splits to the right of current window
set spr

" Menu =======================================================================
" Enable wildmenu
set wmnu
" Ignore case
set wic
" Ignore compiled files, VCS, etc
set wig=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Search =====================================================================
" Ignore case
set ic
" Don't ignore case if pattern contains upper case chars
set scs
" Highlight search results TODO REMOVE? on by default
set hls
" Unhighlight previous session search when opening vim
nohls
" When searching, show results of pattern as it's typed so far TODO REMOVE? on by default
set is
" Enable regex characters TODO REMOVE? on by default
set magic

" Tabs =======================================================================
" Use spaces instead of tab characters
set et
" Enable smart tab TODO REMOVE? on by default
set sta
" 1 tab == 4 spaces
set sw=4
set ts=4
" Auto indent
set ai 
" Smart indent
set si 

" Wrapping ===================================================================
" Wrap lines
set wrap
" Wrap at breakat character
set lbr
" Disable list so linebreak works properly (disabled by default but just to be sure)
" TODO REMOVE?
set nolist

" Performance ================================================================
" Don't redraw while executing macros
set lz
" Apparently, vim has issues with updatetime < 1000 prior to 7.4.427
if v:version > 704 || (v:version == 704 && has('patch427'))
    set ut=250
else
    set ut=1000
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

" Backups and Undo ===========================================================
" Disable backups and swap file
set nobk
set nowb
set noswf
" Enable persistent undo (even when you close a buffer)
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Buffers ====================================================================
" Specify the behavior when switching between buffers 
" TODO explain configs, figure out why it was in a try/catch?
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Status Line ================================================================
" Always show the status line
set laststatus=2
" Format the status line
" TODO REMOVE? Lightline handles this?
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" Returns true if paste mode is enabled
" Used for status line format
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Saving =====================================================================
" Create directories on save if filepath doesn't exist
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

" Reloding vimrcs ============================================================
" TODO: do this for vimrcs/ files too?
autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim

" Misc =======================================================================
" TODO ORGANIZE?

" utf8 encoding
set enc=utf8
" Use Unix as the standard file type TODO is this necessary?
set ffs=unix,dos,mac

" Incrementing for alphabet, octal, and hex sequences
set nf=alpha,octal,hex

" Avoid garbled characters in Chinese language windows OS
" TODO: remove?
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Return to last edit position when opening files 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" TODO MOVE TO filetypes.vim
" Delete trailing white space on save
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

" TODO do we need this?
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Caps lock struggles
command W echoerr 'Check your CAPS LOCK, bud'

" TODO REMOVE, this almost certainly does nothing...
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

" TODO: make a plugin?
" TODO: take 2nd arg for override line width
" TODO: config for default character
" TODO REORGANIZE?
" Fill rest of line with a character
function! FillLine(...)
    let tw = &textwidth ? &textwidth : 80
    if a:0 < 1
        let str = '-'
    else
        let str = a:1
    endif
    " Strip trailing spaces
    .s/[[:space:]]*$//
    " Number of strs to insert
    let n = (tw - col('$')) / len(str)
    if n > 0
        .s/$/\=(' '.repeat(str,n))/
    endif
endfunction

command! -nargs=* FillLine call FillLine(<f-args>)
" Bind to <leader>f
" TODO move to mappings.vim
nnoremap <leader>f :FillLine<space>
