{ ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      "ls" = "eza";
      "ll" = "eza -lUh --icons='never' --sort='name' --time-style='long-iso' --no-user --group-directories-first";
      "la" = "eza -laUh --icons='never' --sort='name' --time-style='long-iso' --no-user --group-directories-first";
      "lt" = "eza -laT --icons='never' --sort='name' --no-user --no-time --no-permissions --no-filesize --group-directories-first --level='5'";
    };
    shellInit = ''
      fish_config theme choose "Base16 Default Dark"
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

      # Completion Pager Colors
      set -g fish_pager_color_progress brblack
      set -g fish_pager_color_prefix magenta
      set -g fish_pager_color_completion magenta
      set -g fish_pager_color_description brblack
      set -g fish_pager_color_selected_completion black
      set -g fish_pager_color_selected_description black
      set -g fish_pager_color_selected_prefix black
      set -g fish_pager_color_selected_background --background=brwhite

      function fish_prompt
        set -l green (set_color green)
        set -l normal (set_color normal)
        set -l yellow (set_color yellow)
        set -l purple (set_color magenta)

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
