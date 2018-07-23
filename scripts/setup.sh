#!/usr/bin/env bash

DOTFILES="$HOME/dotfiles"

safe_link() {
  [ -e $HOME/$1 ] && echo $1 already exists && return 
  ln -s -T $DOTFILES/$1 $HOME/$1 && echo $1 symlinked
}

safe_cp() { 
  #mv $HOME/$1 "$HOME/$1.bk$(date +%Y%m%d%H%M%S)"
  [ -e $HOME/$1 ] && echo $1 already exists && return
  cp $DOTFILES/$1 $HOME/$1 && echo $1 copied
}

if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: please install zsh first.' >&2
  exit 1
fi

# Install ohmyzsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    $DOTFILES/scripts/install-omz.sh
fi

# Install Spacemacs
if [ ! -d "$HOME/.emacs.d" ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi


mkdir ~/.config
mkdir ~/bin

safe_cp .zshrc
safe_cp .zshenv
safe_cp .xinitrc
safe_cp .fehbg
safe_cp bin/pac
safe_cp bin/screenlock
safe_link .spacemacs
safe_link .zshrc
safe_link .config/i3
safe_link .config/i3blocks
safe_link .config/polybar
safe_link .config/dunst
safe_link .config/ranger
safe_link .config/compton.conf
