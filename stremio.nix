#stremio.nix
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
    hash = "sha256-ZvXqbXgwxlKvTwdQ2ARbtvLOBRChgRpE21fcuffAUHw=";
  };

  cargoHash = "sha256-z8JgqVbvXN1lwUEW2jw8fozxUNL7ObbAA9zD/BF9M/s=";

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
