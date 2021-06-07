if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
	PS1='\[\033]0;Bash\007\]'      # 窗口标题
	PS1="$PS1"'\n'                 # 换行
	PS1="$PS1"'\[\033[32;1m\]'     # 高亮绿色
	#PS1="$PS1"'➜  '               # unicode 字符，右箭头
	PS1="$PS1"'# '               # unicode 字符，右箭头
	PS1="$PS1"'\[\e[33;36m\]lzo \[\033[31m\]@ \[\e[0m\]\[\e[32;1m\]SKY-4JBL\[\e[0m\]\[\e[31;1m\]'
	#PS1="$PS1"'\[\e[34;1m\]\u@\[\e[0m\]\[\e[32;1m\]\h\[\e[0m\]\[\e[31;1m\]'
	#PS1="$PS1"'\[\e[0m\]\[\e[32;1m\]\h\[\e[0m\]\[\e[31;1m\]'
	PS1="$PS1"' ➟'              
	PS1="$PS1"'\[\033[36m\]'       # 青色
	PS1="$PS1"' in '              
	PS1="$PS1"'\[\033[33;1m\]'     # 高亮黄色
	PS1="$PS1"'\W'                 # 当前目录             

	if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			PS1="$PS1"'\[\033[31m\]'   # 红色
			PS1="$PS1"'`__git_ps1`'    # git 插件
		fi
	fi
	PS1="$PS1"'\[\033[30m\]'       
	PS1="$PS1"' [\t]'                 

	PS1="$PS1"'\n'                 # 换行
	PS1="$PS1"'\[\033[31m\]'   # 红色
	PS1="$PS1"'$'
	PS1="$PS1"'\[\033[37m\] '      # 青色
fi

MSYS2_PS1="$PS1"