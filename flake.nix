{
  description = "haskell exercises";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        myHaskell = pkgs.haskellPackages.ghcWithPackages myHaskellPackages;
        myHaskellPackages = packages: with packages; [
          QuickCheck
        ];
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            myHaskell
          ];
        };
      });
}
