{ pkgs, ... }:

{
  # Fonts
  fonts.fontconfig.enable = true;

  # Home packages (apps, utilities, misc)
  home.packages = with pkgs; [

    ### Applications ###
    discord
    obsidian
    #steam
    signal-desktop
    tor-browser
    anki
    xournalpp
    pandoc
    qgis
	kdePackages.kdenlive
	libreoffice
	#ghex
	gimp

    ### Utilities ###
    brightnessctl
    pavucontrol
    arandr
    pulseaudio
    unzip
    ksnip
    feh
    keepassxc
    #mullvad-vpn
    btop
   # font-awesome
    #jetbrains-mono
	nerd-fonts.jetbrains-mono
	nerd-fonts.symbols-only
    xclip
	yubikey-manager
	yubikey-personalization
	#vlc
	mpv
	#tailscale

    ### Misc / CLI tools ###
    pango
    marp-cli
    gtk2
    libGL
	gnumake
	claude-code
  ];

  # File manager
  programs.ranger.enable = true;

}
