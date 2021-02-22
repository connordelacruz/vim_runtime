" ============================================================================
" Mapping configs
" ============================================================================

" GENERAL ====================================================================

" Navigation -----------------------------------------------------------------
" Remap VIM 0 to first non-blank character and <Leader>0 to first character
noremap <leader>0 0
noremap 0 ^

" Quick Save -----------------------------------------------------------------
nnoremap ,w :w<cr>
nnoremap ,wa :wa<cr>
" Quick Quit -----------------------------------------------------------------
nnoremap ,q :q<cr>
nnoremap ,qa :qa<cr>
" Quick Save & Quit ----------------------------------------------------------
nnoremap ,x :x<cr>

" Copy/Paste -----------------------------------------------------------------
" Clipboard
nnoremap <leader>yy "*yy
vnoremap <leader>y "*y
nnoremap <leader>p "*p
nnoremap <leader>P "*P
vnoremap <leader>p "*p
vnoremap <leader>P "*P
" TODO: additional mappings for smart paste: https://vim.fandom.com/wiki/Smart_paste

" Quick Surround -------------------------------------------------------------
vnoremap <leader>1 <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>2 <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>3 <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>q <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>Q <esc>`>a"<esc>`<i"<esc>

" Command Mode ---------------------------------------------------------------
" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


" FUNCTIONS ==================================================================

" FillLine -------------------------------------------------------------------
nnoremap <leader>f :FillLine<space>
nnoremap <leader>F :FillLine<cr>
nnoremap ,f :FillLine =<cr>


" PLUGINS ====================================================================

" CamelCaseMotion ------------------------------------------------------------
" TODO: see if there's a way to toggle on/off instead of pressing leader each time?
call camelcasemotion#CreateMotionMappings('<leader>')

" GitGutter ------------------------------------------------------------------
" Next/prev hunk
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)
" Stage/undo hunk
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)

" NERDTree -------------------------------------------------------------------
nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
nnoremap <leader>nf :NERDTreeFind<cr>

" Processing -----------------------------------------------------------------
" Run
au FileType processing nnoremap <buffer> ,R :RunProcessing<cr>
" Save and run
au FileType processing nnoremap <buffer> ,r :w<cr> :RunProcessing<cr>

" Table Mode -----------------------------------------------------------------
" <leader>T prefix
let g:table_mode_map_prefix='<leader>T'

" Tabmerge -------------------------------------------------------------------
nnoremap <leader>tm :Tabmerge<CR>
nnoremap ,tm :Tabmerge r<CR>

