local gitinfo=$(git_prompt_info)
local ret_status="%(?:%{$fg[green]%}%% :%{$fg[red]%}%% %s)"
#echo $gitinfo
PROMPT="$fg_bold[magenta]%3c$fg_no_bold[magenta] ${ret_status}%f"

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
