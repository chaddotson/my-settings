PATH=$HOME/bin:/usr/local/bin:$PATH
PAGER=less
COLORTERM=yes
HISTFILE=$HOME/.zshhistory
HISTSIZE=1000
SAVEHIST=500000
DIRSTACKSIZE=20
export PATH PAGER COLORTERM HISTFILE HISTSIZE SAVEHIST DIRSTACKSIZE


#PROMPT='%d%>:%{\e[0m%}' # default prompt
#RPROMPT='[%* on %D]' # prompt for right side of screen


zmodload zsh/complist

autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit
autoload -U zrecompile
autoload -U zcalc

# set up hosts completion from ssh/known_hosts
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

zstyle ':completion:::::' completer _complete _approximate

zstyle ':completion:*' menu select

zstyle ':completion:*:approximate:*' max-errors 2

#zstyle ':completion:*:approximate:*' max-errors 2
# or to have a better heuristic, by allowing one error per 3 character typed
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'



# This will set the default prompt to the walters theme
# prompt walters
#

prompt suse

#PROMPT='%d%>:%{\e[0m%}' # default prompt
#RPROMPT='[%* on %D]' # prompt for right side of screen
#RPROMPT="$(uptime | sed 's/.*load average: //' | awk -F\, '{print $1}')"
RPROMPT=''

GREP_OPTIONS='--color=auto'
GREP_COLOR='7;31'

export \
	GREP_OPTIONS \
	GREP_COLOR

#alias grep='grep --color=auto'
#alias ls='ls --color=auto'
alias ls='ls -G --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -hml --color=auto'
alias lsd='ls -ld *(-/DN) --color=auto' #list only dirs and symlinks that point to directories
alias lsa='ls -ld .* --color=auto' #list only files beginning with "."
alias h=history
alias vi='vim'

function chpwd()
{
   emulate -L zsh
   ls
}
