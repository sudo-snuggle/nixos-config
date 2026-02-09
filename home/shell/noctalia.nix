 { config, pkgs, inputs, ... }:

 {

 programs.noctalia-shell = {
    enable = true; #
    
    # Optional: Customize your bar or theme
    settings = {
      # bar.position = "top";
      # colorSchemes.predefinedScheme = "Monochrome";
    };
  };

}
