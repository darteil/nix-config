local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg[green]%}[%*]%{$reset_color%} [%{$fg[yellow]%}%4~%{$reset_color%}]$(git_prompt_info) :: '

ZSH_THEME_GIT_PROMPT_PREFIX=" (git: "
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]!%{$reset_color%}"

RPS1="${return_code}"

