{ config, pkgs, inputs, ... }: {

    imports = [

    inputs.noctalia.homeModules.default

    ] ++ [


    ./home/terminal/fastfetch.nix
    ./home/terminal/alacritty.nix
    ./home/media/spicetify.nix
    ./home/shell/noctalia.nix
    ./home/web/zen.nix
    

  ];

  home.username = "yasiru";
  home.homeDirectory = "/home/yasiru";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [ 
    ];
  programs.home-manager.enable = true;


}
