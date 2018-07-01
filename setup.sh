#!/usr/bin/env bash

#TODO Install zsh, omz if not exists
#TODO Install Emacs, Spacemacs if not exists

SPACEMACS_PATH=$HOME/.spacemacs
[ -f $SPACEMACS_PATH ] && mv $SPACEMACS_PATH "$SPACEMACS_PATH".bk
ln -s $HOME/.zsh/.spacemacs $SPACEMACS_PATH
