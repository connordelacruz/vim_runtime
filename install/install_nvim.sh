#!/usr/bin/env bash
# ==============================================================================
# install_nvim.sh
#
# Backs up existing ~/.config/nvim/init.vim and configures nvim to source
# ~/.vimrc for its configurations.
#
# Author: Connor de la Cruz
# Repo: https://github.com/connordelacruz/vim_runtime
# ==============================================================================

set -e

# Make ~/.config/nvim/ if it doesn't already exist
mkdir -p ~/.config/nvim

# Backup existing init.vim
if [ -f ~/.config/nvim/init.vim ]; then
    echo 'Backing up current init.vim...'
    cd ~/.config/nvim
    # append timestamp to backup file in case init.vim.bak already exists
    timestamp="$(date +'%s')"
    backup_file="init.vim.bak.$timestamp"
    cp init.vim "$backup_file"
    echo "Backup of init.vim created ($backup_file)"
fi

echo 'source ~/.vimrc' > ~/.config/nvim/init.vim

echo "Configured nvim to source ~/.vimrc"

