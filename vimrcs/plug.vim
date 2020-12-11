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

" SYNTAX & FILETYPE-SPECIFIC { ===============================================
" CSS ------------------------------------------------------------------------
" Colorize CSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] }

" JS -------------------------------------------------------------------------
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Manpage --------------------------------------------------------------------
" Use vim as a manpager
Plug 'lambdalisue/vim-manpager'

" Markdown -------------------------------------------------------------------
" Plug '~/.vim_runtime/bundle/syntax/markdown', { 'for': 'markdown' } " TODO REMOVE?
" Generate table of contents
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }

" Processing -----------------------------------------------------------------
Plug 'sophacles/vim-processing', { 'for': 'processing' }

" Python ---------------------------------------------------------------------
" PEP8-compliant indents
Plug 'Vimjas/vim-python-pep8-indent'

" RST ------------------------------------------------------------------------
" Auto-format headings while typing
Plug '~/.vim_runtime/bundle/syntax/rst-headings', { 'for': 'rst' }

" SCSS -----------------------------------------------------------------------
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

" } ==========================================================================

" PLUGINS { ==================================================================
" Core -----------------------------------------------------------------------
" Merge tabs into splits
Plug 'connordelacruz/Tabmerge'
" Visualize indentation
Plug 'Yggdroot/indentLine'
" Status line
Plug 'itchyny/lightline.vim'
" File explorer
Plug 'preservim/nerdtree'

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
" Show file status in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Navigation & Motion --------------------------------------------------------
" Vim motions for camelCase and snake_case
Plug 'bkad/CamelCaseMotion'
" Improve % matching
Plug 'tmhedberg/matchit'
" TODO TRY OUT:
" Multiple cursors
" Plug 'mg979/vim-visual-multi'

" Search ---------------------------------------------------------------------
" Search and replace tools + some other neat things
Plug 'tpope/vim-abolish'
" Ack in vim
Plug 'mileszs/ack.vim'
" Search for long lines
Plug 'connordelacruz/vim-long-line-search'

" } ==========================================================================

call plug#end()
