"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."

" Load global plugins
let s:bundle = s:vim_runtime.'/bundle/'
call pathogen#infect(s:bundle.'{}', s:bundle.'colors/{}', s:bundle.'syntax/{}', s:bundle.'plugin/{}')

" Load local plugins
let s:local = s:vim_runtime.'/local/'
call pathogen#infect(s:local.'{}', s:local.'colors/{}', s:local.'syntax/{}', s:local.'plugin/{}')

call pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree git plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "?",
    \ "Renamed"   : "→",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "-",
    \ "Dirty"     : "x",
    \ "Clean"     : "✓",
    \ 'Ignored'   : "▫",
    \ "Unknown"   : "?"
    \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"[RO]":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ '' ] ]
    \ }

" lightline colorscheme gets overwritten in extended.vim based
" one what default colorscheme is set. If the terminal emulator
" doesn't support true color or 256 color, default the scheme
" to wombat.
let g:lightline.colorscheme = 'wombat'

" Hide redundant insert/replace/visual mode message
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>
" Next/prev hunk
nmap <leader>gn <Plug>GitGutterNextHunk
nmap <leader>gp <Plug>GitGutterPrevHunk
" Stage/undo hunk
nmap <leader>ga <Plug>GitGutterStageHunk
nmap <leader>gp <Plug>GitGutterUndoHunk


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CamelCaseMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call camelcasemotion#CreateMotionMappings('<leader>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Table Mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure for RST tables by default
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabmerge
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set default Tabmerge location to bottom
let g:tm_default_location = 'b'

