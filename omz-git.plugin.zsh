function git_prompt_info() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    prefixLength=3
    prefix=$(command echo ${ref#refs/heads/} | cut -c ${prefixLength}) || return 0
    length=${#ref#refs/heads/}
    maxLength=$(command git config --get oh-my-zsh.max-branch-length 2>/dev/null)
    if [[ -z ${maxLength} ]]; then
      maxLength=20
    fi
    if [[ ${length} -gt ${maxLength} ]]; then
      idLength=8
      if [[ ${prefix} == "-" ]]; then
        idStart=`expr ${length} - ${idLength} + 1`
        separatorLength=3 #3 dots...
        if [[ "$(command git config --get oh-my-zsh.show-team 2>/dev/null)" != "1" ]]; then
          nameStart=`expr ${prefixLength} + 1`
          nameEnd=`expr ${maxLength} - ${idLength} - ${separatorLength} + ${prefixLength}`
        else
          nameStart=1
          nameEnd=`expr ${maxLength} - ${idLength} - ${separatorLength}`
        fi
        ref="$(command echo ${ref#refs/heads/} | cut -c ${nameStart}-${nameEnd})...$(command echo ${ref#refs/heads/} | cut -c ${idStart}-)"
      else
        ref="$(command echo ${ref#refs/heads/} | cut -c -${maxLength})"
      fi
    else
      ref="$(command echo ${ref#refs/heads/})"
    fi
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
