#!/bin/sh
set -e

# TODO: backup existing vimrcs

cd ~/.vim_runtime
cat ~/.vim_runtime/vimrcs/basic.vim > ~/.vimrc
echo "Basic vim configuration installed successfully"
