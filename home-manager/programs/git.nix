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
    settings = {
      alias = {
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      };
      merge = {
        tool = "nvimdiff";
      };
      diff = {
        tool = "nvimdiff";
      };
      difftool = {
        nvimdiff = {
          cmd = "NVIM_APPNAME=nvim-light nvim -d \"$LOCAL\" \"$REMOTE\"";
        };
        prompt = false;
      };
      core = {
        editor = "nvim";
      };
    };
  };
}
