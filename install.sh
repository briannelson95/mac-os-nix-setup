#!/usr/bin/env bash

set -euo pipefail

echo "==> Installing nix if not already installed..."
if ! command -v nix >/dev/null 2>&1; then
    sh <(curl -L https://nixos.org/nix/install)
    . ~/.nix-profile/etc/profile.d/nix.sh
else
    echo "Nix already installed."
fi

echo "==> Installing nix-darwin and applying configuration..."
nix run .#darwinConfigurations.macos-nix-setup.system
