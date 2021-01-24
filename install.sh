#!/usr/bin/env bash
# install.sh is run once when a new environment is configured

# Export the dotfiles path
export DOTFILES_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

my_dir="$(dirname "$0")"
source "$my_dir"/install_scripts/utilities/arch.sh

arch=$(get_arch)

# Pause the script on any error
set -e

# Init's pkg manager
#./"$my_dir"/install_scripts/init.sh
# Symlinks
./"$my_dir"/install_scripts/system_link.sh
