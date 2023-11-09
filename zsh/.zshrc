export ZSH="/home/darteil/.oh-my-zsh"

ZSH_THEME="my-theme"

plugins=(vi-mode tmux zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim;
export VISUAL=nvim;
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

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

alias ls='exa --group-directories-first --icons'
alias ll='exa -lh --sort="name" --group-directories-first --icons --no-user --created --time-style=long-iso'
alias lt='exa -Ta --icons --sort="name" --group-directories-first --level=5'
alias la='exa -lha --sort="name" --group-directories-first --icons --no-user --created --time-style=long-iso'
alias pulserestart='pulseaudio -k'
alias fontsreload='sudo fc-cache -f -v'
alias reflector='sudo reflector --verbose -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist'
alias nvimc='nvim -u NONE'
alias timer="node $HOME/Repositories/github/countdown/src/main.mjs"
alias record='ffmpeg -f pulse -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -i <(arecord -f CD) -filter_complex amix -acodec libmp3lame "$(date +%d_%m_%y__%H_%M_%S)".mp3'
alias obsvc="sudo modprobe v4l2loopback exclusive_caps=1 card_label='OBS Virtual Camera'"

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

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{node_modules,.git,proc,.icons}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=/home/darteil/lua/lua-language-server/3rd/luamake/luamake
