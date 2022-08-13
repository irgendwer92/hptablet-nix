{
  pkgs,
  config,
  home-manager,
  nixpkgs-unstable,
  self,
  ...
}: {
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        oh-my-zsh = {
          enable = true;
          plugins = [
#            "command-not-found"
#            "poetry"
          ];
          theme = "agnoster";
        };
        plugins = [
          {
            name = "zsh-syntax-highlighting";
            src = pkgs.fetchFromGitHub {
              owner = "zsh-users";
              repo = "zsh-syntax-highlighting";
              rev = "2d60a47cc407117815a1d7b331ef226aa400a344";
              sha256 = "1pnxr39cayhsvggxihsfa3rqys8rr2pag3ddil01w96kw84z4id2";
            };
          }
        ];
        localVariables = {
          EDITOR = "vim";
        };
        shellAliases = {
          lw = "lorri watch --once";
          mff = "git merge --ff-only";
          vi = "vim";
        };
        initExtra = ''
          unset LESS
        '';
      };
    };
}