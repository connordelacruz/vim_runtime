""""""""""""""""""""""""""""""
" => Common
""""""""""""""""""""""""""""""
" Disable auto-comment on newline
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""
" => Git
""""""""""""""""""""""""""""""
" Start on first line of commit messages
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""
" => HTML
""""""""""""""""""""""""""""""
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab

""""""""""""""""""""""""""""""
" => JavaScript
""""""""""""""""""""""""""""""
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
let g:javascript_plugin_jsdoc = 1

""""""""""""""""""""""""""""""
" => Python 
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
au BufNewFile,BufRead *.pyde set ft=python

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au FileType markdown setlocal tw=80 fo+=t fo-=l

""""""""""""""""""""""""""""""
" => RestructuredText
""""""""""""""""""""""""""""""

au FileType rst setlocal tw=80 fo+=t fo-=l

""""""""""""""""""""""""""""""
" => SCSS
""""""""""""""""""""""""""""""

autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab

""""""""""""""""""""""""""""""
" => YAML
""""""""""""""""""""""""""""""

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


