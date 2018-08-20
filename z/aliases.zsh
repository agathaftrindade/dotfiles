
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CFA'
alias p="echo "
alias s="sudo"
alias n="nohup "
alias diskspace="du -S | sort -n -r | less"
alias path='echo $PATH | sed -e "s/:/\n/g"'
alias op='xdg-open &>/dev/null'
alias untar="tar -xf "
alias pingg="ping google.com"
alias dfh="df -h"

alias UNFUCK_WIFI='sudo rmmod rtl8723ae && sudo modprobe rtl8723ae'
alias cm='mkdir -p -- "$1" && cd -P -- "$1"'

alias dotf="~/dotfiles"
alias ealias="vi ~/dotfiles/z/aliases.zsh && rel"
alias rel="source ~/.zshrc && rehash"

alias i3conf="vim ~/.config/i3/config"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias vi="vim"
alias cake="bin/cake"
alias py="python"

alias ht="htop"
alias zyp='sudo zypper'
