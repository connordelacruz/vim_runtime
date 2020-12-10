" ============================================================================
" vim-plug configs
" ============================================================================

" TODO make configurable dir e.g. let g:plug_dir
"https://github.com/junegunn/vim-plug/issues/182
call plug#begin('~/.vim_runtime/plugged')

" COLORSCHEMES { =============================================================
" Editor
Plug '~/.vim_runtime/bundle/colors/base16'
Plug 'joshdick/onedark.vim'
" Lightline
Plug '~/.vim_runtime/bundle/colors/lightline-colors'
" } ==========================================================================

" SYNTAX { ===================================================================
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
" } ==========================================================================

" PLUGINS { ==================================================================
" TODO brief explanation of each
" Core
Plug 'connordelacruz/Tabmerge'
Plug 'tpope/vim-abolish'
Plug 'mileszs/ack.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
" Editing
Plug 'jiangmiao/auto-pairs'
Plug 'dkarter/bullets.vim', { 'for': ['markdown', 'text', 'gitcommit'] } " TODO g:bullets_enabled_file_types
Plug 'tpope/vim-commentary'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" } ==========================================================================

call plug#end()
