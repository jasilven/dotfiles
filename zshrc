setopt autocd extendedglob prompt_subst
# unsetopt prompt_cr prompt_sp BEEP
bindkey -e

# set tilde to work
set -o magicequalsubst

# Initialize auto completion and expansion.
zstyle ':completion:*' completer _complete _prefix _files
zstyle ':completion:*' menu select=1
zstyle ':completion:*:descriptions' format '  COMPLETING %d:'
zstyle ':completion:*' group-name ''
autoload -Uz compinit
compinit

zle -N zle-keymap-select

autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu

setopt appendhistory
setopt incappendhistorytime
setopt histignoredups
setopt histreduceblanks
setopt histignorespace
setopt notify

# Don't remove trailing slashs from directory names.
setopt noautoremoveslash
# When completing an unambiguous prefix, show the completions immediately.
setopt nolistambiguous
# Permit completion to happen inside a word, just before the cursor.
setopt completeinword

# Set history file and limits. Make them huge.
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

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
alias open=xdg-open
alias node12='export PATH="/usr/local/opt/node@12/bin:$PATH"'
