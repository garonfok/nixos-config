{ pkgs, ... }: {
  programs.git = {
    enable = true;
    extraConfig = {
      user.name = "garonfok";
      user.email = "fokgaron@gmail.com";
      init.defaultBranch = "master";
    };
  };
}
