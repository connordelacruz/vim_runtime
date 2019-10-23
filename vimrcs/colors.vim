" ============================================================================
" Colorscheme configs
" ============================================================================

" Dark background
set bg=dark
" Enable termguicolors for nvim if $COLORTERM is set to truecolor
if has('nvim') && $COLORTERM == "truecolor"
    set termguicolors
    let base16colorspace=256
    " Set default colorscheme to oceanicnext (if available)
    try
        colorscheme oceanicnext
        let g:lightline.colorscheme = 'oceanicnext'
    catch
        " Fall back on desert colorscheme
        try
            colorscheme desert
        catch
        endtry
    endtry
else
    " Set default colorscheme to onedark (if available)
    try
        colorscheme onedark
        let g:lightline.colorscheme = 'onedark'
    catch
        " Fall back on desert colorscheme
        try
            colorscheme desert
        catch
        endtry
    endtry
end

if exists('$TMUX') && !has('nvim')
    set term=screen-256color 
endif

