# 現在の Mac (MAC0850) の System Settings を宣言的に再現
{ username, ... }:

{
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleLanguages = [ "ja-JP" ];
      AppleLocale = "ja_JP";
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = true;
      # vim 向けキーリピート（System Settings > Keyboard）
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      "com.apple.swipescrolldirection" = true; # 自然なスクロール
      "com.apple.mouse.scaling" = 1.5;
    };

    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = 1.5;
      "com.apple.scrollwheel.scaling" = 0.5;
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
        { app = "/Applications/WezTerm.app"; }
        { app = "/Applications/Google Chrome.app"; }
        { app = "/Applications/Obsidian.app"; }
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
