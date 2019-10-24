" ============================================================================
" Mapping configs
" ============================================================================

" Navigation =================================================================
" Remap VIM 0 to first non-blank character and <Leader>0 to first character
noremap <Leader>0 0
noremap 0 ^

" Copy/Paste =================================================================
" Copy/paste to clipboard
" TODO: capital P, additional mappings for smart paste: https://vim.fandom.com/wiki/Smart_paste
nnoremap <leader>yy "*yy
vnoremap <leader>y "*y
nnoremap <leader>p "*p
vnoremap <leader>p "*p

" Command Mode ===============================================================
" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Quick Surround =============================================================
" TODO: leader?
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Helper Functions ===========================================================

" FillLine -------------------------------------------------------------------
" Bind to <leader>f
nnoremap <leader>f :FillLine<space>

