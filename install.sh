#!/usr/bin/env bash

set -euo pipefail

echo "==> Loading .env..."
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
    echo "TARGET_USER=${TARGET_USER}"
else
    echo "ERROR: .env file not found!"
    exit 1
fi

echo "==> Installing nix if not already installed..."
if ! command -v nix >/dev/null 2>&1; then
    sh <(curl -L https://nixos.org/nix/install)
    . ~/.nix-profile/etc/profile.d/nix.sh
else
  echo "Nix already installed."
fi

echo "==> Installing nix-darwin and applying configuration..."
# Export TARGET_USER so Nix can see it
export TARGET_USER
nix run .#darwinConfigurations.macos-nix-setup.system --extra-experimental-features nix-command --extra-experimental-features flakes --override-input target-user "$TARGET_USER"
