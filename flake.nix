{
  description = "Kamiyama dotfiles (nix-darwin + home-manager)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
    let
      username = "k.ueyama";
      system = "aarch64-darwin";
    in {
      darwinConfigurations.macos = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs username; };
        modules = [
          ./nix/darwin/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-bak";
            home-manager.extraSpecialArgs = { inherit inputs username; };
            home-manager.users.${username} = import ./nix/home/home.nix;
          }
        ];
      };

      # darwin-rebuild なしで home-manager だけ試す場合:
      # home-manager switch --flake .#k.ueyama
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs username; };
        modules = [ ./nix/home/home.nix ];
      };
    };
}
