{	...	}:
{
	programs.zsh.initContent	=	''
		autoload	-Uz	vcs_info
		setopt	prompt_subst

		zstyle	':vcs_info:*'	enable	git
		zstyle	':vcs_info:*'	check-for-changes	true
		zstyle	':vcs_info:*'	unstagedstr	'%F{yellow}*%f'
		zstyle	':vcs_info:*'	stagedstr	'%F{red}+%f'
		zstyle	':vcs_info:*'	formats	'%F{cyan}(%b)%f%u%c'

		precmd()	{	vcs_info	}

		function	zle-keymap-select	zle-line-init	{
			case	$KEYMAP	in
			vicmd)	VI_MODE="%F{red}[N]%f ";	echo -ne $'\e[1 q' ;;
			*)	VI_MODE="";	echo -ne $'\e[5 q' ;;
			esac
			zle	reset-prompt
		}
		zle	-N	zle-keymap-select
		zle	-N	zle-line-init
		preexec()	{	echo	-ne	$'\e[5 q';	}

		PROMPT='%F{red}%(?..[%?] )%f%F{blue}%(5~|%-1~/…/%3~|%~)%f %(?.%F{green}.%F{red})❯%f '
		RPROMPT='$VI_MODE''${vcs_info_msg_0_}'

		bindkey "^?"	backward-delete-char
		bindkey "^R"	history-incremental-search-backward

		autoload	-Uz	edit-command-line
		zle	-N	edit-command-line
		bindkey	-M	vicmd	"^e"	edit-command-line
	'';
}
