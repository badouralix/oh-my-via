#
# Oh-My-VIA ZSH Theme
# Fork from the historical VIA Centrale Réseaux ZSH Theme
#
# This work is free.  You can redistribute it and/or modify it under the terms of
# the Do What The Fuck You Want To Public License, Version 2, as published by Sam
# Hocevar.  See  the COPYING file  or  http://www.wtfpl.net/  for  more  details.
#

#################################################################################
# Source functions
#################################################################################

OHMYVIA_INSTALLATION_PATH="$(dirname "$0")"

source $OHMYVIA_INSTALLATION_PATH/functions/utils.zsh
source $OHMYVIA_INSTALLATION_PATH/functions/vcs_themes.zsh
source $OHMYVIA_INSTALLATION_PATH/functions/vcs_utils.zsh

#################################################################################
# Setup prompts
#################################################################################

local time_format=${OHMYVIA_TIME_FORMAT:-"%D{%H:%M}"}
local clock="%B%F{cyan}$time_format%f%b"

# Check the UID
if [[ $UID -ne 0 ]];
then
	# normal user
	local user="%B%F{red}%n%f%b"
	local eol="%B%(?.%F{yellow}.%F{red})%%%f%b"
else
	# root
	local user="%B%F{blue}%n%f%b"
	local eol="%B%(?.%F{yellow}.%F{red})#%f%b"
fi

local user_host="${user}%B%F{yellow}@%F{white}%m%f%b"

local current_dir="%B%F{green}%~%f%b"

PROMPT='${clock} ${user_host} ${current_dir}${eol} '

# Display vcs info
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
autoload -Uz vcs_info

zstyle ':vcs_info:*' max-exports 1		# vcs_info only sets vcs_info_msg_0_
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true	# enable %c and %u sequences usage

set_default OHMYVIA_VCS_COLOR_UNSTAGED  "red"
set_default OHMYVIA_VCS_COLOR_STAGED    "yellow"
set_default OHMYVIA_VCS_COLOR_UNTRACKED "blue"
set_default OHMYVIA_VCS_COLOR_STASH     "cyan"
set_default OHMYVIA_VCS_COLOR_CLEAN     "green"

zstyle ':vcs_info:*' unstagedstr $OHMYVIA_VCS_COLOR_UNSTAGED
zstyle ':vcs_info:*' stagedstr   $OHMYVIA_VCS_COLOR_STAGED

zstyle ':vcs_info:git*+set-message:*' hooks misc-init git-stash git-untracked

# Load VCS theme
set_default OHMYVIA_VCS_THEME "default"
eval +vi-theme-$OHMYVIA_VCS_THEME

zstyle ':vcs_info:*' formats       " $OHMYVIA_VCS_PROMPT_NORMAL"
zstyle ':vcs_info:*' actionformats " $OHMYVIA_VCS_PROMPT_ACTION"

precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

# vim: ft=zsh fenc=utf-8

