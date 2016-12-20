#
# functions/prompt_utils.zsh - provide prompt definitions
#
# This work is free.  You can redistribute it and/or modify it under the terms of
# the Do What The Fuck You Want To Public License, Version 2, as published by Sam
# Hocevar.  See  the COPYING file  or  http://www.wtfpl.net/  for  more  details.
#

# Context: user@hostname (who am I and where am I)
# See https://github.com/bhilburn/powerlevel9k/blob/1ff9da64d974265ce2f22bd1da4a47d0b8f7ca90/powerlevel9k.zsh-theme#L434
prompt_context () {
	local username="%(!.$OHMYVIA_CONTEXT_ROOT_COLOR.$OHMYVIA_CONTEXT_USER_COLOR)%n%b%f"
	local separator="$OHMYVIA_CONTEXT_SEPARATOR_COLOR@%b%f"
	local hostname="$OHMYVIA_CONTEXT_HOSTNAME_COLOR%m%b%f"

	echo "${username}${separator}${hostname}"
}

# Print current directory with ~ instead of $HOME
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Shell-state
prompt_dir () {
	local current_dir="$OHMYVIA_DIR_COLOR%~%b%f"

	echo $current_dir
}

# Print current time
prompt_time () {
	local clock="$OHMYVIA_TIME_COLOR$OHMYVIA_TIME_FORMAT%b%f"

	echo $clock
}

# vim: ft=zsh fenc=utf-8

