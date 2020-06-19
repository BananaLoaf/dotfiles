function fish_prompt --description 'Write out the prompt'
  # set stat $status

  set cwd (string replace $HOME '~' $PWD)

    printf '%s[%s] %s%s@%s %s%s %s>> ' (set_color -o blue) (date "+%H:%M:%S") (set_color -o yellow) $USER (prompt_hostname) (set_color green) $cwd (set_color normal)
end 
