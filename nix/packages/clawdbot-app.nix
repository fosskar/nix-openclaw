{ lib
, stdenvNoCC
, fetchzip
}:

stdenvNoCC.mkDerivation {
  pname = "clawdbot-app";
  version = "2.0.0-beta5";

  src = fetchzip {
    url = "https://github.com/clawdbot/clawdbot/releases/download/v2.0.0-beta5/Clawdis-2.0.0-beta5.zip";
    hash = "sha256-AA4REVpADWO5guUdrF5rsVTY4RhzV6cLv6hbcnS6W9M=";
    stripRoot = false;
  };

  dontUnpack = true;

  installPhase = "${../scripts/clawdbot-app-install.sh}";

  meta = with lib; {
    description = "Clawdbot macOS app bundle";
    homepage = "https://github.com/clawdbot/clawdbot";
    license = licenses.mit;
    platforms = platforms.darwin;
  };
}
