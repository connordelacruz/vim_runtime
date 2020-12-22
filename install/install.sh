#!/usr/bin/env bash
set -e
# ==============================================================================
# Backs up existing .vimrc and update to source .vim_runtime/init.vim.
#
# Author: Connor de la Cruz
# Repo: https://github.com/connordelacruz/vim_runtime
# ==============================================================================

backup_vimrc() {
    echo 'Backing up current .vimrc...'
    local timestamp="$(date +'%s')"
    local backup_file=".vimrc.bak.$timestamp"
    cp "$HOME/.vimrc" "$HOME/$backup_file"
    echo "Backup created: $backup_file"
    echo ''
}

create_vimrc() {
    echo 'Creating new .vimrc...'
    echo 'source ~/.vim_runtime/init.vim' > ~/.vimrc
    echo 'New .vimrc created.'
    echo ''
}

install_plugins() {
    echo 'Installing plugins...'
    vim +PlugInstall +qa
    echo ''
}

main() {
    if [ -f ~/.vimrc ]; then
        backup_vimrc
    fi
    create_vimrc
    install_plugins
    echo 'Setup complete.'
}

main "$@"

