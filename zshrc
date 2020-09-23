setopt autocd extendedglob prompt_subst
unsetopt prompt_cr prompt_sp BEEP
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

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Append to the history.
setopt appendhistory
# Use the extended history format, which gives timing info.
setopt extendedhistory
# Append to the history after each command runs, including timing info.
setopt incappendhistorytime
# Do not store adjacent duplicate commands.
setopt histignoredups
# Remove superfluous blanks that sometimes make it into my commands.
setopt histreduceblanks
# Commands beginning with a space are forgotten.
setopt histignorespace
# Notify on the completion of background tasks as soon as they finish, instead
# of waiting for the next prompt.
setopt notify

# Don't remove trailing slashs from directory names.
setopt noautoremoveslash
# When completing an unambiguous prefix, show the completions immediately.
setopt nolistambiguous
# Permit completion to happen inside a word, just before the cursor.
setopt completeinword

# Set history file and limits. Make them huge.
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

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

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
