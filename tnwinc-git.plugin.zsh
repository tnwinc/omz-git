function git_prompt_info() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    prefix=$(command echo ${ref#refs/heads/} | cut -c 3) || ""
    length=${#ref#refs/heads/}
    if [[ ${length} -gt 20 ]]; then
      if [[ ${prefix} == "-" ]]; then
        start=`expr ${length} - 7`
        ref="$(command echo ${ref#refs/heads/} | cut -c 4-14)...$(command echo ${ref#refs/heads/} | cut -c ${start}-)" || ""
      else
        ref="$(command echo ${ref#refs/heads/} | cut -c -20)" || ""
      fi
    else
      ref="$(command echo ${ref#refs/heads/})" || ""
    fi
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
