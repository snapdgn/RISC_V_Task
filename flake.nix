{
  description = "Ocaml Dev Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-darwin" "aarch64-darwin" "x86_64-linux" ];
      createDevShell = system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.mkShell {
          buildInputs = [
            pkgs.ocaml
            pkgs.ocamlPackages.findlib
            pkgs.ocamlPackages.ounit2
            pkgs.dune_3
            pkgs.ocamlPackages.ocaml-lsp
            pkgs.ocamlformat
          ];
        };
    in
    {
      devShell = nixpkgs.lib.genAttrs systems createDevShell;
    };
}
