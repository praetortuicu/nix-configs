{ config, pkgs, nixvim,	... }:

{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./default.nix
    ./options.nix
    #./keymaps.nix
	./plugins.nix
  ];
}
