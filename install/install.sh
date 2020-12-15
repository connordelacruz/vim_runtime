#!/usr/bin/env bash
# ==============================================================================
# install.sh
#
# Backs up existing .vimrc and update to source .vim_runtime/init.vim.
#
# Author: Connor de la Cruz
# Repo: https://github.com/connordelacruz/vim_runtime
# ==============================================================================
set -e

current_dir="$(pwd)"
# Backup existing vimrc
if [ -f ~/.vimrc ]; then
    echo 'Backing up current .vimrc...'
    cd ~
    # append timestamp to backup file in case .vimrc.bak already exists
    timestamp="$(date +'%s')"
    backup_file=".vimrc.bak.$timestamp"
    cp .vimrc "$backup_file"
    echo "Backup of .vimrc created ($backup_file)"
fi

# create new .vimrc
echo 'Creating new .vimrc...'
echo 'source ~/.vim_runtime/init.vim' > ~/.vimrc
echo 'New .vimrc created.'

cd "$current_dir"
unset current_dir

echo "Extended vim configuration installed successfully."
