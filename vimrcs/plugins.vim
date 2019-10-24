"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO re-organize to be in line w/ new rc's

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
" TODO: show pull/push arrows for git repo?
" TODO: higher contrast between sections in theme
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
      \ 'subseparator': { 'left': '|', 'right': ' ' }
      \ }

let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ '' ] ]
    \ }

" Set lightline colorscheme to match vim colorscheme
if exists('g:colors_name') && g:colors_name =~ 'oceanicnext'
    let g:lightline.colorscheme = 'oceanicnext'
elseif exists('g:colors_name') && g:colors_name =~ 'onedark'
    let g:lightline.colorscheme = 'onedark'
" Default to wombat
else
    let g:lightline.colorscheme = 'wombat'
endif

" Hide redundant insert/replace/visual mode message
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>
" Next/prev hunk
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
" Stage/undo hunk
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CamelCaseMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: see if there's a way to toggle on/off instead of pressing leader each time
call camelcasemotion#CreateMotionMappings('<leader>')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Table Mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure for RST tables by default
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
" <leader>T prefix
let g:table_mode_map_prefix='<leader>T'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabmerge
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set default Tabmerge location to bottom
let g:tm_default_location = 'b'
" Mapping
nnoremap <leader>tm :Tabmerge<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:header = [
            \ '                              ',
            \ '            ╷ ╷               ',
            \ '            │ │               ',
            \ '            ║ ║               ',
            \ '            ║ ║               ',
            \ '           ▐███▌              ',
            \ '           ▐███▌      │   │   ',
            \ '           ▐███▌      ╽   ╽   ',
            \ '          ▐█████▌     ┃   ┃   ',
            \ '          ▐█████▌     █████   ',
            \ '    ▄██▄  ▐█████▌     █████   ',
            \ '    ████ ▐███████▌    █████   ',
            \ '    ████ ▐███████▌   ▐█████▌  ',
            \ '  ▐██████████████▌   ▐█████▌  ',
            \ '  ▐█████████████████▌▐█████▌  ',
            \ '  ▐█████████████████████████  ',
            \ '██████████████████████████████',
            \ '██████████████████████████████',
            \ ]

let g:startify_custom_header = startify#center(s:header)

