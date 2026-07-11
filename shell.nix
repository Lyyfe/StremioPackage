# shell.nix
{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  name = "stremio-nix-package-shell";

  inputsFrom = [(pkgs.callPackage ./stremio.nix {})];

  nativeBuildInputs = with pkgs; [
    cargo
    rustc
    nix-prefetch-github
  ];
}
