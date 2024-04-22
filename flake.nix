{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs =
    { self, nixpkgs }:
    let
      pkgsFor = system: import nixpkgs { inherit system; };
    in
    {
      devShells.x86_64-linux.default =
        let
          pkgs = pkgsFor "x86_64-linux";
        in
        pkgs.mkShell { packages = with pkgs; [ deno ]; };
    };
}
