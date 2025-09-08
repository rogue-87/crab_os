{
  description = "crab os devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };

        rust = pkgs.rust-bin.nightly.latest.default.override {
          extensions = [
            "llvm-tools-preview"
            "rust-analyzer"
            "rust-src"
          ];
          # so it can build for Bare Armv7E-M, hardfloat
          targets = [ "thumbv7em-none-eabihf" ];
        };
      in
      with pkgs;
      {
        devShells.default = mkShell rec {
          buildInputs = [
            # Rust
            rust
            cargo-bootimage
            qemu
          ];
        };
      }
    );
}
