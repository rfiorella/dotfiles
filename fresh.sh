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

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # this needs some logic to change based on where brew is actually being installed:
  if [ `uname -m` == "arm64" ]; then
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
brew bundle --file ./Brewfile

# Install miniconda:
if test ! $(which conda); then
   mkdir -p ~/miniconda3
  /bin/bash -c "$(curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-`uname -m`.sh -o ~/miniconda3/miniconda.sh)"
  /bin/bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm -rf ~/miniconda3/miniconda.sh
  # apply initialization script:
  ~/miniconda3/bin/conda init zsh
fi

# Set default MySQL root password and auth type
#mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Create a projects directories
#mkdir $HOME/Code
#mkdir $HOME/Herd

# Create Code subdirectories
#mkdir $HOME/Code/blade-ui-kit
#mkdir $HOME/Code/laravel

# Clone Github repositories
#./clone.sh

# Symlink the Mackup config file to the home directory
#ln -s ./.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
#source ./.macos
