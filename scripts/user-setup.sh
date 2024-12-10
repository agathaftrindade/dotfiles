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

echo Installing tools
brew bundle

echo Installing omz
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

mkdir $HOME/bin
mkdir $HOME/config
mkdir $HOME/.config/kitty/themes
mkdir $HOME/.config/kitty/themes

safe_cp .zshrc
safe_cp .zshenv

echo Configuring Emacs
rm -rf $HOME/.emacs.d $HOME/.emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
#ln -fns $PWD/emacs-init.el $HOME/.config/doom/init.el
#ln -fns $PWD/emacs-config.el $HOME/.config/doom/config.el
#ln -fns $PWD/emacs-packages.el $HOME/.config/doom/packages.el
mkdir $HOME/.config/doom/themes
#ln -fns $PWD/doom-anne-pastel-theme.el $HOME/.config/doom/themes/doom-anne-pastel-theme.el

doom sync -u

