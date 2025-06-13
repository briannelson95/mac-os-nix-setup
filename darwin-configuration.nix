{ config, pkgs, ... }:

{
    # Enable nix-darwin modules
    environment.systemPackages = with pkgs; [
        dockutil
    ];

    # Example system settings
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

    # Menu extras
    system.defaults.menuextra.battery.ShowPercent = true;

    # Screenshot location
    system.defaults.screencapture.location = "${config.users.users.bnelson.home}/Screenshots";

    # Networking
    networking.computerName = "Mac-Configured";
    networking.hostName = "mac-configured";

    # Homebrew settings
    homebrew.enable = true;
    homebrew.casks = [
        "google-chrome"
        "zoom"
    ];

    # Shell (optional)
    programs.zsh.enable = true;
    users.users.bnelson = {
        home = "/Users/bnelson";
        shell = pkgs.zsh;
    };
}
