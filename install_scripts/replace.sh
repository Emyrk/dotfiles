#!/usr/bin/env bash
# replace.sh symlinks replaces all the files from /system/replace
# deplist
# shellcheck source=src/utilities/colors.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/colors.sh
# /deplist

replace_system_files() {
  local subpath=$1

  # Echo lines before exec
  local dot_repl_path="$DOTFILES_PATH"/system/${subpath}
  # 'replace/' is 7 chars
  local repl_path="${HOME}/system/${subpath}"
  if [ "$subpath" = "replace" ]; then
    repl_path="${HOME}"
  fi
  mkdir -p $repl_path

  local backup_path="$HOME/system/system_backup"
  mkdir -p "$backup_path"

  # shellcheck disable=SC1073
  for file in $(find system/$subpath -mindepth 1);
  do
    local count=$((${#subpath} + 7 + 1))
    # file is system/append/filename
    local trimmed_name=${file:${count}}
    local home_file="$repl_path/${trimmed_name}"
    local ln_file="$dot_repl_path/$trimmed_name"

    if [ -f "${DOTFILES_PATH}/${file}" ]; then
      if [ -f "${home_file}" ]; then
        # File exists, backup, and append the source
        local backup="$backup_path/$trimmed_name"
        echo -e "$(warning) $home_file already exists, this will be removed "
        if [ ! -f "$backup" ]; then
          echo -e $(info) "backing up file $trimmed_name to $backup"
          mkdir -p "$backup"
          cp "$home_file" "$backup"
        fi
        rm "$home_file"
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

replace_system_files replace
replace_system_files scripts
