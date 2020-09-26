export ZSH="/home/darteil/.oh-my-zsh"

ZSH_THEME="my-theme"

plugins=(vi-mode)
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim;

export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

oldPS1="$PS1"
function zle-line-init zle-keymap-select {
    VIM_NORMAL_PROMPT="%{$fg_bold[yellow]%}[% NOR]%  %{$reset_color%}"
    VIM_INSERT_PROMPT="%{$fg_bold[green]%}[% INS]%  %{$reset_color%}"
    PS1="${${KEYMAP/vicmd/$VIM_NORMAL_PROMPT}/(main|viins)/$VIM_INSERT_PROMPT}$oldPS1"
    PS2=$PS1
    RPS1=""
    RPS2=""
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

alias tr='tree -L 1 --dirsfirst -a'
alias mus='mpsyt pl "https://www.youtube.com/playlist?list=PLbu6xrylxwhUD2V5BMRuKh00fgdlLJ-zT"'
alias tmdef='tmux attach -t default'
alias mountdata='sudo mount -t ntfs-3g /dev/sdb1 /mnt/data'
alias pulserestart='pulseaudio -k'
alias fontsreload='sudo fc-cache -f -v'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{node_modules,.git}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
