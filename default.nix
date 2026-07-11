# default.nix
{pkgs ? import <nixpkgs> {}}:
pkgs.callPackage ./stremio.nix {}
