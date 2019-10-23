" ============================================================================
" Sets runtime path and sources vim config files
" ============================================================================
set runtimepath+=~/.vim_runtime

" TODO: reminder to update .vimrc after feature/single-source
" TODO REMOVE NOW
let g:vimrc_updated=1

" TODO replace w/ new files, figure out import order (e.g. extended was last but now is merged w/ basic..)
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
