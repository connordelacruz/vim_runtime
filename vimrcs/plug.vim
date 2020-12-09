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

" SYNTAX =====================================================================
" CSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] }
" JS
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Markdown TODO REMOVE?
" Plug '~/.vim_runtime/bundle/syntax/markdown', { 'for': 'markdown' }
" Processing
Plug 'sophacles/vim-processing', { 'for': 'processing' }
" RST
Plug '~/.vim_runtime/bundle/syntax/rst-headings', { 'for': 'rst' }
" SCSS
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

" END ========================================================================
call plug#end()
