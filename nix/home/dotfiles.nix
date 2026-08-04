{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  cfg = path: symlink "${dotfiles}/.config/${path}";
in
{
  home.file = {
    ".bash_profile".source = symlink "${dotfiles}/.bash_profile";
    ".bashrc".source = symlink "${dotfiles}/.bashrc";
    ".hammerspoon".source = symlink "${dotfiles}/.hammerspoon";
    ".claude/settings.json".source = symlink "${dotfiles}/.claude/settings.json";

    # .config 全体ではなく個別 symlink（programs.git が ~/.config/git/config を管理するため）
    ".config/nvim".source = cfg "nvim";
    ".config/wezterm".source = cfg "wezterm";
    ".config/karabiner".source = cfg "karabiner";
    ".config/gh".source = cfg "gh";
    ".config/gemini".source = cfg "gemini";
    ".config/git/ignore".source = cfg "git/ignore";
  };
}
