{ config, pkgs, ... }:


{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    
    # Your SF Pro derivation (the block with fetchurl) goes here
    (stdenv.mkDerivation {
      name = "sf-pro-rounded";
      src = fetchurl {
        url = "https://raw.githubusercontent.com/sahibjotsaggu/San-Francisco-Pro-Fonts/master/SF-Pro-Rounded-Regular.otf";
        sha256 = "sha256-law3sWLJMN9jjLnLFJw2+HHL8fQpZsyYuA63/uGtyW4=";
      };
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/share/fonts/opentype
        cp $src $out/share/fonts/opentype/SF-Pro-Rounded-Regular.otf
      '';
    })
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif" ]; 
      
      sansSerif = [ "SF Pro Rounded" ]; 
      
      monospace = [ "JetBrainsMono Nerd Font" ];
      
      emoji = [ "Noto Color Emoji" ]; 
    };
  };

}