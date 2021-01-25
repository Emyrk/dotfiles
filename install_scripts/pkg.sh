#!/usr/bin/env bash
# pkg.sh installs packages to use!.
my_dir=$(realpath "$DOTFILES_PATH/$(dirname "$0")")

# deplist
# shellcheck source=src/utilities/arch.sh
source "$my_dir"/arch.sh
# shellcheck source=src/utilities/colors.sh
source "$my_dir"/colors.sh
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



