#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd' | sed "s|^$HOME/||" | sed 's|^Dev/|👩🏾‍💻/|')
model=$(echo "$input" | jq -r '.model.display_name')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

purple='\033[38;5;135m'
reset='\033[0m'

if [ -n "$used" ]; then
  pct=$(printf '%.0f' "$used")
  filled=$(( pct / 10 ))
  empty=$(( 10 - filled ))
  bar=""
  i=0
  while [ $i -lt $filled ]; do
    bar="${bar}█"
    i=$(( i + 1 ))
  done
  i=0
  while [ $i -lt $empty ]; do
    bar="${bar}░"
    i=$(( i + 1 ))
  done
  printf "${purple}%s  %s  [%s] %s%%${reset}\n" "$cwd" "$model" "$bar" "$pct"
else
  printf "${purple}%s  %s${reset}\n" "$cwd" "$model"
fi
