#!/usr/bin/env bash

if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: please install zsh first.' >&2
  exit 1
fi

# Set zsh as default shell
if [[ "$SHELL" != *zsh ]]; then
  chsh -s $(which zsh)
fi

# Install ohmyzsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#Install Spacemacs
if [ ! -d "$HOME/.emacs.d" ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

function safe_link {
  [ -f $HOME/$1 ] && echo $1 already exists && return #mv $HOME/$1 "$HOME/$1.bk$(date +%Y%m%d%H%M%S)"
  ln -s -T $HOME/dot-files/$1 $HOME/$1 && echo $1 symlinked
}

safe_link .spacemacs
safe_link .zshrc
safe_link .config/i3
safe_link .config/i3blocks

