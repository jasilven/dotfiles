set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx NVM_DIR $HOME/.nvm
set -gx GO111MODULE on
# set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
set -gx PATH . $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $JAVA_HOME/bin $PATH
set -gx EDITOR nvim
set -gx MOZ_USE_XINPUT2 1
set -gx MOZ_ENABLE_WAYLAND 1
set -gx LC_TIME en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx TERM wezterm
#set -gx VTE_VERSION 6003

#set -gx TERM xterm-256color
#set -gx FZF_DEFAULT_OPTS --layout=reverse --color=bg+:#D9D9D9,bg:-1,border:#C8C8C8,spinner:#719899,hl:#f65c09,fg:#616161,header:#719872,info:#727100,pointer:#E12672,marker:#E17899,fg+:#000000,preview-bg:#D9D9D9,prompt:#0099BD,hl+:#f65c09

set -gx RIPGREP_CONFIG_PATH $HOME/dotfiles/ripgreprc

set -gx FZF_DEFAULT_COMMAND fd --type f -H || git ls-tree -r --name-only HEAD || rg --files || ag -l -g \"\" || find .
set -gx FZF_DEFAULT_OPTS --pointer=▶  --layout=reverse --color=bg+:-1,bg:-1,spinner:#81A1C1,hl:1,fg:#6c6c6c,header:#616E88,info:#81A1C1,pointer:1,marker:#81A1C1,fg+:1,prompt:#81A1C1,hl+:1

set -gx BAT_THEME 'GitHub'

starship init fish | source

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
