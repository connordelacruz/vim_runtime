""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local (unmanaged) plugins
let g:unmanaged_dir = '~/.vim_runtime/unplugged/'
" TODO make configurable dir e.g. let g:plug_dir
"https://github.com/junegunn/vim-plug/issues/182
call plug#begin('~/.vim_runtime/plugged')
" ============================================================================
" LIBRARIES { 
" ============================================================================
Plug 'vim-scripts/tlib'
" }
" ============================================================================
" COLORSCHEMES { 
" ============================================================================
" Editor ---------------------------------------------------------------------
" Selection of base16 schemes
Plug g:unmanaged_dir . 'colors/base16'
" Fallback for less colorful terminals
Plug 'joshdick/onedark.vim'
" Lightline ------------------------------------------------------------------
Plug g:unmanaged_dir . 'colors/lightline-colors'
" }
" ============================================================================
" SYNTAX & FILETYPE-SPECIFIC {
" ============================================================================
" General --------------------------------------------------------------------
" Color Highlighting
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Doc block generator + custom templates
" TODO FIGURE OUT AND RE-ENABLE
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug g:unmanaged_dir . 'plugin/doge-custom'
" HTML -----------------------------------------------------------------------
" Close tags
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'jsx', 'markdown'] }
" JS -------------------------------------------------------------------------
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Manpage --------------------------------------------------------------------
" Use vim as a manpager
Plug 'lambdalisue/vim-manpager'
" Markdown -------------------------------------------------------------------
" Generate table of contents
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
" Processing -----------------------------------------------------------------
Plug 'sophacles/vim-processing', { 'for': 'processing' }
" Python ---------------------------------------------------------------------
" PEP8-compliant indents
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
" RST ------------------------------------------------------------------------
" Auto-format headings while typing
Plug g:unmanaged_dir . 'syntax/rst-headings', { 'for': 'rst' }
" SCSS -----------------------------------------------------------------------
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
" }
" ============================================================================
" PLUGINS {
" ============================================================================
" Core -----------------------------------------------------------------------
" TODO
" if has('nvim')
"     " Code completion
"     Plug 'neoclide/coc.nvim', {'branch': 'release'}
" endif
" Visualize indentation
Plug 'Yggdroot/indentLine'
" Status line
Plug 'itchyny/lightline.vim'
" File explorer
Plug 'preservim/nerdtree'
" Fancy start screen
Plug 'mhinz/vim-startify'
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
" TODO: filetypes 
Plug 'dhruvasagar/vim-table-mode'
" TODO TRY OUT:
" Auto-increment sequences of numbers or letters
" Plug 'triglav/vim-visual-increment'
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
" Look for TO-DOs
Plug g:unmanaged_dir . 'plugin/tasklist'
" Select text in visual mode and search for it with *
Plug 'bronson/vim-visual-star-search'
" Tabs -----------------------------------------------------------------------
" Merge tabs into splits
Plug 'connordelacruz/Tabmerge'
" Customize tabline
Plug g:unmanaged_dir . 'plugin/set_tabline'
" Misc -----------------------------------------------------------------------
" Increase happiness
Plug 'idanarye/vim-smile'
" }
" ============================================================================
" LOCAL PLUGINS { 
" ============================================================================
try
    source ~/.vim_runtime/local_plug.vim
catch
endtry
" }
call plug#end()
