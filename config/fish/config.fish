set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx NVM_DIR $HOME/.nvm
set -gx GO111MODULE on
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home
set -gx PATH . $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $JAVA_HOME/bin $PATH
set -gx EDITOR nvim
set -gx MOZ_USE_XINPUT2 1
set -gx MOZ_ENABLE_WAYLAND 1
set -gx LC_TIME en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND fd --type f
set -gx FZF_DEFAULT_OPTS --color dark,hl:3,hl+:3,bg+:0,fg+:3,info:#7d889b,prompt:7,spinner:7,pointer:3,marker:254
set -gx BAT_THEME 'TwoDark'
set -gx TERM xterm-256color
set -gx CARGO_TARGET_DIR $HOME/.cargo/target_dir

starship init fish | source

function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and exa -l
    else
        builtin cd ~; and exa -l
    end
end
