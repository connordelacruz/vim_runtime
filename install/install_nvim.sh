#!/usr/bin/env bash
set -e
# ==============================================================================
# Backs up existing ~/.config/nvim/init.vim and configures nvim to source
# ~/.vimrc.
#
# Author: Connor de la Cruz
# Repo: https://github.com/connordelacruz/vim_runtime
# ==============================================================================

backup_nvimrc() {
    echo 'Backing up current init.vim...'
    local timestamp="$(date +'%s')"
    local backup_file="init.vim.bak.$timestamp"
    cp "$HOME/.config/nvim/init.vim" "$HOME/.config/nvim/$backup_file"
    echo "Backup created: $backup_file"
    echo ''
}

main() {
    # Make ~/.config/nvim/ if it doesn't already exist
    mkdir -p ~/.config/nvim
    if [ -f ~/.config/nvim/init.vim ]; then
        backup_nvimrc
    fi
    echo 'source ~/.vimrc' > ~/.config/nvim/init.vim
    echo 'Configured nvim to source ~/.vimrc'
    # TODO pip3 install neomvim
}

main "$@"

