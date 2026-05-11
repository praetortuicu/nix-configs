{	pkgs,	...}:

{
	programs.zsh	=	{
		enable	=	true;
		autosuggestion.enable	=	true;
		autosuggestion.highlight	=	"fg=#2471b7";
		syntaxHighlighting.enable	=	true;
		defaultKeymap	=	"viins";

	initContent	=	''
		setopt	sharehistory
		setopt	hist_ignore_space
		setopt	hist_ignore_all_dups
		setopt	hist_find_no_dups
	'';
	};
}
