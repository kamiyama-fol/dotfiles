# 現在の Mac (MAC0850) の System Settings を宣言的に再現
{ username, ... }:

{
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = true;
      # vim 向けキーリピート（System Settings > Keyboard）
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      "com.apple.swipescrolldirection" = true; # 自然なスクロール
    };

    # nix-darwin に型定義が無い項目
    CustomUserPreferences = {
      NSGlobalDomain = {
        AppleLanguages = [ "ja-JP" ];
        AppleLocale = "ja_JP";
        "com.apple.mouse.scaling" = 1.5;
        "com.apple.scrollwheel.scaling" = 0.5;
      };
    };

    dock = {
      autohide = true;
      orientation = "right";
      show-recents = false;
      minimize-to-application = true;
      mru-spaces = true;
      tilesize = 16;
      largesize = 16;
      magnification = false;
      mineffect = "scale";
      show-process-indicators = true;
      persistent-apps = [
        { app = "/Users/${username}/Applications/WezTerm.app"; }
        { app = "/Users/${username}/Applications/Google Chrome.app"; }
      ];
      persistent-others = [
        { folder = "/Users/${username}/Downloads"; }
      ];
    };

    finder = {
      AppleShowAllFiles = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      FXPreferredViewStyle = "NlsView"; # リスト表示
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = false;
    };
  };
}
