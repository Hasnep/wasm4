{
  description = "A flake for WASM4";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dream2nix.url = "github:nix-community/dream2nix/legacy";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    gitignore,
    dream2nix,
  }:
    dream2nix.lib.makeFlakeOutputs {
      projects = ./projects.toml;
      systems = flake-utils.lib.defaultSystems;
      config.projectRoot = ./cli;
      source = gitignore.lib.gitignoreSource ./.;
    };
}
