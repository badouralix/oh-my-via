#
# functions/utils.zsh - provide useful functions
#
# This work is free.  You can redistribute it and/or modify it under the terms of
# the Do What The Fuck You Want To Public License, Version 2, as published by Sam
# Hocevar.  See  the COPYING file  or  http://www.wtfpl.net/  for  more  details.
#

# Given the name of a variable and a default value, sets the variable value to the
# default if and only if it has not been defined.
#
# @param $1 : name of the variable to be filled
# @param $2 : default value set if $1 is not already defined
set_default () {

	# /!\ compute differently with color variables
	# TODO make the regex case-insensitive
	if [[ $1 =~ '_COLOR(_.*)?$' ]]; then
		set_default_color "$@"
	else
		# See http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags
		[[ -z ${(P)1} ]] && typeset -g $1=$2
	fi
}

# Given the name of a variable and a default value, overwrites the variable value
# if and only if it has not been properly set as a visual effect.
#
# @param $1 : name of the variable to be filled
# @param $2 : default value set if $1 is not already a visual effect or a color code
set_default_color () {

	# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Visual-effects
	if [[ ! ${(P)1} =~ '%' ]]; then

		# If the variable whose name is $1 has already been overwritten,
		# use this color instead of the default one provided in $2
		if [[ -n ${(P)1} ]]; then
			typeset -g $1="%F{${(P)1}}"
		else

			# Distinguish case in which $2 is already a visual effect
			# and case in which it is only a color code
			if [[ $2 =~ '%' ]]; then
				typeset -g $1=$2
			else
				typeset -g $1="%F{$2}"
			fi
		fi
	fi
}

# vim: ft=zsh noet
