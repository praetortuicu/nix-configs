{ config, pkgs, ... }:

let
  nixvimModule = import (builtins.fetchGit {
		url = "https://github.com/nix-community/nixvim";
		ref = "nixos-25.05";
  });

in {
  imports = [
    nixvimModule.homeManagerModules.nixvim   # adds programs.nixvim
    ./default.nix
    ./options.nix
    #./keymaps.nix
	./plugins.nix
  ];
}
