#!/usr/bin/env bash
# zsh.sh sets up zsh

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

if [ ! -d "$HOME/.zsh/autojump" ]
then
  git clone --depth=1 https://github.com/wting/autojump.git ~/.zsh/autojump
  python ~/.zsh/autojump/install.py
fi
