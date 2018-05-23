" ============================================================
" oceanicnext
" Author: Mike Hartington
" Source: https://github.com/mhartington/oceanic-next
" ============================================================

let s:p = {"normal": {}, "inactive": {}, "insert": {}, "replace": {}, "visual": {}, "tabline": {} }

let s:p.normal.left = [[["#ffffff", 15], ["#6699cc", 68]], [["#ffffff", 15], ["#5b89b7", 243]]]
let s:p.normal.middle = [[["#ffffff", 15], ["#5b89b7", 237]]]
let s:p.normal.right = [[["#ffffff", 15], ["#6699cc", 243]], [["#ffffff", 15], ["#6699cc", 243]]]
let s:p.normal.error = [[["#ffffff", 15], ["#ec5f67", 203]]]
let s:p.normal.warning = [[["#ffffff", 15], ["#fac863", 221]]]

let s:p.inactive.left = [[["#d8dee9", 253], ["#65737e", 243]], [["#d8dee9", 253], ["#343d46", 237]]]
let s:p.inactive.middle = [[["#65737e", 243], ["#343d46", 237]]]
let s:p.inactive.right = [[["#d8dee9", 253], ["#65737e", 237]], [["#d8dee9", 253], ["#65737e", 243]]]

let s:p.insert.left = [[["#ffffff", 15], ["#99c794", 114]], [["#ffffff", 15], ["#89b385", 243]]]
let s:p.insert.middle = [[["#ffffff", 15], ["#89b385", 237]]]
let s:p.insert.right = [[["#ffffff", 15], ["#99c794", 243]], [["#ffffff", 15], ["#99c794", 114]]]

let s:p.replace.left = [[["#ffffff", 15], ["#ec5f67", 203]], [["#ffffff", 15], ["#d4555c", 243]]]
let s:p.replace.middle = [[["#ffffff", 15], ["#d4555c", 237]]]
let s:p.replace.right = [[["#ffffff", 15], ["#ec5f67", 243]], [["#ffffff", 15], ["#ec5f67", 203]]]

let s:p.visual.left = [[["#ffffff", 15], ["#f99157", 209]], [["#ffffff", 15], ["#e0824e", 243]]]
let s:p.visual.middle = [[["#ffffff", 15], ["#e0824e", 237]]]
let s:p.visual.right = [[["#ffffff", 15], ["#f99157", 243]], [["#ffffff", 15], ["#f99157", 209]]]

let s:p.tabline.left = [[["#65737e", 243], ["#343d46", 237]]]
let s:p.tabline.tabsel = [[["#ffffff", 15], ["#65737e", 243]]]
let s:p.tabline.middle = [[["#65737e", 243], ["#343d46", 237]]]
let s:p.tabline.right = [[["#65737e", 243], ["#343d46", 237]]]

let g:lightline#colorscheme#oceanicnext#palette = lightline#colorscheme#flatten(s:p)
