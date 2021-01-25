#!/usr/bin/env bash
my_dir=$(realpath "$DOTFILES_PATH/$(dirname "$0")")

# deplist
# shellcheck source=src/utilities/colors.sh
source "$my_dir"/colors.sh
# /deplist

#run() {
  echo -e "$(new_script) Running $(realpath "$1")"
  (
    set -e
    source $1
  )
  exit_code=$?

  if [ "$exit_code" -eq 0 ]; then
    echo -e "$(success) $(realpath "$1")"
  else
    echo -e "$(fatal) $(realpath "$1")"
    exit 1
  fi
#}
