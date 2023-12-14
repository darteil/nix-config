{ ... }:

{
  programs.git = {
    enable = true;
    includes = [
      {
        condition = "gitdir:~/nix-config/";
        contents.user = {
          email = "darteil.base@gmail.com";
          name = "Romanov Yuri";
        };
      }
      {
        condition = "gitdir:~/Development/github/";
        contents.user = {
          email = "darteil.base@gmail.com";
          name = "Romanov Yuri";
        };
      }
      {
        condition = "gitdir:~/Development/work/";
        contents.user = {
          email = "darteil.work@gmail.com";
          name = "Romanov Yuri";
        };
      }
    ];
    aliases = {
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
    delta = {
      enable = true;
      options = {
        syntax-theme = "gruvbox-dark";
        plus-emph-style = "white bold";
        line-numbers = true;
        side-by-side = true;
      };
    };
    extraConfig = {
      core = {
        editor = "nvim";
      };
    };
  };
}
