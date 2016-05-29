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
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}(%{$fg[white]%}git%{$fg[magenta]%})%{$fg[yellow]%}-%{$fg[magenta]%}[%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%}]%{$reset_color%}"

RPROMPT='$(git_prompt_info)'

