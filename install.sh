#!/bin/sh

stow -t ~/ zsh
stow -t ~/ tmux
stow -t ~/ conky
stow -t ~/ cheatsheet
stow -t ~/.oh-my-zsh/ oh-my-zsh
stow -t ~/.icons cursor
stow -t ~/ bat
stow -t ~/ dunst
stow -t ~/ i3wm
stow -t ~/ kitty
stow -t ~/ mpv
stow -t ~/ nvim
stow -t ~/ picom
stow -t ~/ polybar
stow -t ~/ rofi

rm -rf ~/.config/vifm/scripts
rm ~/.config/vifm/vifmrc
stow -t ~/.config/vifm vifm
