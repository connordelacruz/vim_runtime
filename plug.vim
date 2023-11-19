" ============================================================================
" vim-plug configs
" ============================================================================

" ============================================================================
" SETUP
" ============================================================================
" Local (unmanaged) plugins
let g:unmanaged_dir = '~/.vim_runtime/unplugged/'
call plug#begin('~/.vim_runtime/plugged')

" ============================================================================
" PLUGINS
" ============================================================================

" Libraries { ================================================================
" Open URLs (required for tyru/open-browser-github.vim)
Plug 'tyru/open-browser.vim'
" } ==========================================================================

" Colorschemes { =============================================================

" Editor ---------------------------------------------------------------------
" Selection of base16 schemes
Plug g:unmanaged_dir . 'colors/base16'
" Fallback for less colorful terminals
Plug 'joshdick/onedark.vim'

" Lightline ------------------------------------------------------------------
Plug g:unmanaged_dir . 'colors/lightline-colors'
" } ==========================================================================

" Syntax & Filetype-Specific { ===============================================

" General --------------------------------------------------------------------
" Color Highlighting
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" To-Do highlighting
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

" HTML -----------------------------------------------------------------------
" Close tags
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'jsx', 'javascript'] }

" Jenkinsfile / Groovy -------------------------------------------------------
Plug 'martinda/Jenkinsfile-vim-syntax'
" Fix Groovy indentation
Plug 'vim-scripts/groovyindent-unix'

" JS -------------------------------------------------------------------------
" TODO: replace w/ https://github.com/yuezk/vim-js 
" Improved JS highlighting
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" JSX
Plug 'maxmellon/vim-jsx-pretty'

" Log Files ------------------------------------------------------------------
Plug 'mtdl9/vim-log-highlighting', { 'for': 'log' }

" Manpage --------------------------------------------------------------------
" Use vim as a manpager
Plug 'lambdalisue/vim-manpager'

" Markdown -------------------------------------------------------------------
" Generate table of contents
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Processing -----------------------------------------------------------------
Plug 'sophacles/vim-processing', { 'for': 'processing' }

" Python ---------------------------------------------------------------------
" PEP8-compliant indents
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
" Docstring generator
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
" Enhanced syntax highlighting
Plug 'vim-python/python-syntax', { 'for': 'python' }

" RST ------------------------------------------------------------------------
" Auto-format headings while typing
Plug g:unmanaged_dir . 'syntax/rst-headings', { 'for': 'rst' }

" SCSS -----------------------------------------------------------------------
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
" } ==========================================================================

" Features { =================================================================

" Core -----------------------------------------------------------------------
" Visualize indentation
Plug 'Yggdroot/indentLine'
" Status line
Plug 'itchyny/lightline.vim'
" Fancy start screen
Plug 'mhinz/vim-startify'
" Register preview
Plug 'junegunn/vim-peekaboo'

" NerdTree -------------------------------------------------------------------
" File explorer
Plug 'preservim/nerdtree'
" Show file status in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Editing --------------------------------------------------------------------
" Insert and delete parens, quotes, etc in pairs
Plug 'jiangmiao/auto-pairs'
" Smarter bullet points
" TODO: g:bullets_enabled_file_types
Plug 'dkarter/bullets.vim', { 'for': ['markdown', 'text', 'gitcommit', 'rst'] } 
" Comment stuff out
Plug 'tpope/vim-commentary'
" Split/join lines
Plug 'AndrewRadev/splitjoin.vim'
" Improve your surroundings
Plug 'tpope/vim-surround'
" Custom surround mappings
Plug g:unmanaged_dir . 'plugin/surround-mappings'
" Create tables in vim
Plug 'dhruvasagar/vim-table-mode'

" Text alignment -------------------------------------------------------------
" Tabular alignment
Plug 'godlygeek/tabular'

" Git ------------------------------------------------------------------------
" Git wrapper
Plug 'tpope/vim-fugitive'
" Show changes in the gutter
Plug 'airblade/vim-gitgutter'
" Open GitHub URLs (requires tyru/open-browser.vim)
Plug 'tyru/open-browser-github.vim'

" Navigation & Motion --------------------------------------------------------
" Vim motions for camelCase and snake_case
Plug 'bkad/CamelCaseMotion'
" Improve % matching
Plug 'andymass/vim-matchup'

" Search ---------------------------------------------------------------------
" Search and replace tools + some other neat things
Plug 'tpope/vim-abolish'
" Ack in vim
Plug 'mileszs/ack.vim'
" Search for long lines
Plug 'connordelacruz/vim-long-line-search'
" Look for TO-DOs
Plug g:unmanaged_dir . 'plugin/tasklist'
" Select text in visual mode and search for it with *
Plug 'bronson/vim-visual-star-search'

" Tabs -----------------------------------------------------------------------
" Nicer tabline
Plug 'sangdol/mintabline.vim'
" Merge tabs into splits
Plug 'connordelacruz/Tabmerge'

" Misc -----------------------------------------------------------------------
" Increase happiness
Plug 'idanarye/vim-smile'
" } ==========================================================================

" Local Plugins { ============================================================
try
    source ~/.vim_runtime/local_plug.vim
catch
endtry
" } ==========================================================================

" Post { =====================================================================
" Devicons (must be loaded after relevant plugins)
Plug 'ryanoasis/vim-devicons'

" } ==========================================================================
call plug#end()
