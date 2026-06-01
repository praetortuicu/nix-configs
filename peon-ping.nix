{ pkgs, peon-ping, ... }:
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
      "peon"
      "sc_kerrigan"
      {
        name = "gilfoyle";
        src = pkgs.fetchFromGitHub {
          owner = "OWNER";
          repo = "openpeon-gilfoyle";
          rev = "main";
          sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
        };
      }
      {
        name = "protoss";
        src = pkgs.fetchFromGitHub {
          owner = "OWNER";
          repo = "openpeon-protoss";
          rev = "main";
          sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
        };
      }
    ];
    enableZshIntegration = true;
  };
}
