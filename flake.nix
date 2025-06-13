{
    description = "macOS Nix + nix-darwin config for briannelson95";

    inputs = {
        nix-darwin.url = "github:lnl7/nix-darwin";
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    outputs = { self, nix-darwin, nixpkgs, ... }:
        let
            # Auto-detect current system architecture
            system = builtins.currentSystem;

            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
        in {
            darwinConfigurations = {
                "macos-nix-setup" = nix-darwin.lib.darwinSystem {
                    inherit system;
                    modules = [ ./darwin-configuration.nix ];
                };
        };
    };
}
