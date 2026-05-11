{	...	}:
{
	programs.zsh.completionInit	=	''
		#	include	dotfiles
		_comp_options+=(globdots)

		zstyle	':completion:*'	menu	select
		zstyle	':completion:*'	matcher-list	'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
		zstyle	':completion:*'	list-colors ''${(s.:.)LS_COLORS}
		zstyle	':completion:*'	group-name	""
		zstyle	':completion:*'	squeeze-slashes	true
		zstyle	':completion:*:descriptions'	format	'%F{yellow}-- %d --%f'
		zstyle	':completion:*:warnings'	format	'%F{red}--No matches: %d --%f'
	'';
}
