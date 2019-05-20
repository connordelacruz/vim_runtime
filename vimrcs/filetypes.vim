""""""""""""""""""""""""""""""
" => Common
""""""""""""""""""""""""""""""
" Disable auto-comment on newline
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""
" => Bash
""""""""""""""""""""""""""""""
" Assume .sh files are bash by default if shebang isn't present
let g:is_bash = 1

""""""""""""""""""""""""""""""
" => Git
""""""""""""""""""""""""""""""
" Start on first line of commit messages
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""
" => HTML
""""""""""""""""""""""""""""""
au FileType html setlocal ts=2 sts=2 sw=2 expandtab

""""""""""""""""""""""""""""""
" => JavaScript
""""""""""""""""""""""""""""""
au BufNewFile,BufRead .babelrc set ft=javascript
au FileType javascript,javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab
let g:javascript_plugin_jsdoc = 1

""""""""""""""""""""""""""""""
" => JSON
""""""""""""""""""""""""""""""
au FileType json setlocal ts=2 sts=2 sw=2 expandtab

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
au BufNewFile,BufReadPost *.md set filetype=markdown
au FileType markdown setlocal tw=80 fo+=t fo-=l
" Disable auto-pairs space insertion for .md
au FileType markdown let g:AutoPairsMapSpace = 0

""""""""""""""""""""""""""""""
" => RestructuredText
""""""""""""""""""""""""""""""
au FileType rst setlocal tw=80 fo+=t fo-=l
" Add auto pair for double backtick (``)
au FileType rst let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`", "``":"``"}

""""""""""""""""""""""""""""""
" => SCSS
""""""""""""""""""""""""""""""
au FileType scss setlocal ts=2 sts=2 sw=2 expandtab

""""""""""""""""""""""""""""""
" => Vim
""""""""""""""""""""""""""""""
" TODO: verify that this is fixed before removing
" Disable auto-pairs for double quotes
" au FileType vim let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'", '`':'`'}

""""""""""""""""""""""""""""""
" => YAML
""""""""""""""""""""""""""""""
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

