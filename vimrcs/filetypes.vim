" ============================================================================
" Filetype configs
" ============================================================================

" Common =====================================================================
" Disable auto-comment on newline
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Bash =======================================================================
" Assume .sh files are bash by default if shebang isn't present
let g:is_bash = 1
" Enable autopairs space
au FileType sh let g:AutoPairsMapSpace=1

" Git ========================================================================
" Start w/ cursor at the top
" au FileType gitcommit exec 'norm! gg$'
au! VimEnter COMMIT_EDITMSG exec 'norm gg$' | startinsert!

" HTML =======================================================================
au FileType html setlocal ts=2 sts=2 sw=2 expandtab

" JavaScript =================================================================
" js syntax for babelrc
au BufNewFile,BufRead .babelrc set ft=javascript
au FileType javascript,javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab
let g:javascript_plugin_jsdoc = 1

" JSON =======================================================================
au FileType json setlocal ts=2 sts=2 sw=2 expandtab 
au FileType json let g:indentLine_setConceal=0

" Markdown ===================================================================
au BufNewFile,BufReadPost *.md set filetype=markdown
au FileType markdown setlocal tw=80 fo+=t fo-=l
" Disable auto-pairs space insertion for .md
au FileType markdown let g:AutoPairsMapSpace = 0

" Python =====================================================================
" Additional file extensions
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.pyde set ft=python
" Fix auto-pairs not working with prefixed strings
" https://github.com/jiangmiao/auto-pairs/issues/211#issuecomment-564944940
au FileType python let b:AutoPairs = AutoPairsDefine(
            \ {
                \ "f'" : "'", 
                \ 'f"' : '"', 
                \ "r'" : "'", 
                \ 'r"' : '"', 
                \ "b'" : "'", 
                \ 'b"' : '"'
            \ }
        \ )

let python_highlight_all = 1

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

" RestructuredText ===========================================================
au FileType rst setlocal tw=80 fo+=t fo-=l nofoldenable
" Add auto pair for double backtick (``)
" TODO +=?
au FileType rst let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`", "``":"``"}

" SCSS =======================================================================
au FileType scss setlocal ts=2 sts=2 sw=2 expandtab

" Vim ========================================================================
" TODO: verify that this is fixed before removing
" Disable auto-pairs for double quotes
" au FileType vim let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'", '`':'`'}

" YAML =======================================================================
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

