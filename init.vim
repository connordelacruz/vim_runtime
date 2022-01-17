" ============================================================================
" The root rc file to source. Sets runtime path and sources vim config files.
" ============================================================================

set runtimepath+=~/.vim_runtime
" Load Plugins ===============================================================
source ~/.vim_runtime/plug.vim
" Source Global Configs ======================================================
source ~/.vim_runtime/vimrcs/general.vim
source ~/.vim_runtime/vimrcs/colors.vim
source ~/.vim_runtime/vimrcs/functions.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins.vim
source ~/.vim_runtime/vimrcs/mappings.vim
" Source Local Configs =======================================================
try
    source ~/.vim_runtime/local_configs.vim
catch
endtry
