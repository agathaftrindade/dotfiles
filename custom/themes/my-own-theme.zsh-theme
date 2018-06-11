function get_host {
	echo '@'$HOST
}

PROMPT='(%{$fg[cyan]%}%~%{$reset_color%})%(!.#.:) '
RPROMPT='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%} %n$(get_host)'

#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
