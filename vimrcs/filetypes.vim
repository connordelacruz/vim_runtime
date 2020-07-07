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
" Start w/ cursor at the top
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

" TODO: this doesn't work so hot, make it more useful?
" From https://gist.github.com/aroben/d54d002269d9c39f0d5c89d910f7307e
" BufRead seems more appropriate here but for some reason the final `wincmd p` doesn't work if we do that.
" autocmd VimEnter COMMIT_EDITMSG call OpenCommitMessageDiff()
" function OpenCommitMessageDiff()
"   " Save the contents of the z register
"   let old_z = getreg("z")
"   let old_z_type = getregtype("z")

"   try
"     call cursor(1, 0)
"     let diff_start = search("^diff --git")
"     if diff_start == 0
"       " There's no diff in the commit message; generate our own.
"       let @z = system("git diff --cached -M -C")
"     else
"       " Yank diff from the bottom of the commit message into the z register
"       :.,$yank z
"       call cursor(1, 0)
"     endif

"     " Paste into a new buffer
"     vnew
"     normal! V"zP
"   finally
"     " Restore the z register
"     call setreg("z", old_z, old_z_type)
"   endtry

"   " Configure the buffer
"   set filetype=diff noswapfile nomodified readonly
"   silent file [Changes\ to\ be\ committed]

"   " Get back to the commit message
"   wincmd p
"   " Move cursor to end of first line in commit message
"   exec 'norm gg$'
" endfunction

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

