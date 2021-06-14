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
set -gx LC_ALL en_US.UTF-8

set -gx FZF_DEFAULT_COMMAND fd --type f -H || git ls-tree -r --name-only HEAD || rg --files || ag -l -g \"\" || find .
set -gx TERM xterm-256color
set -gx RIPGREP_CONFIG_PATH $HOME/dotfiles/ripgreprc

starship init fish | source

function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and exa -l
    else
        builtin cd ~; and exa -l
    end
end

function Light 
    set -gx FZF_DEFAULT_OPTS --layout=reverse --color=bg+:#D9D9D9,bg:-1,border:#C8C8C8,spinner:#719899,hl:#f65c09,fg:#616161,header:#719872,info:#727100,pointer:#E12672,marker:#E17899,fg+:#000000,preview-bg:#D9D9D9,prompt:#0099BD,hl+:#f65c09
    sed -i 's/colors: \*dark/colors: \*light/g' ~/dotfiles/config/alacritty/alacritty.yml
    set -gx BAT_THEME 'OneHalfLight'
end


function Dark 
    set -gx FZF_DEFAULT_OPTS --layout=reverse --color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1
    sed -i 's/colors: \*light/colors: \*dark/g' ~/dotfiles/config/alacritty/alacritty.yml
    set -gx BAT_THEME 'OneHalfDark'
end

Light

function gl
    git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
end

function rgvim
    set choice (rg -il $argv | fzf -0 -1 --ansi --preview "bat --color=always --style=header {} | rg $argv --context 3")
    if [ $choice ]
        nvim "+/"(to_lower $argv) $choice
    end
end

function fkill
    ps -ef | fzf | awk '{print $2}' | xargs kill -9
end

function ds
    set -l cid (docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')
    [ -n "$cid" ] && docker stop "$cid"
end

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
