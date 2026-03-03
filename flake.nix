{
  description = "VASTRELIS - Empire";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = { 
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };    

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, home-manager, sops-nix, dms, nur, ... }: {      
    nixosConfigurations = {
      vstr-desktop-0 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          vstr-user = "vastrelis";
	      };

        modules = [
          ./hosts/vstr-desktop-0/configuration.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              nur.overlays.default
            ];

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.vastrelis = {
              imports = [
                ./home/vastrelis/common.nix
                ./home/vastrelis/niri/niri.nix
                sops-nix.homeManagerModules.sops
                dms.homeModules.dank-material-shell
                sops-nix.homeManagerModules.sops
              ];
            };
          }
        ];
      };
    };
  };
}
