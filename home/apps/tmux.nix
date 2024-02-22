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
            set -g @mode_indicator_empty_prompt ' normal '
            set -g @mode_indicator_prefix_prompt ' wait '
            set -g @mode_indicator_copy_prompt ' copy '
            set -g @mode_indicator_sync_prompt ' sync '

            set -g @mode_indicator_prefix_mode_style 'bg=#83a598,fg=#282828,bold'
            set -g @mode_indicator_copy_mode_style 'bg=#d79921,fg=#282828,bold'
            set -g @mode_indicator_sync_mode_style 'bg=#fb4934,fg=#282828,bold'
            set -g @mode_indicator_empty_mode_style 'bg=#458588,fg=#282828,bold'
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
      bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

      # Switch windows
      bind -n M-h previous-window
      bind -n M-l next-window

      setw -g mode-keys vi
      set-option -s set-clipboard off
      bind P paste-buffer
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X rectangle-toggle
      unbind -T copy-mode-vi Enter
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'xclip -se c -i'
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'xclip -se c -i'

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
      set -g pane-border-style 'fg=#fbf0c9'
      set -g pane-active-border-style 'fg=#fbf0c9'

      #time: #[fg=#282828,bold,bg=#689D6A] %R 
      set -g status-left '#[fg=#282828,bold,bg=#fabd2f,bold] TMUX #[fg=default,bold,bg=default] '
      set -g status-right '#[fg=#282828,bold,bg=#928374,bold] Session: #S #[fg=default,bold,bg=default] #{tmux_mode_indicator}'
      #set -g status-right-length 100
      set -g status-style bg='default'
      setw -g window-status-format '#[fg=#a89984,bold,bg=#3a3a3a,bold] #I:#[fg=#a89984,bold,bg=#3a3a3a,bold] #W '
      setw -g window-status-current-format '#[fg=#3a3a3a,bold,bg=#a89984,bold] #I:#[fg=#3a3a3a,bold,bg=#a89984,bold] #W '

      run-shell ${pkgs.tmuxPlugins.mode-indicator}/share/tmux-plugins/mode-indicator/mode_indicator.tmux
    '';
  };
}

