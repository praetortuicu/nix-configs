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
        name = "protoss";
        src = pkgs.fetchFromGitHub {
          owner = "codyborn";
          repo = "protoss-sounds";
          rev = "main";
          sha256 = "sha256-uQI7YUobkfAUu/0xhM4EuCq9GQ1d87UmsNCefAg2fGs=";
        };
      }
      #{
      #  name = "gilfoyle";
      #  src = pkgs.fetchFromGitHub {
      #    owner = "OWNER";        # fill in from openpeon.com/packs/gilfoyle
      #    repo = "REPO";
      #    rev = "main";
      #    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      #  };
      #}
    ];
    enableZshIntegration = true;
  };
}
