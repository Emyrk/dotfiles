#!/usr/bin/env bash
# init.sh installs some basic utilities to facilitate this install.

# deplist
# shellcheck source=src/utilities/arch.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/arch.sh
# /deplist


echo "Initializing the system's package manager and dev tools"

# Update the pkg manager
echo "> $(pkg_mgmnt_update)"
sudo $(pkg_mgmnt_update)

# Install basic developer tooling
echo "> $(get_install_cmd) $(make_pkg)"
sudo $(get_install_cmd) $(make_pkg)



