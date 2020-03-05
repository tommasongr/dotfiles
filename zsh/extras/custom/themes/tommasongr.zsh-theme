PROMPT='%{$FG[197]%}%n %B%{$reset_color%}@ %b%{$FG[011]%}%m %{$FG[047]%}%~ %{$FG[014]%}$(git_prompt_info)
%{$reset_color%}🌈 %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%B%{$FG[013]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%b%{$FG[014]%}) %{$FG[011]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%b%{$FG[014]%})"
