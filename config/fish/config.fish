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
set -gx SKIM_DEFAULT_COMMAND fd --type f || git ls-tree -r --name-only HEAD || rg --files || ag -l -g \"\" || find .
set -gx SKIM_DEFAULT_OPTIONS --layout=reverse --color dark,matched:3,matched_bg:-1,current_match:1,current:1,current_bg:-1,info:#7d889b,prompt:#7d889b,spinner:7,pointer:1,marker:254,current_match_bg:-1
set -gx BAT_THEME 'ansi'
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

#function Light 
#    sed -i 's/colors: \*dark/colors: \*light/g' ~/dotfiles/config/alacritty/alacritty.yml
#    set -gx BAT_THEME 'GitHub'
#end
#
#function Dark 
#    sed -i 's/colors: \*light/colors: \*dark/g' ~/dotfiles/config/alacritty/alacritty.yml
#    set -gx BAT_THEME 'TwoDark'
#end

function gl
    git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
end

# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br --wraps=broot
    set -l cmd_file (mktemp)
    if broot --outcmd $cmd_file $argv
        read --local --null cmd < $cmd_file
        rm -f $cmd_file
        eval $cmd
    else
        set -l code $status
        rm -f $cmd_file
        return $code
    end
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
