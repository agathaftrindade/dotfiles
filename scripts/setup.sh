#!/usr/bin/env bash

DOTFILES="$HOME/dot-files"

if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: please install zsh first.' >&2
  exit 1
fi

# Install ohmyzsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    $DOTFILES/scripts/install-zsh.sh
fi

#Install Spacemacs
if [ ! -d "$HOME/.emacs.d" ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

function safe_link {
  [ -f $HOME/$1 ] && echo $1 already exists && return #mv $HOME/$1 "$HOME/$1.bk$(date +%Y%m%d%H%M%S)"
  ln -s -T $DOTFILES/$1 $HOME/$1 && echo $1 symlinked
}

safe_link .spacemacs
safe_link .zshrc
safe_link .config/i3
safe_link .config/i3blocks

