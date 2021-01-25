#!/usr/bin/env bash
my_dir="$(dirname "$0")"
# deplist
# shellcheck source=src/utilities/colors.sh
source "$my_dir"/colors.sh
# /deplist

#run() {
  echo -e "$(new_script) Running $1"
  (
    set -e
    source $1
  )
  exit_code=$?

  if [ "$exit_code" -eq 0 ]; then
    echo -e "$(success) $1"
  else
    echo -e "$(fatal) $1"
    exit 1
  fi
#}
