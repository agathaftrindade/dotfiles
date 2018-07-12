#!/usr/bin/env bash

if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: please install zsh first.' >&2
  exit 1
fi

# Set zsh as default shell
chsh -s $(which zsh)

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Install Spacemacs
if [ ! -d "~/.emacs.d" ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

function safe_copy {
  [ -f $HOME/$1 ] && mv $HOME/$1 "$HOME/$1.bk$(date +%Y%m%d%H%M%S)"
  ln -s $HOME/dot-files/$1 $HOME/$1
}

safe_copy .spacemacs
safe_copy .zshrc
