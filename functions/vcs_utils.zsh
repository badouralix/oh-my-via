#
# functions/vcs_utils.zsh - provide supplemental VCS functions
#
# This work is free.  You can redistribute it and/or modify it under the terms of
# the Do What The Fuck You Want To Public License, Version 2, as published by Sam
# Hocevar.  See  the COPYING file  or  http://www.wtfpl.net/  for  more  details.
#

# Thanks to http://eseth.org/2010/git-in-zsh.html
+vi-git-stash () {
	if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
		hook_com[misc]+=$OHMYVIA_VCS_COLOR_STASH
	fi
}

# Thanks to https://github.com/sunaku/home/
+vi-git-untracked () {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
		git status --porcelain | fgrep '??' &> /dev/null ; then
		# This will show the marker if there are any untracked files in repo.
		# If instead you want to show the marker only if there are untracked
		# files in $PWD, use:
		#[[ -n $(git ls-files --others --exclude-standard) ]] ; then
		hook_com[misc]+=$OHMYVIA_VCS_COLOR_UNTRACKED
	fi
}

# Erase hook_com[misc] ( ie. %m ) to avoid dealing with backends info outputs
# Add $vcs_clean_color to setup default %b coloring in vcs prompt
+vi-misc-init () {
	hook_com[misc]=$OHMYVIA_VCS_COLOR_CLEAN
}

# vim: ft=zsh noet
