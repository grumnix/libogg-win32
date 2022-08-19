{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";

    tinycmmc.url = "github:grumbel/tinycmmc";
    tinycmmc.inputs.nixpkgs.follows = "nixpkgs";
    tinycmmc.inputs.flake-utils.follows = "flake-utils";

    libogg_src.url = "https://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.gz";
    libogg_src.flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, tinycmmc, libogg_src }:
    tinycmmc.lib.eachWin32SystemWithPkgs (pkgs:
      {
        packages = rec {
          default = libogg;

          libogg = pkgs.stdenv.mkDerivation {
            pname = "libogg";
            version = "1.3.5";

            src = libogg_src;

            nativeBuildInputs = [
            ];
          };
        };
      }
    );
}
