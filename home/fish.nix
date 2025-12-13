{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "tide";
        src = tide.src;
      }
      {
        name = "z";
        src = z.src;
      }
      {
        name = "fzf-fish";
        src = fzf-fish.src;
      }
    ];
  };
}
