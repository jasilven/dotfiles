function fish_prompt
  set -l retc red
  test $status = 0; and set retc green

  # extra newline
  echo 

  # print root if root user
  if test "$USER" = root -o "$USER" = toor
    set_color -o red
    echo -n $USER:
  end
  set_color -o blue 

  # pwd
  echo -n $PWD 

  # git
  set prompt_git (fish_git_prompt | string trim -c ' ()')
  test -n "$prompt_git"
  if test "$prompt_git" != ""
    set_color -o yellow
    echo -n ' ' 
    echo -n $prompt_git
  end

  # New line
  echo

  # Background jobs
  set_color normal
  for job in (jobs)
    set_color $retc
    echo -n '..'
    set_color gray
    echo $job
  end

  # prompt
  set_color -o green
  echo -n ' $ '
  set_color normal
end
