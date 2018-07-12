
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias diskspace="du -S | sort -n -r | less"
alias path='echo $PATH | sed -e "s/:/\n/g"'

alias UNFUCK_WIFI='sudo rmmod rtl8723ae && sudo modprobe rtl8723ae'
alias cm='mkdir -p -- "$1" && cd -P -- "$1"'

alias ealias="vi ~/dot-files/aliases.zsh && rel"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cake="bin/cake"
alias py="python"

alias rel="source ~/.zshrc"
alias op='xdg-open &>/dev/null'
alias zyp='sudo zypper'
alias p="echo "
alias ht="htop"
