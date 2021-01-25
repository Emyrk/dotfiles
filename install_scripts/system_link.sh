#!/usr/bin/env bash
# system_link.sh symlinks all the files in /system

my_dir="$(dirname "$0")"
# deplist
# shellcheck source=src/utilities/arch.sh
source "$my_dir"/arch.sh
# shellcheck source=src/utilities/colors.sh
source "$my_dir"/colors.sh
# /deplist

link_system_files() {
  # Echo lines before exec
  local system="$DOTFILES_PATH"/system
  # 'system/' is 7 chars
  local sys_path="$HOME_SYSTEM_FILES"
  mkdir -p "$sys_path/system"

  # shellcheck disable=SC1073
  for file in $(find system/system -mindepth 1);
  do
    local nf=${file:7}
    local new_loc="$sys_path"/$nf
    if [ -f "${DOTFILES_PATH}/${file}" ]; then
      if [ -f "${new_loc}" ]; then
        echo -e "$(warning) $new_loc already exists, cannot soft link from $DOTFILES_PATH"/"$file "
      else
        ( # Print out statements before exec
          set -x
          ln -sv "$DOTFILES_PATH"/"$file" "$new_loc"
        )
      fi
    else
      ( # Print out statements before exec
        set -x
        mkdir -p "$HOME/$nf"
      )
    fi
  done
}

link_system_files
