#!/usr/bin/env bash
# ==============================================================================
# install_extended.sh
#
# Backs up existing .vimrc and installs the extended vim configurations.
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

# create new .vimrc
echo 'Creating new .vimrc...'
echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc
echo 'New .vimrc created.'

# Initialize submodules
echo 'Initializing plugin submodules...'
current_dir="$(pwd)"

cd ~/.vim_runtime

git submodule update --init --recursive

cd "$current_dir"
unset current_dir
echo 'Plugin submodules initialized.'

echo "Extended vim configuration installed successfully."
