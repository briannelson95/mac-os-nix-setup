# flake.nix
{
    description = "My macOS config";

    inputs = {
        nix-darwin.url = "github:lnl7/nix-darwin";
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    outputs = { self, nix-darwin, nixpkgs, ... }:
        let
            system = "aarch64-darwin"; # Use x86_64-darwin for Intel Macs
        in {
            darwinConfigurations."Mac-Configured" = nix-darwin.lib.darwinSystem {
                system = system;
                modules = [ ./darwin-configuration.nix ];
            };
        };
}
