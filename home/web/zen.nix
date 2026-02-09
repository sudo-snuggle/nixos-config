{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
  ];
  

  programs.zen-browser = {
    enable = true;
    package = inputs.zen-browser.packages."${pkgs.system}".default;

    profiles.default = {
      # --- EXTENSIONS ---
      # These use the firefox-addons flake input
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        sponsorblock
        #enhancer-for-youtube    #damn u unfreee software
      ];

      # --- ZEN MODS (Themes/UI Tweaks) ---
      # These are the UUIDs for the specific themes/mods you asked for
      mods = [
        "499368d1-d243-4475-80f4-500b561c2168" # Catppuccin Theme
        #"9478f796-0e99-4c8d-9377-248987ec3a1d" # "Darker Zen" / Pitch Black
      ];

      # --- SETTINGS ---
      settings = {
        #"browser.theme.content-theme" = 0; # Force dark content
        #"browser.theme.toolbar-theme" = 0; # Force dark toolbar
      };
    };
  };
}