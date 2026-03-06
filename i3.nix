{config, lib, pkgs, ...}:
let 
  mod = "Mod4";
in

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    config = {
      startup = [
        {
		  # yes I have a shodan background image, sue me
          command = "feh --bg-scale /home/tuicuimens/things/pictures/shodan_highres.jpg";
          always = true;
          notification = false;
        }
      ];
      modifier = mod;
      fonts = {
        names = [ "pango:Symbols Nerd Font 18" ];
      };
      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";

        # Focus
        "${mod}+j" = "focus left";
        "${mod}+k" = "focus down";
        "${mod}+l" = "focus up";
        "${mod}+semicolon" = "focus right";

        # Move
        "${mod}Shift+j" = "move left";
        "${mod}Shift+k" = "move down";
        "${mod}Shift+l" = "move up";
        "${mod}Shift+semicolon" = "move right";

        "${mod}+Return" = "exec alacritty";
      };

      bars = [
        {
          position = "bottom";
          # pango_markup  = true;
          fonts = { 
            names = [ 
              # "Font Awesome 6 Free Solid"
              # "Font Awesome 6 Free"
              # "Font Awesome 6 Brands"
              "JetBrainsMono Nerd Font"
              "Symbols Nerd Font"
            ];
            size = "13";
          };
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/home-manager/config.toml";
        }
      ];
    };
  };
}
