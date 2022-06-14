" ============================================================================
" Plugin configurations
" ============================================================================

" Colorizer ==================================================================
" Plugin configs
let g:Hexokinase_ftEnabled=['css', 'scss', 'html', 'processing']
let g:Hexokinase_highlighters = ['background', 'sign_column']
" Command alias (I can never remember the plugin's name)
command! ColorHighlightToggle :HexokinaseToggle
" Fugitive ===================================================================
" Aliases
command! Gco :silent w | :Git commit -av
command! Gcv :Git commit -v
command! GaddCurrent :Git add %
command! GpushHead :Git push -u origin HEAD
" Git gutter =================================================================
let g:gitgutter_enabled=1
" Grep =======================================================================
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH
" indentLine =================================================================
let g:indentLine_char = '▏'
let g:indentLine_color_gui = "#343D46"
" Excluded filetypes
let g:indentLine_fileTypeExclude = ['startify']
" Disable setting conceal for markdown
au FileType markdown let g:indentLine_setConceal = 0
" NERDTree ===================================================================
" CORE CONFIGS ---------------------------------------------------------------
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeMinimalUI=1
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" OPEN BY DEFAULT ------------------------------------------------------------
" Set to 1 to open by default
let NERDTreeOpenByDefault=1
" Don't open by default for windows narrower than this
let NERDDefaultMinWidth=130
" Don't open by default if directory has too many files
let NERDDefaultMaxFiles=80
" If opening by default, exclude these filetypes
let noNERD = ['gitcommit', 'man']
if NERDTreeOpenByDefault
    " Start NERDTree. If a file is specified, move the cursor to its window.
    " Will not start if file is in noNERD or window is too narrow or filetype
    " is in noNERD, or if the number of files in the target directory exceed
    " NERDDefaultMaxFiles.
    " If no args are provided (and file isn't a man page), open Startify.
    " Note: updates lightline after switching windows to fix a bug with the
    " mode not showing.
    augroup NERD
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * 
                    \ if !argc() && &ft != 'man' 
                    \ | Startify
                    \ | endif
                    \ | if index(noNERD, &ft) < 0 && 
                        \ winwidth('%') >= NERDDefaultMinWidth &&
                        \ len(split(globpath(expand('%:p:h'), '*'), '\n')) <= NERDDefaultMaxFiles
                    \ | NERDTree %:p:h 
                    \ | wincmd p | call lightline#update() 
    augroup END
endif
" HIDE LIGHTLINE -------------------------------------------------------------
" Hack to hide lightline on nerdtree buffers
augroup filetype_nerdtree
" TODO BETTER DOC: https://vi.stackexchange.com/a/22414
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu
" NERDTREE GIT PLUGIN --------------------------------------------------------
" Custom symbols
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'*',
                \ 'Staged'    :'+',
                \ 'Untracked' :'?',
                \ 'Renamed'   :'→',
                \ 'Unmerged'  :'=',
                \ 'Deleted'   :'-',
                \ 'Dirty'     :'~',
                \ 'Clean'     :'✓',
                \ 'Ignored'   :'▫',
                \ 'Unknown'   :'?',
                \ }
" TODO: figure out how to customize colors
" NERDTREE SYNTAX HIGHLIGHTING -----------------------------------------------
" TODO: customize colors https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
" lightline ==================================================================
" Lightline configs
" NOTE: for powerline font separators in iTerm2, should enable "Use built-in Powerline glyphs" for profile for best alignment
" https://iterm2.com/documentation-preferences-profiles-text.html
let g:lightline = {
      \ 'active': {
          \ 'left': [ ['mode', 'paste'],
          \           ['filename', 'readonly', 'fugitive', 'modified'] ],
          \ 'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'inactive': {
          \ 'left': [ ['readonly', 'filename', 'modified'] ],
      \ },
      \ 'component': {
          \ 'readonly': '%{&filetype=="help"?"":&readonly?"[RO]":""}',
          \ 'modified': '%{&filetype=="help"?"":&modified?"*":&modifiable?"":"-"}',
          \ 'fugitive': '%{(exists("*FugitiveHead") && ""!=FugitiveHead())?"".FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
          \ 'readonly': '(&filetype!="help"&& &readonly)',
          \ 'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
          \ 'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'tabline': {
          \ 'left': [ [ 'tabs' ] ],
          \ 'right': [ [ '' ] ]
      \ },
      \ 'tabline_separator': { 'left': ' ', 'right': ' ' },
      \ 'tabline_subseparator': { 'left': ' ', 'right': ' ' },
\ }
" TODO: custom tab function for tabnum w/ brackets around active? Also change modified symbol from + to *

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
" open-browser-github ========================================================
" Open using branch instead of commit hash
let g:openbrowser_github_always_use_commit_hash = 0
" peekaboo ===================================================================
" Where to open window
let g:peekaboo_window = 'botright 25new'
" Tabmerge ===================================================================
" Set default Tabmerge location to bottom
let g:tm_default_location = 'b'
" To-Do ======================================================================
lua << EOF
  require("todo-comments").setup {
      -- Hide signs in column (don't really use and may improve performance)
      signs = false,
      -- Priority of column signs (want gitgutter to have higher priority)
      -- sign_priority = 15,
      -- Highlight configs
      highlight = {
          -- pattern or table of patterns, used for highlighting (vim regex)
          -- (Same as default except without ':') TODO: but maybe we should use ':'
          pattern = [[.*<(KEYWORDS)\s*]], 
          },
      -- list of named colors where we try to extract the guifg from the
      -- list of hilight groups or use the hex color if hl not found as a fallback
      -- TESTING:
      -- TODO: lorem ipsum
      -- FIX: lorem ipsum
      -- WARNING: lorem ipsum
      -- NOTE: lorem ipsum
      -- PERF: lorem ipsum
      -- HACK: lorem ipsum
      colors = {
          -- Red
          error = { "ErrorMsg", "#DC2626" },
          -- Yellow
          info = { "Todo", "#FBBF24" },
          -- Orange
          warning = { "Constant", "#2563EB" },
          -- Cyan
          hint = { "Special", "#10B981" },
          -- Purple
          default = { "Keyword", "#7C3AED" },
          },
  }
EOF
" Startify ===================================================================
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
" Replace paths w/ env vars (if it'd be shorter)
let g:startify_use_env = 1
" vim-closetag ===============================================================
" Enable closetag for React js(x) files
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.js,*.jsx"

