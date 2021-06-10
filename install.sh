#!/usr/bin/env bash

TOOLS="alacritty ripgrep exa fd-find bat tealdeer starship tokei drill skim git-delta"

if [ -x ~/.cargo/bin/cargo ]; then
    for tool in $TOOLS; do
        cargo install $tool
    done
else
    echo "Cargo not installed, cannot update tools"
fi

mkdir -p ${HOME}/.config

for file in *; do
    if [[ ($file == "config") ]]; then
        for config in config/*; do
            target=$(echo $config | sed 's/config\///')
            link_name="${HOME}/.config/$target"
            if [ -e "$link_name" ]; then
                echo "Skipping $target"
            else
                ln -sv "${HOME}/dotfiles/config/$target" $link_name
            fi
        done
    elif [[ ($file != "install.sh") && ($file != "./install.sh") && ($file != "tags") ]]; then
        if [ -e "${HOME}/.${file}" ]; then
            echo "Skipping ${HOME}/.${file}"
        else
            ln -sv "${PWD}/${file}" "${HOME}/.${file}"
        fi
    fi
done
