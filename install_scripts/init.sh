#!/usr/bin/env bash
# init.sh installs some basic utilities to facilitate this install.

# deplist
# shellcheck source=src/utilities/arch.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/arch.sh
# /deplist


echo "Initializing the system's package manager and dev tools"

# Remove broken repo list
sudo rm -f /etc/apt/sources.list.d/kubic.list

# Update the pkg manager — retry up to 3 times for transient mirror sync errors
# Use `if` so set -e never triggers on failure (bash never exits on `if` conditions)
echo "> $(pkg_mgmnt_update)"
_apt_update_ok=false
for _attempt in 1 2 3; do
  if sudo $(pkg_mgmnt_update); then
    _apt_update_ok=true
    break
  fi
  echo "apt-get update attempt $_attempt/3 failed; retrying in 5s..."
  sleep 5
done
if [ "$_apt_update_ok" = false ]; then
  echo "Warning: apt-get update did not fully succeed; continuing with cached index."
fi

# Install basic developer tooling
echo "> $(get_install_cmd) $(make_pkg)"
sudo $(get_install_cmd) $(make_pkg)



