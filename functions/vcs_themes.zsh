#
# functions/vcs_themes.zsh - provide sample themes for VCS prompt
#
# This work is free.  You can redistribute it and/or modify it under the terms of
# the Do What The Fuck You Want To Public License, Version 2, as published by Sam
# Hocevar.  See  the COPYING file  or  http://www.wtfpl.net/  for  more  details.
#

# In normal formats and actionformats the following replacements are done:
#	%s : The VCS in use (git, hg, svn, etc.).
#	%b : Information about the current branch.
#	%a : An identifier that describes the action. Only makes sense in actionformats.
#	%i : The current revision number or identifier. For hg the hgrevformat style may be used to customize the output.
#	%c : The string from the stagedstr style if there are staged changes in the repository.
#	%u : The string from the unstagedstr style if there are unstaged changes in the repository.
#	%R : The base directory of the repository.
#	%r : The repository name. If %R is /foo/bar/repoXY, %r is repoXY.
#	%S : A subdirectory within a repository. If $PWD is /foo/bar/repoXY/beer/tasty, %S is beer/tasty.
#	%m : A "misc" replacement. It is at the discretion of the backend to decide what this replacement expands to.

+vi-theme-default () {
	local vcs_prompt_prefix="%F{magenta}(%F{white}%s%F{magenta})%f"
	local vcs_prompt_hyphen="%F{yellow}-%f"
	local vcs_prompt_normal="%F{magenta}[%m%c%u%b%F{magenta}]%f"
	local vcs_prompt_action="%F{magenta}[%m%c%u%b%F{magenta}|%F{red}%a%F{magenta}]%f"

	OHMYVIA_VCS_PROMPT_NORMAL=${OHMYVIA_VCS_PROMPT_NORMAL:-"$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_normal"}
	OHMYVIA_VCS_PROMPT_ACTION=${OHMYVIA_VCS_PROMPT_ACTION:-"$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_action"}
}

+vi-theme-alphabet () {
	local vcs_prompt_prefix="%F{magenta}(%F{white}%s%F{magenta})%f"
	local vcs_prompt_hyphen="%F{yellow}-%f"
	local vcs_prompt_normal="%F{magenta}[%m%c%u%b%F{magenta}]%f"
	local vcs_prompt_action="%F{magenta}[%m%c%u%b %F{magenta}| %F{red}%a%F{magenta}]%f"

	OHMYVIA_VCS_PROMPT_NORMAL="$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_normal"
	OHMYVIA_VCS_PROMPT_ACTION="$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_action"
}

+vi-theme-djou () {
	local vcs_prompt_prefix="%F{white}%s%f"
	local vcs_prompt_hyphen=" %F{yellow}-%f "
	local vcs_prompt_normal="%m%c%u%b%f"
	local vcs_prompt_action="%m%c%u%b %F{magenta}| %F{red}%a%f"

	OHMYVIA_VCS_PROMPT_NORMAL="$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_normal"
	OHMYVIA_VCS_PROMPT_ACTION="$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_action"
}

+vi-theme-kiwi () {
	local vcs_prompt_prefix="%F{magenta}(%F{white}%s%F{magenta})%f"
	local vcs_prompt_hyphen="%F{yellow}-%f"
	local vcs_prompt_normal="%F{magenta}[%m%c%u%b%F{magenta}]%f"
	local vcs_prompt_action="%F{magenta}[%m%c%u%b%F{yellow}|%F{red}%a%F{magenta}]%f"

	OHMYVIA_VCS_PROMPT_NORMAL="$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_normal"
	OHMYVIA_VCS_PROMPT_ACTION="$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_action"
}

+vi-theme-jon () {
	local vcs_prompt_prefix=""
	local vcs_prompt_hyphen=""
	local vcs_prompt_normal="%F{magenta}[%m%c%u%b%F{magenta}]%f"
	local vcs_prompt_action="%F{magenta}[%m%c%u%b%F{magenta}|%F{red}%a%F{magenta}]%f"

	OHMYVIA_VCS_PROMPT_NORMAL="$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_normal"
	OHMYVIA_VCS_PROMPT_ACTION="$vcs_prompt_prefix$vcs_prompt_hyphen$vcs_prompt_action"
}

# vim: ft=zsh noet
