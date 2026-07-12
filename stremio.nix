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
    rev = "v1.1.2";
    hash = "sha256-jo+9KDX/a46jPTmYhiFNgp5fDKhoAsML/+m7u3ituEQ=";
  };

  cargoHash = "sha256-hZ9neZD+aB7bth4UTsWJXIKGSbo/c3wZRtfOIp7LvwY=";

  impureCacheDir = "$(builtins.getEnv 'HOME')/.cache/rust";

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

  postPatch = ''
    patch -p1 < ${./build.rs.patch};
    grep -q "use std::path::PathBuf" build.rs || sed -i '1i use std::path::PathBuf;' build.rs
  '';

  preBuild = ''
    echo "OUT_DIR:"
    echo $OUT_DIR
    echo ""
    echo "CARGO_TARGET_DIR"
    echo $CARGO_TARGET_DIR
  '';
})
