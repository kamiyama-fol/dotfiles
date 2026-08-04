{ pkgs, ... }:

{
  # Karabiner-Elements をシステムサービスとして有効化（ログイン時起動）
  services.karabiner-elements = {
    enable = true;
    package = pkgs.karabiner-elements;
  };
}
