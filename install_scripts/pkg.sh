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
  "python"
)


# TODO: Probably install all in 1 cmd?
echo -e "$(info) Installing packages"
for pkg in "${pkgs[@]}"; do
  echo "> $(get_install_cmd) $pkg"
  sudo $(get_install_cmd) $pkg
done


# Ignore any error
sudo update-alternatives --install /usr/local/bin/gofmt gofmt /usr/local/goboring/bin/gofmt 100 || true

# Some manual binaries
# cloud_proxy :: https://cloud.google.com/sql/docs/postgres/quickstart-proxy-test#linux-64-bit
if [ ! -f "/usr/local/bin/cloud_sql_proxy" ]; then
  wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /tmp/cloud_sql_proxy
  chmod +x /tmp/cloud_sql_proxy
  sudo mv /tmp/cloud_sql_proxy /usr/local/bin/cloud_sql_proxy
fi


