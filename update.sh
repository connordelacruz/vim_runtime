#!/bin/bash
# Older versions of git don't have the -C option
current_dir="$(pwd)"
cd ~/.vim_runtime/

echo 'Pulling recent changes...'
git pull --rebase

echo 'Updating submodules...'
git submodule update --init --recursive

cd "$current_dir"
unset current_dir

echo 'Finished.'
