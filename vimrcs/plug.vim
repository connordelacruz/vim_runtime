" ============================================================================
" vim-plug configs
" ============================================================================

" TODO move bundle plugins to unplugged/ ?

" TODO make configurable dir e.g. let g:plug_dir
"https://github.com/junegunn/vim-plug/issues/182
call plug#begin('~/.vim_runtime/plugged')

" COLORSCHEMES { =============================================================
" Editor ---------------------------------------------------------------------
" Selection of base16 schemes
Plug '~/.vim_runtime/bundle/colors/base16'
" Fallback for less colorful terminals
Plug 'joshdick/onedark.vim'

" Lightline ------------------------------------------------------------------
Plug '~/.vim_runtime/bundle/colors/lightline-colors'
" } ==========================================================================

" SYNTAX { ===================================================================
" CSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] }
" JS
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Markdown
" Plug '~/.vim_runtime/bundle/syntax/markdown', { 'for': 'markdown' } " TODO REMOVE?
" Processing
Plug 'sophacles/vim-processing', { 'for': 'processing' }
" RST
Plug '~/.vim_runtime/bundle/syntax/rst-headings', { 'for': 'rst' }
" SCSS
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
" } ==========================================================================

" PLUGINS { ==================================================================
" Core -----------------------------------------------------------------------
" Merge tabs into splits
Plug 'connordelacruz/Tabmerge'
" Search and replace tools + some other neat things
Plug 'tpope/vim-abolish'
" Ack in vim
Plug 'mileszs/ack.vim'
" Vim motions for camelCase and snake_case
Plug 'bkad/CamelCaseMotion'
" Visualize indentation
Plug 'Yggdroot/indentLine'
" Status line
Plug 'itchyny/lightline.vim'

" Editing --------------------------------------------------------------------
" Insert and delete parens, quotes, etc in pairs
Plug 'jiangmiao/auto-pairs'
" Smarter bullet points
Plug 'dkarter/bullets.vim', { 'for': ['markdown', 'text', 'gitcommit'] } " TODO g:bullets_enabled_file_types
" Comment stuff out
Plug 'tpope/vim-commentary'

" Git ------------------------------------------------------------------------
" Git wrapper
Plug 'tpope/vim-fugitive'
" Show changes in the gutter
Plug 'airblade/vim-gitgutter'

" } ==========================================================================

call plug#end()
