{
  nixpkgs ? (import ./npins).nixpkgs,
  pkgs ? import nixpkgs { },
  lib ? pkgs.lib,
  python3Packages ? pkgs.python3Packages,
}:

lib.makeScope python3Packages.newScope (
  py-self:
  lib.packagesFromDirectoryRecursive {
    directory = ./python-packages;
    inherit (py-self) callPackage;
  }
)
