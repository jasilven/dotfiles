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

autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu

eval "$(starship init zsh)"

alias pbcopy="xclip -selection c"
alias pbpaste="xclip -selection c -o"
alias more="bat"
alias less="bat"
alias cat="bat"
alias vim="nvim"
alias tldr="tldr -p"
alias nrepl="clj -R:nrepl -m nrepl.cmdline"
alias ls="exa -t modified --git --sort modified"
alias ll="exa -l"
# alias clj="clj -J-Dclojure.server.jvm=\"{:port 5555 :accept clojure.core.server/io-prepl}\""
alias find="fd"
alias tm="tmux attach || tmux new"
alias ps="procs --sortd cpu"
alias open=xdg-open
alias node12='export PATH="/usr/local/opt/node@12/bin:$PATH"'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
