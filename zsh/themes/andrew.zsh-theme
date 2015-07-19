ZSH_THEME_VCTRL_PROMPT_PREFIX=":(%{$fg[green]%}"
ZSH_THEME_VCTRL_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_VCTRL_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_VCTRL_PROMPT_CLEAN=""

function svnrprompt {
	if in_svn; then
		svnrpromptstr="svn"$ZSH_THEME_VCTRL_PROMPT_PREFIX
		svndirty=$(svn status | wc -l)
		svnrpromptstr="$svnrpromptstr"$(svn_get_rev_nr)
		if [ "$svndirty" != "0" ]; then
			svnrpromptstr="$svnrpromptstr|$ZSH_THEME_VCTRL_PROMPT_DIRTY$svndirty"
		else
			svnrpromptstr="$svnrpromptstr$ZSH_THEME_VCTRL_PROMPT_CLEAN"
		fi
		svnrpromptstr="$svnrpromptstr$ZSH_THEME_VCTRL_PROMPT_SUFFIX"
		echo $svnrpromptstr
	fi
}

function in_git {
	echo $(git rev-parse --show-toplevel 2>/dev/null)
}

DISABLE_UNTRACKED_FILES_DIRTY=true
function gitrprompt {
	if [ $(in_git) ]; then
		gitrpromptstr="git"$ZSH_THEME_VCTRL_PROMPT_PREFIX
		gitrpromptstr="$gitrpromptstr$(current_branch)"

    pgd=$(git status --porcelain --untracked-files=no | wc -l)
    if  [ "$pgd" != "0" ]; then
      gitrpromptstr="$gitrpromptstr|$ZSH_THEME_VCTRL_PROMPT_DIRTY${pgd}"
    else
      gitrpromptstr="$gitrpromptstr$ZSH_THEME_VCTRL_PROMPT_CLEAN$(parse_git_dirty)"
    fi

		gitrpromptstr="$gitrpromptstr$ZSH_THEME_VCTRL_PROMPT_SUFFIX"
		echo $gitrpromptstr
	fi
}

delim="%%"
ret_status="%(?:%{$fg[green]%}$delim :%{$fg[red]%}$delim %s)"

local termwidth=$(( ${COLUMNS}-1 ))
#PROMPT='$fg_bold[magenta]%3c$fg_no_bold[magenta] ${ret_status}%f'
PROMPT='%F{magenta}%B%3c%b%f ${ret_status}%f'
rpromptstr='$(gitrprompt)$(svnrprompt)'
RPROMPT=$rpromptstr

