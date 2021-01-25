#!/usr/bin/env bash
# zsh.sh sets up zsh

my_dir="$(dirname "$0")"
# deplist
# shellcheck source=src/utilities/arch.sh
source "$my_dir"/arch.sh
# shellcheck source=src/utilities/colors.sh
source "$my_dir"/colors.sh
# /deplist

# p10k theme
if [ ! -d "$HOME/.zsh/powerlevel10k" ]
then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
fi

if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]
then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi


if [ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]
then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi