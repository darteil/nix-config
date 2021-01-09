local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg[green]%}[%*]%{$reset_color%} [%{$fg[yellow]%}%4~%{$reset_color%}] :: '

RPS1="${return_code}"

