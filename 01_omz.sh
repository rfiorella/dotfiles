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
