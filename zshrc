
setopt correctall
setopt prompt_subst
setopt nobeep


setopt histignoredups
setopt inc_append_history
setopt share_history

#PROMPT='%d%>:%{\e[0m%}' # default prompt
#RPROMPT='[%* on %D]' # prompt for right side of screen


zmodload zsh/complist


autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit
autoload -U zrecompile
autoload -U zcalc

autoload -Uz vcs_info
#zstyle ':vcs_info:*' actionformats \
#        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
#zstyle ':vcs_info:*' formats       \
#        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

#zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
#vcs_info_wrapper() {
#   vcs_info
#
#   
#   if [ -n "$vcs_info_msg_0_" ]; then
#       vcs="%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
#   fi
#}

#precmd() {
#    vcs_info
#}

#RPROMPT=''

#RPROMPT=${vcs_info_msg_0_}

#https://wiki.archlinux.org/index.php/zsh#Customizing_the_prompt

                     
#zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "Used VCS use 
#%  vcs_info_printsys 
# for supported systems 
#zstyle ':vcs_info:*' enable git cvs svn

#RPROMPT=$(vcs_info_msg_0_)














# set up hosts completion from ssh/known_hosts
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

zstyle ':completion:::::' completer _expand _complete _ignored _approximate

zstyle ':completion:*' menu select


#zstyle ':completion:*:descriptions' format $'\e[m%d'
#zstyle ':completion:*' group-name ''

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;33m -- %d (errors: %e) --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

zstyle ':completion:*:expand:*' tag-order all-expansions

zstyle ':completion:*' verbose yes

zstyle ':completion:*:approximate:*' max-errors 2

# or to have a better heuristic, by allowing one error per 3 character typed
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'



# This will set the default prompt to the walters theme
# prompt walters
#

#prompt suse


#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ % "
#PROMPT="$fg[green]%n@%m$fg[cyan]:$fg[magenta][$fg[green]%~/$fg[magenta]]$fg[white] %#> "

#PROMPT="%F{white}%n@%m:%F{magenta}[%F{green}%~/%F{magenta}]%F{white} %#> "

#PROMPT="%n@%m:[%~/] %#> "


#PROMPT=$'%B%n@%m:%F{magenta}[%F{green}%~/%F{magenta}]%F{white} %#> %B'
PROMPT=$'[%n@%m:%~/]$ '

#PROMPT=$'%F{yellow}%n%F{white}@%F{cyan}%m%F{white}:%F{magenta}[%F{green}%~/%F{magenta}]%F{white} %#> '

#PROMPT='%d%>:%{\e[0m%}' # default prompt
#RPROMPT='[%* on %D]' # prompt for right side of screen
#RPROMPT="$(uptime | sed 's/.*load average: //' | awk -F\, '{print $1}')"
#RPROMPT=''


setopt transient_rprompt


zstyle ':vcs_info:*' actionformats \
        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
    fi
}

RPROMPT='$(vcs_info_wrapper)'














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
   #lsa
}


#SPROMPT="zsh: correct %R to %r? ([Y]es/[No]/[E]dit/[A]bort) "


bindkey -e
bindkey '\ew' kill-region
bindkey -s '\el' "ls\n"
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey ' ' magic-space # also do history expansion on space

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^[[Z' reverse-menu-complete

# # Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

