{
  lib,
  rustPlatform,
  pkg-config,
  gettext,
  nodejs,
  wrapGAppsHook3,
  gtk4,
  libadwaita,
  webkitgtk_6_0,
  mpv,
  libepoxy,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "stremio-linux-shell";
  version = "1.1.2";

  src = fetchFromGitHub {
    owner = "Stremio";
    repo = "stremio-linux-shell";
    rev = "v$(version)";
    hash = lib.fakeHash;
  };

  cargoHash = lib.fakeHash;

  meta = {
    description = "Freedom to stream";
    homepage = "https://www.stremio.com";
    license = lib.licenses.gpl3;
    maintainers = [];
    platforms = lib.platforms.linux;
  };

  nativeBuildInputs = [
    pkg-config
    gettext
    nodejs
    wrapGAppsHook3
  ];

  buildInputs = [
    gtk4
    libadwaita
    webkitgtk_6_0
    mpv
    libepoxy
  ];
})
