" ============================================================================
" Load pathogen plugins
" ============================================================================
" TODO rename init-pathogen.vim? Merge w/ plugins and just import before colors/filetypes??
let s:vim_runtime = expand('<sfile>:p:h')."/.."

" Load global plugins
let s:bundle = s:vim_runtime.'/bundle/'
call pathogen#infect(s:bundle.'{}', s:bundle.'colors/{}', s:bundle.'syntax/{}', s:bundle.'plugin/{}')
" Load local plugins
let s:local = s:vim_runtime.'/local/'
call pathogen#infect(s:local.'{}', s:local.'colors/{}', s:local.'syntax/{}', s:local.'plugin/{}')

call pathogen#helptags()

