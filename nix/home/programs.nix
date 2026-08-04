{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = false; # .bashrc 側で init 済み
    settings = builtins.fromTOML (builtins.readFile ../../.config/starship.toml);
  };

  programs.git = {
    enable = true;
    userName = "kamiyama-fol";
    userEmail = "kueyama@netprotections.co.jp";
    extraConfig = {
      commit.template = "${config.home.homeDirectory}/dotfiles/gitmessage.txt";
      init.defaultBranch = "main";
      "url.https://github.com/.insteadof" = "git@github.com:";
    };
  };
}
