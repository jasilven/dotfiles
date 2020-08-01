#!/usr/bin/env zsh

for file in *; do
  if [[ ($file != $0) && ($file != "tags" ) ]]; then
    if [ -e  "${HOME}/.${file}" ]; then
      echo "Skipping existing ${HOME}/.${file}" 
    else
      ln -sv "${PWD}/${file}" "${HOME}/.${file}"
    fi
  fi
done
