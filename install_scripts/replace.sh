#!/usr/bin/env bash
# replace.sh symlinks replaces all the files from /system/replace

my_dir="$(dirname "$0")"
# deplist
# shellcheck source=src/utilities/arch.sh
source "$my_dir"/arch.sh
# shellcheck source=src/utilities/colors.sh
source "$my_dir"/colors.sh
# /deplist

link_system_files() {
  # Echo lines before exec
  local dot_repl_path="$DOTFILES_PATH"/system/replace
  # 'replace/' is 7 chars
  local repl_path="${HOME}"
  local backup_path="$HOME/system/system_backup"
  mkdir -p "$backup_path"

  # shellcheck disable=SC1073
  for file in $(find system/replace -mindepth 1);
  do
    # file is system/append/filename
    local trimmed_name=${file:14}
    local home_file="$HOME/${trimmed_name}"
    local ln_file="$dot_repl_path/$trimmed_name"

    local new_loc="$sys_path"/$nf
    if [ -f "${DOTFILES_PATH}/${file}" ]; then
      if [ -f "${home_file}" ]; then
        # File exists, backup, and append the source
        local backup="$backup_path/$trimmed_name"
        echo -e "$(warning) $home_file already exists, backing up and removing "
        if [ ! -f "$backup" ]; then
          echo -e $(info) "backing up file $trimmed_name to $backup"
          cp "$home_file" "$backup"
          rm "$home_file"
        fi
      fi
      ( # Print out statements before exec
        set -x
        ln -sv "$ln_file" "$home_file"
      )
    else
      ( # Print out statements before exec
        set -x
        mkdir -p "$home_file"
      )
    fi
  done
}

link_system_files
