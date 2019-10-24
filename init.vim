" ============================================================================
" Sets runtime path and sources vim config files
" ============================================================================
set runtimepath+=~/.vim_runtime

" Load plugins with pathogen first
source ~/.vim_runtime/vimrcs/load-plugins.vim

source ~/.vim_runtime/vimrcs/general.vim
source ~/.vim_runtime/vimrcs/colors.vim
source ~/.vim_runtime/vimrcs/functions.vim
source ~/.vim_runtime/vimrcs/mappings.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

