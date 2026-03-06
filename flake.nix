{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-code.url = "github:sadjow/claude-code-nix";
	nixvim	=	{
		url	=	"github:nix-community/nixvim/";
		inputs.nixpkgs.follows	=	"nixpkgs";
	};
  };

  outputs = { self, nixpkgs, home-manager, claude-code, nixvim,	... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ claude-code.overlays.default ];
    };
  in {
    homeConfigurations."tuicuimens" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home.nix ];
	  extraSpecialArgs	=	{	inherit	nixvim;	};
    };
  };
}
