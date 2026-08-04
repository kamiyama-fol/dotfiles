final: prev: {
  hammerspoon = prev.stdenvNoCC.mkDerivation rec {
    pname = "hammerspoon";
    version = "1.1.1";

    src = prev.fetchurl {
      url = "https://github.com/Hammerspoon/hammerspoon/releases/download/${version}/Hammerspoon-${version}.zip";
      hash = "sha256-081jiyblbhwxc33cq2j75kipjq88rmhc3s98s3pbrw0f4m9sbr0z";
    };

    nativeBuildInputs = [ prev.unzip ];
    dontFixup = true;

    installPhase = ''
      runHook preInstall
      mkdir -p "$out/Applications"
      cp -r Hammerspoon.app "$out/Applications/"
      runHook postInstall
    '';

    meta = {
      description = "Staggeringly powerful macOS automation tool";
      homepage = "https://www.hammerspoon.org/";
      license = prev.lib.licenses.mit;
      platforms = prev.lib.platforms.darwin;
      sourceProvenance = with prev.lib.sourceTypes; [ binaryNativeCode ];
    };
  };
}
