{
  description = "niri+noctalia on Nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    noctalia.url = "github:noctalia-dev/noctalia-shell";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
  


  };

  outputs = { self, nixpkgs, home-manager,spicetify-nix,zen-browser, ... }@inputs: {
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
	  extraSpecialArgs = {inherit inputs; };
            useGlobalPkgs = true;
            useUserPackages = true;
	    backupFileExtension = "backup";

            users.yasiru = {
	    imports = [ 
                ./home.nix 
                inputs.spicetify-nix.homeManagerModules.default
		            ];
             };
          };
        }
      ];
    };
  };
}
