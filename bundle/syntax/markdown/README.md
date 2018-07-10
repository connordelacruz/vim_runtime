# Markdown Syntax

Custom syntax highlighting and indentation for markdown files.

## Indent

Indentation is based on the [builtin RST indent
file](https://github.com/vim/vim/blob/master/runtime/indent/rst.vim). It's
modified slightly to have similar automatic list indentation for markdown.

## Syntax

The syntax file is almost identical to [Tim
Pope's](https://github.com/tpope/vim-markdown/blob/master/syntax/markdown.vim),
but slightly modified to fix multi-line nested lists getting highlighted as if
they were code blocks. I generally use backticks to denote code blocks, but the
[original markdown
specification](https://daringfireball.net/projects/markdown/syntax#precode) uses
indentation, which leads to nested lists with 2+ lines getting highlighted as
code.

