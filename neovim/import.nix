{ config, pkgs, nixvim,	... }:

{
  imports = [
    nixvim.homeModules.nixvim
    ./default.nix
    ./options.nix
    #./keymaps.nix
	./plugins.nix
  ];
}
