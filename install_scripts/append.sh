#!/usr/bin/env bash
# append.sh symlinks all the files in /system/append
# and appends text to $HOME/file

# deplist
# shellcheck source=src/utilities/arch.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/arch.sh
# shellcheck source=src/utilities/append.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/append.sh
# /deplist

append_system_files() {
  # Echo lines before exec
  local dot_app_path="$DOTFILES_PATH"/system/append
  # 'append/' is 7 chars
  local app_path="${HOME_SYSTEM_FILES}/append"
  local backup_path="$HOME/system/system_backup"
  mkdir -p "$backup_path"
  mkdir -p "$app_path"

  # shellcheck disable=SC1073
  for file in $(find system/append -mindepth 1);
  do
    # file is system/append/filename
    local trimmed_name=${file:14}
    local home_file="$HOME/${trimmed_name}"
    # ln file is the git tracked file
    local ln_file="$dot_app_path/${trimmed_name}"
    if [ -f "${ln_file}" ]; then
      # Is a file
      if [ -f "${home_file}" ]; then
        # File exists, backup, and append the source
        local backup="$backup_path/$trimmed_name"
        if [ ! -f "$backup" ]; then
          echo -e $(info) "backing up file $trimmed_name to $backup"
          cp "$home_file" "$backup"
        fi
        ( # Print out statements before exec
          set -x
          append_to_file "$home_file" "source $ln_file"
        )
      else
        echo -e "$(info) $home_file does not exist, going to create it now"
        touch "$home_file"
        ( # Print out statements before exec
          set -x
          append_to_file "$home_file" "source $ln_file"
        )
      fi
    else
      # Make the directory in $HOME
      ( # Print out statements before exec
        set -x
        mkdir -p "$home_file"
      )
    fi
  done
}

append_system_files
