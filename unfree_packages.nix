{ lib, ... }: {
  nixpkgs.config = {
    # Allow all unfree packages globally
    allowUnfree = true;

    # Optionally, limit the unfree packages you want to allow
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
        #"obsidian"
        "steam"
      ];
  };
}
