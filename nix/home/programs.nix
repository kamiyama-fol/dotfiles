{ config, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = false; # .bashrc 側で init 済み
    settings = builtins.fromTOML (builtins.readFile ../../.config/starship.toml);
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "kamiyama-fol";
      user.email = "kueyama@netprotections.co.jp";
      commit.template = "${config.home.homeDirectory}/dotfiles/gitmessage.txt";
      init.defaultBranch = "main";
      core.excludesfile = "${config.home.homeDirectory}/.config/git/ignore";
      url."https://github.com/".insteadOf = "git@github.com:";
    };
  };
}
