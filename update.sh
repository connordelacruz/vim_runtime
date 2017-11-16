#!/bin/bash
# Older versions of git don't have the -C option
current_dir="$(pwd)"
cd ~/.vim_runtime/

# Update remotes (after moving from Bitbucket to GitHub)
if git remote -v | grep -q 'origin\s*https://connordelacruz@bitbucket.org/connordelacruz/vim_runtime.git'; then
    echo 'Updating remote origin url...'
    git remote rm origin
    git remote set-url origin https://github.com/connordelacruz/vim_runtime.git
    echo 'Remote url updated.'
fi

echo 'Pulling recent changes...'
git pull --rebase

echo 'Updating submodules...'
git submodule update --init --recursive

cd "$current_dir"
unset current_dir

echo 'Finished.'
