{ config, pkgs, ... }:

let
    targetUser = builtins.getEnv "TARGET_USER";
    stateVersion = builtins.getEnv "SYSTEM_STATE_VERSION";
    primaryUser = builtins.getEnv "SYSTEM_PRIMARY_USER";
in
{
    system.stateVersion = 6;

    system.primaryUser = targetUser;
    # System packages
    environment.systemPackages = with pkgs; [
        dockutil
    ];

    # System settings
    system.defaults.siri.enabled = false;
    system.defaults.screentime.enabled = false;

    # Finder settings
    system.defaults.finder.AppleShowAllExtensions = true;
    system.defaults.finder.FXEnableExtensionChangeWarning = false;
    system.defaults.finder.ShowPathbar = true;
    system.defaults.finder.ShowStatusBar = true;

    # Dock settings
    system.defaults.dock.autohide = true;
    system.defaults.dock.magnification = true;
    system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
    system.defaults.NSGlobalDomain.PMPrintingExpandedStateForPrint = true;

    # Screenshot location → use target user dynamically
    system.defaults.screencapture.location = "/Users/${targetUser}/Screenshots";

    # Networking
    networking.computerName = "Mac-Configured";
    networking.hostName = "mac-configured";

    # Homebrew apps
    homebrew.enable = true;
    homebrew.brews = [ ];
    homebrew.casks = [
        "google-chrome"
        "zoom"
    ];

    # Shell
    programs.zsh.enable = true;

    # Users → "admin" is the default account you log in with
    users.users.admin = {
        home = "/Users/admin";
        shell = pkgs.zsh;
    };
}
