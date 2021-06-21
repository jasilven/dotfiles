
function ds
    set -l cid (docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')
    [ -n "$cid" ] && docker stop "$cid"
end
