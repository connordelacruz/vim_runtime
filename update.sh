#!/bin/bash
# Older versions of git don't have the -C option
current_dir="$(pwd)"
cd ~/.vim_runtime/
git pull --rebase
git submodule init
git submodule update
cd "$current_dir"
unset current_dir
