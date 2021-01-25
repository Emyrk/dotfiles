#!/usr/bin/env bash
# deplist
# shellcheck source=src/utilities/colors.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/colors.sh
# /deplist


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

