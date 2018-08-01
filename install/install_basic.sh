#!/usr/bin/env bash
# ==============================================================================
# install_basic.sh
#
# Backs up existing .vimrc and installs the basic vim configurations.
#
# Author: Connor de la Cruz
# Repo: https://github.com/connordelacruz/vim_runtime
# ==============================================================================

set -e

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


cat ~/.vim_runtime/vimrcs/basic.vim > ~/.vimrc
echo "Basic vim configuration installed successfully."
