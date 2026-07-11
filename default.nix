# let
#   nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-26.05";
#   pkgs = import nixpkgs {
#     config = {};
#     overlays = [];
#   };
#   rustc = pkgs.rustc;
#   cargo = pkgs.cargo;
#   alejandra = pkgs.alejandra;
#   lib = pkgs.lib;
#   fetchFromGitHub = pkgs.fetchFromGitHub;
#   rustPlatform = pkgs.rustPlatform;
#   pkg-config = pkgs.pkg-config;
#   gettext = pkgs.gettext;
#   nodejs = pkgs.nodejs;
#   gtk4 = pkgs.gtk4;
#   libadwaita = pkgs.libadwaita;
#   webkitgtk_6_0 = pkgs.webkitgtk_6_0;
#   mpv = pkgs.mpv;
#   libepoxy = pkgs.libepoxy;
# in
#   pkgs.callPackage ./stremio.nix {}
{pkgs ? import <nixpkgs> {}}:
pkgs.callPackage ./stremio.nix {}
