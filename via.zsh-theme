# VIA ZSH Theme - Preview: ASAP
# Fork from the historical VIA ZSH Theme

local clock="%{$fg_bold[cyan]%}%T%{$reset_color%}"

# Check the UID
if [[ $UID -ne 0 ]];
then
	# normal user
	local user="%{$fg_bold[red]%}%n%{$reset_color%}"
	local eol="%{$fg_bold[yellow]%}%%%{$reset_color%}"
else
	# root
	local user="%{$fg_bold[blue]%}%n%{$reset_color%}"
	local eol="%{$fg_bold[yellow]%}#%{$reset_color%}"
fi

local user_host="${user}%{$fg_bold[yellow]%}@%{$fg_bold[white]%}%m%{$reset_color%}"

local current_dir="%{$fg_bold[green]%}%~%{$reset_color%}"

PROMPT='${clock} ${user_host} ${current_dir}${eol} '

# Display git info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}(%{$fg[white]%}git%{$fg[magenta]%})%{$fg[yellow]%}-%{$fg[magenta]%}[%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

custom_git_prompt_info () {
	local ref
	if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]
	then
		ref=$(command git symbolic-ref HEAD 2> /dev/null)  || ref=$(command git rev-parse --short HEAD 2> /dev/null)  || return 0
		echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
	fi
}

RPROMPT='$(custom_git_prompt_info)'

