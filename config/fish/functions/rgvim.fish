
function rgvim
    set choice (rg -il $argv | fzf -0 -1 --ansi --preview "bat --color=always --style=header {} | rg $argv --context 3")
    if [ $choice ]
        nvim "+/"(to_lower $argv) $choice
    end
end
