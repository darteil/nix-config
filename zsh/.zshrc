export ZSH="/home/darteil/.oh-my-zsh"

ZSH_THEME="my-theme"

plugins=(vi-mode tmux)
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim;
export VISUAL=nvim;
export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export KEYTIMEOUT=1

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
  echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

alias ls='lsd -a --group-dirs first'
alias ll='lsd -lAh --blocks date,permission,size,name  --date relative --group-dirs first'
alias lt='lsd -a --tree --group-dirs first'
alias mus='mpsyt pl "https://www.youtube.com/playlist?list=PLbu6xrylxwhUD2V5BMRuKh00fgdlLJ-zT"'
alias tmdef='tmux attach -t default'
alias mountdata='sudo mount -t ntfs-3g /dev/sdb1 /mnt/data'
alias pulserestart='pulseaudio -k'
alias fontsreload='sudo fc-cache -f -v'
alias cheat='cat /home/darteil/.cheatsheet'
alias reflector='sudo reflector --verbose -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist'
alias v='nvim'
alias vc='nvim -u NONE'

export DENO_INSTALL="/home/$USER/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# colors for man page
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{node_modules,.git}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
