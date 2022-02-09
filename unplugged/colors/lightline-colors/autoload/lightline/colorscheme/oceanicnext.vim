" ============================================================
" oceanicnext
"
" Author: Connor de la Cruz
"
" Original Author: Mike Hartington
" Based On: https://github.com/mhartington/oceanic-next
" ============================================================

let s:p = {"normal": {}, "inactive": {}, "insert": {}, "replace": {}, "visual": {}, "tabline": {} }

let s:p.normal.left = [[["#ffffff", 15], ["#6699cc", 68], 'bold'], [["#ffffff", 15], ["#3D7AB8", 243]]]
let s:p.normal.middle = [[["#ffffff", 15], ["#2E5C8A", 237]]]
let s:p.normal.right = copy(s:p.normal.left)
let s:p.normal.error = [[["#ffffff", 15], ["#ec5f67", 203]]]
let s:p.normal.warning = [[["#ffffff", 15], ["#fac863", 221]]]

let s:p.inactive.left = [[["#d8dee9", 253], ["#65737e", 243]], [["#d8dee9", 253], ["#343d46", 237]]]
let s:p.inactive.middle = [[["#65737e", 243], ["#343d46", 237]]]
let s:p.inactive.right = [[["#d8dee9", 253], ["#65737e", 237]], [["#d8dee9", 253], ["#65737e", 243]]]

let s:p.insert.left = [[["#ffffff", 15], ["#5FB3B3", 114], 'bold'], [["#ffffff", 15], ["#489999", 243]]]
let s:p.insert.middle = [[["#ffffff", 15], ["#346F6F", 237]]]
let s:p.insert.right = copy(s:p.insert.left)

let s:p.replace.left = [[["#ffffff", 15], ["#F99157", 209], 'bold'], [["#ffffff", 15], ["#F87D3A", 243]]]
let s:p.replace.middle = [[["#ffffff", 15], ["#EC5809", 237]]]
let s:p.replace.right = copy(s:p.replace.left)

let s:p.visual.left = [[["#ffffff", 15], ["#ec5f67", 203], 'bold'], [["#ffffff", 15], ["#E7363F", 243]]]
let s:p.visual.middle = [[["#ffffff", 15], ["#C91820", 237]]]
let s:p.visual.right = copy(s:p.visual.left)

let s:p.tabline.left = [[["#65737e", 243], ["#343d46", 237]]]
let s:p.tabline.tabsel = [ [["#ffffff", 15], ["#65737e", 243], 'bold'] ]
let s:p.tabline.middle = [[["#65737e", 243], ["#343d46", 237]]]
let s:p.tabline.right = [[["#65737e", 243], ["#343d46", 237]]]

let g:lightline#colorscheme#oceanicnext#palette = lightline#colorscheme#flatten(s:p)
