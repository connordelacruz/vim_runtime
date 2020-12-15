#!/usr/bin/env bash
# ==============================================================================
# update.sh
#
# Pulls updates from remote repo.
#
# Author: Connor de la Cruz
# Repo: https://github.com/connordelacruz/vim_runtime
# ==============================================================================

# TODO: Add --help argument
# TODO: Add --clean argument (run git clean -dff)
# TODO: Add --check argument (checks for updates, doesn't apply)

# Older versions of git don't have the -C option
current_dir="$(pwd)"
cd ~/.vim_runtime/

echo 'Pulling recent changes...'
git pull --rebase

cd "$current_dir"
unset current_dir

echo 'Finished.'
