#!/usr/bin/env bash
# install.sh is run once when a new environment is configured

my_dir="$(dirname "$0")"
# deplist
# shellcheck source=src/utilities/arch.sh
source "$my_dir"/install_scripts/utilities/arch.sh
# shellcheck source=src/utilities/colors.sh
source "$my_dir"/install_scripts/utilities/colors.sh
# /deplist

set -e

# Export the dotfiles path
export DOTFILES_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
export HOME_SYSTEM_FILES=$HOME/system

run="./${my_dir}/install_scripts/utilities/run_script.sh"
script() {
  echo "./${my_dir}/install_scripts/${1}"
}

########## START #########
echo -e "$(info) Installing on OS: '$(get_arch)'"

# Init's pkg manager
# $run "$(script init.sh)"

# Symlinks
$run "$(script system_link.sh)"

# appends
$run "$(script append.sh)"


$run "$(script fail.sh)"

