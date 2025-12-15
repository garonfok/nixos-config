{ pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "garonfok";
      user.email = "fokgaron@gmail.com";
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
        enable = true;
    };
  };
}
