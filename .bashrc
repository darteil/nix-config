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
alias pulserestart='pulseaudio -k; pulseaudio --start'
alias musplay='tizonia --youtube-audio-playlist https://www.youtube.com/playlist?list=PLbu6xrylxwhUD2V5BMRuKh00fgdlLJ-zT'
alias screen='flameshot gui'
