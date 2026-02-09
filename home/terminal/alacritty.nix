{ config, pkgs, ... }:

{
  programs.alacritty.settings = {
    font.normal = {
      family = "JetBrainsMono Nerd Font";
      style = "Regular";
    };

    # Adding padding here
    window.padding = {
      x = 5; # Horizontal padding
      y = 5; # Vertical padding
    };

    window.opacity = 0.95;

  };

}
