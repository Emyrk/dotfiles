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
  "python2"
  "python3"
)

if [ ! -f "/usr/bin/syncthing"]; then
  # TODO: only if deb
  sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
  echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
  echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
  sudo apt-get update
  sudo apt-get install syncthing
fi

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

if [ ! -f "/usr/local/bin/kubecolor" ]; then
  wget https://github.com/hidetatz/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Linux_x86_64.tar.gz -O /tmp/kubecolor.tar.gz
  tar -C /tmp -zxvf /tmp/kubecolor.tar.gz kubecolor
  chmod +x /tmp/kubecolor
  sudo mv /tmp/kubecolor /usr/local/bin/kubecolor
fi

if [ ! -f "$HOME/.local/share/pnpm/pnpm" ]; then
  curl -fsSL https://get.pnpm.io/install.sh | sh -
fi
