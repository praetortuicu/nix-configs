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

    ### Utilities ###
    brightnessctl
    pavucontrol
    arandr
    pulseaudio
    unzip
    ksnip
    feh
    keepassxc
    mullvad-vpn
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

  # Zsh configuration
  programs.zsh = {
    enable						=	true;
	enableCompletion			=	true;
    autosuggestion.enable		=	true;
    autosuggestion.highlight	=	"fg=#2471b7";
    syntaxHighlighting.enable	=	true;
    defaultKeymap				=	"viins";

    shellAliases = {
      ll  = "ls -a";
      lll = "ls -l";
      cdD = "cd ~/Downloads";
    };

	initContent = ''
	autoload -Uz vcs_info
	setopt prompt_subst

	zstyle ':vcs_info:*' check-for-changes true
	zstyle ':vcs_info:*' unstagedstr ' *'
	zstyle ':vcs_info:*' stagedstr ' +'
	zstyle ':vcs_info:git:*' formats '(%b)'

	precmd() {
		vcs_info
		if [[ -n "$vcs_info_msg_0_" ]]; then
			RPROMPT="$vcs_info_msg_0_"
		else
			RPROMPT=""
		fi
	}
	'';
	};
}
