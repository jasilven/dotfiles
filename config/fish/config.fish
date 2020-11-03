set PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $PATH
export PATH

starship init fish | source

function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end
