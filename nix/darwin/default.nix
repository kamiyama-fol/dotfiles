{ pkgs, username, ... }:

{
  imports = [
    ./defaults.nix
    ./services.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 6;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
    shell = pkgs.bashInteractive;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
  ];

  fonts.packages = with pkgs; [
    plemoljp
    plemoljp-nf
  ];

  system.primaryUser = username;
}
