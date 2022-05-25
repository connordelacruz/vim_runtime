" ============================================================================
" Utility functions and commands
" ============================================================================

" TODO move more stuff here, organize
" Buffers ====================================================================
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

" Fill Line ==================================================================
" TODO: make a plugin?
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

command! -nargs=* FillLine call FillLine(<f-args>)

" Misc =======================================================================
" Alias for hitest.vim
command Hitest source $VIMRUNTIME/syntax/hitest.vim
