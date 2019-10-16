" ============================================================================
" Sets runtime path and sources vim config files
" ============================================================================
set runtimepath+=~/.vim_runtime

" TODO: reminder to update .vimrc after feature/single-source
let g:vimrc_updated=1

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
