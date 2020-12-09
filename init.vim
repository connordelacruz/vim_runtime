" ============================================================================
" Sets runtime path and sources vim config files
" ============================================================================
set runtimepath+=~/.vim_runtime

" Load Plugins ===============================================================
" Plug -----------------------------------------------------------------------
source ~/.vim_runtime/vimrcs/plug.vim
" Pathogen -------------------------------------------------------------------
" TODO REMOVE
let s:vim_runtime = expand('<sfile>:p:h')."/"
" Load global plugins
let s:bundle = s:vim_runtime.'/bundle/'
call pathogen#infect(s:bundle.'{}', s:bundle.'syntax/{}', s:bundle.'plugin/{}')
" Load local plugins
let s:local = s:vim_runtime.'/local/'
call pathogen#infect(s:local.'{}', s:local.'colors/{}', s:local.'syntax/{}', s:local.'plugin/{}')
call pathogen#helptags()

" Source Global Configs ======================================================
source ~/.vim_runtime/vimrcs/general.vim
source ~/.vim_runtime/vimrcs/colors.vim
source ~/.vim_runtime/vimrcs/functions.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins.vim
source ~/.vim_runtime/vimrcs/mappings.vim

" Source Local Configs =======================================================
try
source ~/.vim_runtime/my_configs.vim
catch
endtry

