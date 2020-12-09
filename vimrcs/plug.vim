" ============================================================================
" vim-plug configs
" ============================================================================

" TODO make configurable dir e.g. let g:plug_dir
"https://github.com/junegunn/vim-plug/issues/182

" PLUGIN DIR =================================================================
call plug#begin('~/.vim_runtime/plugged')

" COLORSCHEMES ===============================================================
" Editor
Plug '~/.vim_runtime/bundle/colors/base16'
Plug 'joshdick/onedark.vim'
" Lightline
Plug '~/.vim_runtime/bundle/colors/lightline-colors'

" END ========================================================================
call plug#end()
