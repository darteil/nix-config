{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    plugins = with pkgs.tmuxPlugins;
      [
        {
          plugin = mode-indicator;
          extraConfig = "
            set -g @mode_indicator_empty_prompt ' NORMAL '
            set -g @mode_indicator_prefix_prompt ' WAIT '
            set -g @mode_indicator_copy_prompt ' COPY '
            set -g @mode_indicator_sync_prompt ' SYNC '

            set -g @mode_indicator_prefix_mode_style 'bg=colour9,fg=colour0'
            set -g @mode_indicator_copy_mode_style 'bg=colour11,fg=colour0'
            set -g @mode_indicator_sync_mode_style 'bg=colour5,fg=colour0'
            set -g @mode_indicator_empty_mode_style 'bg=colour4,fg=colour0'
          ";
        }
      ];
    extraConfig = ''
      set -sa terminal-features ",xterm-256color:RGB"
      set -g base-index 1
      set -s escape-time 0
      set -g mouse on

      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix

      # Reload config
      bind-key r source-file ~/.config/tmux/tmux.conf \; display-message "~/.config/tmux/tmux.conf reloaded"

      # Switch windows
      bind -n M-h previous-window
      bind -n M-l next-window

      setw -g mode-keys vi
      set-option -s set-clipboard off
      bind P paste-buffer
      unbind -T copy-mode-vi Enter

      # Configure copying for windows
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi Escape send-keys -X cancel
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "/mnt/c/Windows/System32/clip.exe"
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "/mnt/c/Windows/System32/clip.exe"
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "/mnt/c/Windows/System32/clip.exe"

      # Configure copying for linux
      #bind-key -T copy-mode-vi v send-keys -X begin-selection
      #bind-key -T copy-mode-vi y send-keys -X rectangle-toggle
      #bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'xclip -se c -i'
      #bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'xclip -se c -i'

      bind '\' split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      set-option -g history-limit 1024
      set-option -g visual-activity on

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
      is_fzf="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?fzf$'"

      bind -n C-h run "($is_vim && tmux send-keys C-h) || tmux select-pane -L"
      bind -n C-j run "($is_vim && tmux send-keys C-j)  || ($is_fzf && tmux send-keys C-j) || tmux select-pane -D"
      bind -n C-k run "($is_vim && tmux send-keys C-k) || ($is_fzf && tmux send-keys C-k)  || tmux select-pane -U"
      bind -n C-l run  "($is_vim && tmux send-keys C-l) || tmux select-pane -R"
      bind -n 'C-\' if-shell "$is_vim" "send-keys 'C-\\'" "select-pane -l"

      setw -g pane-border-status bottom
      setw -g pane-border-format ""

      set -g pane-border-lines 'single'
      set -g pane-border-style 'fg=colour8'
      set -g pane-active-border-style 'fg=colour12'

      #time: #[fg=colour0,bold,bg=colour8] %R 
      set -g status-left '#[fg=colour0,bg=colour11] TMUX #[fg=default,bg=default] '
      set -g status-right '#[fg=colour0,bg=colour8] Session: #S #[fg=default,bg=default] #{tmux_mode_indicator}'
      #set -g status-right-length 100
      set -g status-style bg='default'
      setw -g window-status-format '#[fg=colour0,bg=colour8] #I '
      setw -g window-status-current-format '#[fg=colour0,bg=colour1] #I '

      run-shell ${pkgs.tmuxPlugins.mode-indicator}/share/tmux-plugins/mode-indicator/mode_indicator.tmux
    '';
  };
}

