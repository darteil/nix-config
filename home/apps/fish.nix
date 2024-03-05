{ ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      "ls" = "eza";
      "ll" = "eza -lU --icons='auto' --sort='name' --time-style='long-iso' --no-user --group-directories-first";
      "la" = "eza -laU --icons='auto' --sort='name' --time-style='long-iso' --no-user --group-directories-first";
      "lt" = "eza -laT --icons='auto' --sort='name' --no-user --no-time --no-permissions --no-filesize --group-directories-first --level='5'";
      "record" = "ffmpeg - f pulse - i alsa_output.pci-0000_00_1f .3.analog-stereo.monitor - i < (arecord - f CD) - filter_complex amix - acodec libmp3lame '$(date +%d_%m_%y__%H_%M_%S)'.mp3";
    };
    shellInit = ''
      set fish_greeting
      set fish_color_valid_path
      set -g fish_autosuggestion_enabled 1

      function fish_user_key_bindings
          fish_default_key_bindings -M insert
          fish_vi_key_bindings --no-erase insert
      end

      set fish_cursor_default block
      set fish_cursor_insert line
      set fish_cursor_replace_one underscore
      set fish_cursor_visual block
      set fish_vi_force_cursor 1

      set -l foreground DCD7BA normal
      set -l selection 2D4F67 brcyan
      set -l comment 727169 brblack
      set -l red C34043 red
      set -l orange FF9E64 brred
      set -l yellow C0A36E yellow
      set -l green 76946A green
      set -l purple 957FB8 magenta
      set -l cyan 7AA89F cyan
      set -l pink D27E99 brmagenta

      # Syntax Highlighting Colors
      set -g fish_color_normal $foreground
      set -g fish_color_command $cyan
      set -g fish_color_keyword $pink
      set -g fish_color_quote $yellow

      set -g fish_color_redirection $foreground
      set -g fish_color_end $orange
      set -g fish_color_error $red
      set -g fish_color_param $purple
      set -g fish_color_comment $comment
      set -g fish_color_selection --background=$selection
      set -g fish_color_search_match --background=$selection
      set -g fish_color_operator $green
      set -g fish_color_escape $pink
      set -g fish_color_autosuggestion $comment

      # Completion Pager Colors
      set -g fish_pager_color_progress $comment
      set -g fish_pager_color_prefix $cyan
      set -g fish_pager_color_completion $foreground
      set -g fish_pager_color_description $comment


      function fish_prompt
        set -l green (set_color 76946A)
        set -l normal (set_color DCD7BA)
        set -l yellow (set_color C0A36E)
        set -l purple (set_color 957FB8)

        set -l nix_shell_info (
          if test -n "$IN_NIX_SHELL"
            echo -n $purple"<nix-shell>"$normal
          end
        )

        set -l time $green(date '+%H:%M:%S')$normal
        set -l path $yellow(basename (prompt_pwd))$normal

        echo $time $nix_shell_info [$path]
        echo ">> "
      end
    '';
  };
}
