" ============================================================================
" Functions and commands
" ============================================================================

" TODO move more stuff here, organize

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

