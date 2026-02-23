{ lib, ... }: {
  nixpkgs.config = {
    allowUnfree = true;

    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
        #"obsidian"
        "steam"
		"steam-original"
		"steam-unwrapped"
		"steam-run"
      ];
  };
}
