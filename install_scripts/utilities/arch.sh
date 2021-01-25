#!/usr/bin/env bash
# Checking if a var is set
# https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash

# Returns one: ['arch', 'debian']
# TODO: Probably check $ID for 'arch' or something
get_arch() {
  source /etc/os-release
  # Ubuntu stores it's arch in ID_LIKE
  if [ -z ${ID_LIKE+x} ];
   then
     # Not on an ubuntu system
     echo "$ID";
   else
     # Variable is set
     echo "$ID_LIKE";
  fi
}

pkg_mgmnt_update() {
  local arch=$(arch_arg $1)
  case $arch in
    arch)
      echo "pacman --noconfirm -Syyu"
      ;;

    debian)
      echo "apt-get update -y"
      ;;
  esac
}

make_pkg() {
  local arch=$(arch_arg $1)
    case $arch in
    arch)
      echo "base-devel"
      ;;

    debian)
      echo "build-essential"
      ;;
  esac
}

get_install_cmd() {
  local arch=$(arch_arg $1)
  case $arch in
    arch)
      echo "pacman --noconfirm -Sy"
      ;;

    debian)
      echo "apt-get install -y"
      ;;
  esac
}

# arch_arg returns the current arch based on the first param
arch_arg() {
  local arch=$1
  # If no params, use the get_arch value
  if [ -z ${1+x} ];
    then
      arch=$(get_arch)
  fi
  echo $arch
}
