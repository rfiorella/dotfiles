#!/bin/sh

# this script removes all of the infrastructure installed 
# by fresh.

# first, remove miniconda:
rm -rf ~/.miniconda3
echo "Miniconda removed, *but*:"
echo "you need to remove environment variables from"
echo ".zshrc or .zprofile"

# second remove brew and casks:
while [ `brew list | wc -l` -ne 0 ]; do
    for EACH in `brew list`; do
        brew uninstall --force --ignore-dependencies $EACH
    done
done
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

# remove oh-my-zsh:
sh ~/.oh-my-zsh/tools/uninstall.sh

