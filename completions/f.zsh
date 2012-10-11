if [[ ! -o interactive ]]; then
    return
fi

compctl -K _f f

_f() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(f commands)"
  else
    completions="$(f completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
