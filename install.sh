#!/usr/bin/env bash

set -euo pipefail

echo "==> Loading .env..."
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
  echo "TARGET_USER=${TARGET_USER}"
  echo "SYSTEM_ARCH=${SYSTEM_ARCH}"
  echo "SYSTEM_STATE_VERSION=${SYSTEM_STATE_VERSION}"
  echo "SYSTEM_PRIMARY_USER=${SYSTEM_PRIMARY_USER}"
else
  echo "ERROR: .env file not found!"
  exit 1
fi

echo "==> Installing Nix if not already installed..."
if ! command -v nix >/dev/null 2>&1; then
  sh <(curl -L https://nixos.org/nix/install)
  . ~/.nix-profile/etc/profile.d/nix.sh
else
  echo "Nix already installed."
fi

echo "==> Installing darwin-rebuild if not already installed..."
if ! command -v darwin-rebuild >/dev/null 2>&1; then
  nix profile install github:lnl7/nix-darwin
else
  echo "darwin-rebuild already installed."
fi

echo "==> Running darwin-rebuild switch..."
darwin-rebuild switch --flake .

echo "==> Done! Your macOS configuration has been applied."
