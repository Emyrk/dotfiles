#!/usr/bin/env bash
# install.sh is run once when a new environment is configured
# Export the dotfiles path
export DOTFILES_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
export HOME_SYSTEM_FILES=$HOME/system

echo -e "Running install from '${my_dir}'"

# Ensure we have GitHub's host key, because all clones are over SSH (enforced by
# /etc/gitconfig)
if ! ssh-keygen -F github.com > /dev/null; then
  ssh-keyscan github.com >> ~/.ssh/known_hosts 2> /dev/null
fi


# deplist
# shellcheck source=src/utilities/arch.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/arch.sh
# shellcheck source=src/utilities/colors.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/colors.sh
# /deplist

set -e


run="${DOTFILES_PATH}/install_scripts/utilities/run_script.sh"
script() {
  echo "${DOTFILES_PATH}/install_scripts/${1}"
}

########## START #########
echo -e "$(info) Installing on OS: '$(get_arch)'"
#$run "$(script fail.sh)"

# Clear ~/system
rm -rf ~/system

# Init's pkg manager
$run "$(script init.sh)"

# Symlinks
$run "$(script system_link.sh)"

# appends
$run "$(script append.sh)"

# replaces
$run "$(script replace.sh)"

# git configs
$run "$(script git.sh)"

# install packages
$run "$(script pkg.sh)"

# setup zsh
$run "$(script zsh.sh)"

#$run "$(script fail.sh)"

sudo chsh $USER -s /usr/bin/zsh

