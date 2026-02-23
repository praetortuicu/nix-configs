{ pkgs, ...}:

{
	  home.shellAliases.v = "nvim";

	  programs.nixvim = {
		enable        = true;
		defaultEditor = true;
		viAlias       = true;
		vimAlias      = true;

		nixpkgs.useGlobalPackages = true;

		luaLoader.enable  = true;

	  };
}
