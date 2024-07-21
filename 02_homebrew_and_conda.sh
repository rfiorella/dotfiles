#!/bin/sh

# set some options about whether on a work computer or at home
Help()
{
	echo "Usage: $(basename $0) -h|--help --user"
	echo "Options:"
	echo "  -h, --help	Display this help message."
	echo "  --user		Install assuming no sudo available - biggest change is around installing casks"
}

echo "Setting up your Mac..."
hostarch=$(uname -m)
hostname=$(uname -n)

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if [ -z  "$(which brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # this needs some logic to change based on where brew is actually being installed:
  if [ "${hostarch}" == "arm64" ]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else 
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
#rm -rf $HOME/.zshrc
#ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
# check to see if on work computer, and install extras if we are not:
brew bundle --file ./Brewfile

if [ "${hostname#pn}" != "$hostname" ]; then
  brew bundle --file ./Caskfile_home
else
  brew bundle --file ./Caskfile_work
fi

# Install miniconda:
if [ -z "$(which conda)" ]; then
   mkdir -p ~/miniconda3
  /bin/bash -c "$(curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-${hostarch}.sh -o ~/miniconda3/miniconda.sh)"
  /bin/bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm -rf ~/miniconda3/miniconda.sh
  # apply initialization script:
  ~/miniconda3/bin/conda init zsh
fi

# Clone Github repositories
./clone.sh

