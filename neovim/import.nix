{ config, pkgs, ... }:

let
  nixvimModule = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/nixvim/archive/master.tar.gz";
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
