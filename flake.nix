{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    # System types to support.
    supportedSystems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];

    # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    # Nixpkgs instantiated for supported system types.
    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    packages = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
      basicPkgs = [pkgs.presenterm];
    in {
      default = pkgs.mkShell {
        packages = basicPkgs;
      };

      example = pkgs.mkShell {
        packages = basicPkgs ++ [pkgs.rustc pkgs.nodejs];
      };

      present = pkgs.writeShellApplication {
        name = "PP";
        runtimeInputs = basicPkgs;
        text = ''
          presenterm -x ./pp.md
        '';
      };
    });
  };
}
