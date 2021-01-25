#!/usr/bin/env bash
# pkg.sh installs packages to use!.

# deplist
# shellcheck source=src/utilities/arch.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/arch.sh
# shellcheck source=src/utilities/colors.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/colors.sh
# /deplist


# packages to install
pkgs=(
  "zsh"
  "curl"
  "autojump"
)


# TODO: Probably install all in 1 cmd?
echo -e "$(info) Installing packages"
for pkg in "${pkgs[@]}"; do
  echo "> $(get_install_cmd) $pkg"
  sudo $(get_install_cmd) $pkg
done



