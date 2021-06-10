
PROMPT='%F{red}[%F{yellow}%n%F{green}@%F{blue}%m: %F{magenta}%~%F{red}] %F{reset}$(git_prompt_info)
%F{yellow}❯%F{blue}❯%F{magenta}❯%F{reset} '

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue}(%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{reset} "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{blue}) %F{yellow}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue})"
