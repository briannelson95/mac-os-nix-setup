{ config, pkgs, ... }:

{
    # System settings
    system.defaults.siri.enabled = false;
    system.defaults.screentime.enabled = false;

    # Hostname
    networking.computerName = "Mac-Configured";
    networking.hostName = "mac-configured";

    # Homebrew packages (for apps like Zoom, Chrome)
    homebrew.enable = true;
    homebrew.casks = [
        "google-chrome"
        "zoom"
    ];

    # Optional — show battery percentage in menu bar
    system.defaults.menuextra.battery.ShowPercent = true;

    # Example — expand save/print panels by default
    system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
    system.defaults.NSGlobalDomain.PMPrintingExpandedStateForPrint = true;

    # Example — set screenshot location
    system.defaults.screencapture.location = "${config.home.homeDirectory}/Screenshots";

    # Shell setup (can leave this basic for now)
    programs.zsh.enable = true;
    users.users.bnelson = {
        home = "/Users/bnelson";
        shell = pkgs.zsh;
    };
}
