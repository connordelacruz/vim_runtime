" ============================================================================
" Plugin configurations
" ============================================================================
" TODO REFORMAT/ORGANIZE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorizer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:colorizer_auto_filetype='css,scss,html,processing'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '▏'
let g:indentLine_color_gui = "#343D46"
" Disable setting conceal for markdown
au FileType markdown let g:indentLine_setConceal = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
" Close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Set to 1 to open by default
let NERDTreeOpenByDefault=0
" If opening by default, exclude these filetypes
let noNERD = ['gitcommit', 'man']
if NERDTreeOpenByDefault
    autocmd vimenter * if index(noNERD, &ft) < 0 | NERDTree %:p:h | wincmd p | endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree git plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'*',
                \ 'Staged'    :'+',
                \ 'Untracked' :'?',
                \ 'Renamed'   :'→',
                \ 'Unmerged'  :'=',
                \ 'Deleted'   :'-',
                \ 'Dirty'     :'x',
                \ 'Clean'     :'✓',
                \ 'Ignored'   :'▫',
                \ 'Unknown'   :'?',
                \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
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
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
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
" Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Table Mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure for RST tables by default
" TODO: just do for python? 
" let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabmerge
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set default Tabmerge location to bottom
let g:tm_default_location = 'b'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-closetag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable closetag for React js(x) files
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.js,*.jsx"

