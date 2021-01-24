#!/usr/bin/env bash
# system_link.sh symlinks all the files in /system

my_dir="$(dirname "$0")"
# deplist
# shellcheck source=src/utilities/arch.sh
source "$my_dir"/utilities/arch.sh
# /deplist

link_system_files() {
  local system="$DOTFILES_PATH"/system
  # shellcheck disable=SC1073
  for file in $(find system);
  do
    # ln -sv  $file $HOME/
    # 'system/' is 7 chars
    nf=${file:7}
    echo "$DOTFILES_PATH"
    echo ln -sv  "$DOTFILES_PATH"/$file $HOME/$nf
  done
}

link_system_files
