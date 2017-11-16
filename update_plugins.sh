#!/bin/bash
# Pull from submodule remotes

# Older versions of git don't have the -C option
current_dir="$(pwd)"
cd ~/.vim_runtime/

echo 'Pulling changes from plugin remote repos...'
git submodule foreach git pull origin master

cd "$current_dir"
unset current_dir

echo 'Plugins updated. Changes will need to be committed.'
