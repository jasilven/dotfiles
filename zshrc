HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify prompt_subst
unsetopt prompt_cr prompt_sp BEEP
bindkey -e

# set tilde to work
set -o magicequalsubst

autoload -Uz compinit
compinit

zle -N zle-keymap-select

# autoload -Uz promptinit
# promptinit

# git_branch() {
#     git_status="$(git status 2> /dev/null)"
#     pattern="On branch ([^[:space:]]*)"
#     if [[ ! ${git_status} =~ "(working (tree|directory) clean)" ]]; then
#         state="*"
#     fi
#     if [[ ${git_status} =~ ${pattern} ]]; then
#       branch=${match[1]}
#       branch_cut=${branch:0:35}
#       if (( ${#branch} > ${#branch_cut} )); then
#           echo " ${branch_cut}…${state} "
#       else
#           echo " ${branch}${state} "
#       fi
#     else 
#             echo " "
#     fi
# }


# function zle-line-init zle-keymap-select {
#     DOLLAR='%B%F{green}$%b'
#     GIANT_N='%B%F{red}N%b'
#     VIMODE="${${KEYMAP/vicmd/$GIANT_N}/(main|viins)/$DOLLAR}"
#     zle reset-prompt
# }
# zle -N zle-line-init

# PROMPT='
# %B%F{blue}%d%f%F{yellow}%b$(git_branch)%F{cyan}%(1j.(jobs!).)
# %F{green%}%B $ %F{none}%b'

eval "$(starship init zsh)"

alias more="bat"
alias less="bat"
alias vim="nvim"
alias nrepl="clj -R:nrepl -m nrepl.cmdline"
alias cider="clj -A:cider"
alias lrun="LEIN_FAST_TRAMPOLINE=y lein trampoline run -m"
alias leinrun="LEIN_FAST_TRAMPOLINE=y lein trampoline run -m"
alias ls="exa -lt modified --git --sort modified"
alias ll="exa -l"
# alias clj="clj -J-Dclojure.server.jvm=\"{:port 5555 :accept clojure.core.server/io-prepl}\""
alias find="fd"
alias tm="tmux attach || tmux new"
alias open=xdg-open
