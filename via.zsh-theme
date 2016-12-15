# VIA ZSH Theme - Preview: ASAP
# Fork from the historical VIA Centrale Réseaux ZSH Theme

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

local vcs_unstaged_color=${OHMYVIA_VCS_UNSTAGED_COLOR:-"%F{red}"}
local vcs_staged_color=${OHMYVIA_VCS_STAGED_COLOR:-"%F{yellow}"}
local vcs_untracked_color=${OHMYVIA_VCS_UNTRACKED_COLOR:-"%F{blue}"}
local vcs_stash_color=${OHMYVIA_VCS_STASH_COLOR:-"%F{cyan}"}
local vcs_clean_color=${OHMYVIA_VCS_CLEAN_COLOR:-"%F{green}"}

zstyle ':vcs_info:*' unstagedstr $vcs_unstaged_color
zstyle ':vcs_info:*' stagedstr   $vcs_staged_color

# Thanks to https://github.com/sunaku/home/
function +vi-git-untracked(){
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
		git status --porcelain | fgrep '??' &> /dev/null ; then
		# This will show the marker if there are any untracked files in repo.
		# If instead you want to show the marker only if there are untracked
		# files in $PWD, use:
		#[[ -n $(git ls-files --others --exclude-standard) ]] ; then
		hook_com[misc]+=$vcs_untracked_color
	fi
}

# Thanks to http://eseth.org/2010/git-in-zsh.html
function +vi-git-stash() {
	if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
		hook_com[misc]+=$vcs_stash_color
	fi
}

zstyle ':vcs_info:git*+set-message:*' hooks git-stash git-untracked

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
local vcs_formats_prefix="%F{magenta}(%F{white}%s%F{magenta})%f"
local vcs_formats_hyphen="%F{yellow}-%f"
local vcs_formats_normal="%F{magenta}[$vcs_clean_color%m%c%u%b%F{magenta}]%f"
local vcs_formats_action="%F{magenta}[$vcs_clean_color%m%c%u%b%F{yellow}:%F{red}%a%F{magenta}]%f"

zstyle ':vcs_info:*' formats       " $vcs_formats_prefix$vcs_formats_hyphen$vcs_formats_normal"
zstyle ':vcs_info:*' actionformats " $vcs_formats_prefix$vcs_formats_hyphen$vcs_formats_action"

precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

# vim: ft=zsh fenc=utf-8

