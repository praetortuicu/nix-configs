{ pkgs, peon-ping, ... }:
let
  ogPacks = pkgs.fetchFromGitHub {
    owner = "PeonPing";
    repo = "og-packs";
    rev = "main";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
in

{
  programs.peon-ping = {
    enable = true;
    package = peon-ping.packages.${pkgs.system}.default;
    claudeCodeIntegration = true;
    settings = {
      default_pack = "protoss";
      volume = 0.7;
      enabled = true;
      desktop_notifications = true;
      categories = {
        "session.start" = true;
        "task.complete" = true;
        "task.error" = true;
        "input.required" = true;
        "resource.limit" = true;
        "user.spam" = true;
      };
    };
    installPacks = [
		{ name = "peon";        src = "${ogPacks}/peon"; }
		{ name = "peon";        src = "${ogPacks}/sc_kerrigan"; }
	{
		name = "protoss";
		src = pkgs.fetchFromGitHub {
		owner = "codyborn";
		repo = "protoss-sounds";
		rev = "main";
		sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
		};
	}
    ];
    enableZshIntegration = true;
  };
}
