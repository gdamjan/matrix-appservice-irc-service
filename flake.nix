{
  description =
    "Portable Matrix IRC gateway appservice built with nix";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

  outputs = { self, nixpkgs, ... }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      nixos = (nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ];
      }).config.system.nixos;
      matrix-appservice-irc = pkgs.matrix-appservice-irc;
    in {
      formatter.x86_64-linux = pkgs.nixfmt;
      packages.x86_64-linux.default = (import ./build.nix {
        inherit pkgs matrix-appservice-irc;
      });
      packages.x86_64-linux.release-info = pkgs.writeText "release-info.txt" ''
        matrix-appservice-irc: ${matrix-appservice-irc.version}
        ${nixos.distroName} ${nixos.release} (${nixos.codeName})
        ${nixos.distroId} ${nixos.label}
      '';
    };
}
