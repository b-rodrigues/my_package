{
  description = "my_package — a T package";

  inputs = {
    nixpkgs.url = "github:rstats-on-nix/nixpkgs/2026-02-20";
    flake-utils.url = "github:numtide/flake-utils";
    t-lang.url = "github:b-rodrigues/tlang/873f8894d6e5bbc3670d3562dc6150b1a151d22f";
    # Package dependencies as flake inputs
    # Add each dependency from DESCRIPTION.toml as a flake input here
  };

  outputs = { self, nixpkgs, flake-utils, t-lang }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # The package itself
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "t-my_package";
          version = "0.1.0";
          src = ./.;

          buildInputs = [
            t-lang.packages.${system}.default
            # Add package dependencies here
          ];

          installPhase = ''
            mkdir -p $out/lib/t/packages/my_package
            cp -r src/* $out/lib/t/packages/my_package/
          '';

          meta = {
            description = "my_package — a T package";
          };
        };

        # Development shell for hacking on the package
        devShells.default = pkgs.mkShell {
          buildInputs = [
            t-lang.packages.${system}.default
            pkgs.pandoc  # For documentation generation
          ];

          shellHook = ''
            echo "=========================================="
            echo "T Package Development Environment"
            echo "Package: my_package"
            echo "=========================================="
            echo ""
            echo "Available commands:"
            echo "  t repl              - Start T REPL"
            echo "  t run <file>        - Run a T file"
            echo "  t test              - Run package tests"
            echo "  t doc --parse .     - Parse sources for documentation"
            echo "  t doc --generate    - Generate documentation"
            echo ""
            echo "Source files: src/"
            echo "Tests: tests/"
            echo ""
          '';
        };
      }
    );
}
