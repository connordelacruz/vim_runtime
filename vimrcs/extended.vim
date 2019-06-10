"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: document
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable scrollbars 
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark

" Enable termguicolors for nvim if $COLORTERM is set to truecolor
if has('nvim') && $COLORTERM == "truecolor"
    set termguicolors
    let base16colorspace=256
    " Set default colorscheme to oceanicnext
    try
        colorscheme oceanicnext
        let g:lightline.colorscheme = 'oceanicnext'
        " colorscheme eighties
        " let g:lightline.colorscheme = 'eighties'
    catch
    endtry
else
    " Set default colorscheme to onedark
    try
        colorscheme onedark
        let g:lightline.colorscheme = 'onedark'
    catch
    endtry
end

if exists('$TMUX') && !has('nvim')
    set term=screen-256color 
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set updatetime
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apparently, vim has issues with updatetime < 1000 prior to 7.4.427
if v:version > 704 || (v:version == 704 && has('patch427'))
    set updatetime=250
else
    set updatetime=1000
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Caps lock struggles
command W echoerr 'Check that CAPS LOCK'

" Create directories on save if filepath doesn't exist
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

" TODO: make a plugin, merge w/ LongLineSearch?
" TODO: take 2nd arg for override line width
" TODO: config for default character
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

command! -nargs=* FillLine call FillLine(<args>)

