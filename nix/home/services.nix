{ config, ... }:

{
  launchd.agents.hammerspoon = {
    enable = true;
    config = {
      ProgramArguments = [ "/Applications/Hammerspoon.app/Contents/MacOS/Hammerspoon" ];
      RunAtLoad = true;
      KeepAlive = true;
    };
  };
}
