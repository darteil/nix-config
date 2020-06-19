function exttar() {
    tar -zxvf "$1"
}

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo " (venv:$venv)"
}

export VISUAL=nvim;
export EDITOR=nvim;

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

VENV="\$(virtualenv_info)";

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

DEFAULT_COLOR=$'\[\e[m\]'
GREEN=$'\[\e[32m\]'
VENV_COLOR=$'\[\033[0;35m\]'
WHITE=$'\[\e[37m\]'
export PS1="${GREEN}\t${VENV_COLOR}${VENV} ${WHITE}[\w]${DEFAULT_COLOR} :: "

alias tr='tree -L 1 --dirsfirst -a'
alias musplay='tizonia --youtube-audio-playlist https://www.youtube.com/playlist?list=PLbu6xrylxwhUD2V5BMRuKh00fgdlLJ-zT'
alias musstream='tizonia --youtube-audio-stream'
alias tmdef='tmux attach -t default'
alias mountdata='sudo mount -t ntfs-3g -o ro /dev/sdb1 /media/data'
alias pulserestart='pulseaudio -k'
alias fontsreload='sudo fc-cache -f -v'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{node_modules,.git}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
