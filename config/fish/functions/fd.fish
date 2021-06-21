function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and exa -l
    else
        builtin cd ~; and exa -l
    end
end
