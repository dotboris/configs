PROMPT='%{$fg[white]%}%B[%{$fg[blue]%}%n%b%{$fg[white]%}@%B%{$fg[blue]%}%m %{$fg[green]%}%c%{$fg[white]%}]%b$(git_prompt_info)%(0#.%{$fg[red]%}#.%{$fg[magenta]%}$) %{$reset_color%}' 
RPROMPT="%{%(0?.$fg[green].$fg[red])%}%?%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"

