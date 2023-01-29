source ~/.profile

HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=10000

#### ALIASES ####
alias diff='diff --color'
alias ls='ls --color=tty'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias md='mkdir -p'
alias rd=rmdir

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd 1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
#############################

#### BINDINGS ####
#source 'key-bindings.zsh'
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
autoload -Uz edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

bindkey '^?'      backward-delete-char          # bs         delete one char backward
bindkey '^[[3~'   delete-char                   # delete     delete one char forward
bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
bindkey '^[[F'    end-of-line                   # end        go to the end of line
bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
bindkey '^[[3;5~' kill-word                     # ctrl+del   delete next word
bindkey '^J'      backward-kill-line            # ctrl+j     delete everything before cursor
bindkey '^[[D'    backward-char                 # left       move cursor one char backward
bindkey '^[[C'    forward-char                  # right      move cursor one char forward
bindkey '^[[A'    up-line-or-beginning-search   # up         prev command in history (fuzzy)
bindkey '^[[B'    down-line-or-beginning-search # down       next command in history (fuzzy)
bindkey '^[[5~'   up-line-or-history            # pgup       prev command in history
bindkey '^[[6~'   down-line-or-history          # pgdown     next command in history
bindkey '^[[Z'    reverse-menu-complete         # shift+tab  move through completion menu backwards
bindkey "^X^E"    edit-command-line             # ctrl+x+e   open current command in $EDITOR

#############################

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

autoload -Uz colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

setopt auto_cd
setopt multios
setopt prompt_subst

setopt long_list_jobs
setopt interactivecomments


#### GIT PROMPT ####
function git_prompt_info() {
  !git rev-parse --git-dir &> /dev/null && return 0
  local ref

  ref=$(git symbolic-ref --short HEAD 2> /dev/null) \
  || ref=$(git rev-parse --short HEAD 2> /dev/null) \
  || return 0

  echo "${ZSH_GIT_PREFIX}${ref:gs/%/%%}$(parse_git_dirty)${ZSH_GIT_SUFFIX}"
}

function parse_git_dirty() {
  if [[ -n $(git status --porcelain  2> /dev/null | tail -n 1) ]]; then
    echo "*"
  else
    echo ""
  fi
}
#############################

#### THEME ####
PROMPT='%{$fg_bold[green]%}%n@%m:%{$fg_bold[blue]%}%2~ $(git_prompt_info)%{$reset_color%}%(!.#.$) '
ZSH_GIT_PREFIX="%{$fg[red]%}‹"
ZSH_GIT_SUFFIX="›%{$reset_color%}"
#############################
