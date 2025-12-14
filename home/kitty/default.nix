{ pkgs, ... } : {
  programs.kitty = {
    enable = true;
    settings = {
      font_size = 12;
      background_opacity = 0.9;
      window_padding_width = 20;
    };

    font = {
      name = "FiraCode Nerd Font Mono";
      size = 12;
    };

    themeFile = "tokyo_night_moon";
  };
}
