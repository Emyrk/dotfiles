#!/usr/bin/env bash
# colors can color output!
# must 'echo -e $(bold TEXT)
# https://misc.flogisoft.com/bash/tip_colors_and_formatting

format() {
  code=$1
  text=$2
  echo "\033[${code}m${2}\033[0m"
}

warning() {
  echo "$(format "1;33" WARNING):"
}

info() {
  echo "$(format "1;36" INFO):"
}

fatal() {
  echo "$(format "1;91" FATAL):"
}

success() {
  echo "$(format "1;92" SUCCESS):"
}

new_script() {
  echo "$(format "1;95" SCRIPT):"
}

bold() {
  echo $(format 1 $1)
}

yellow() {
  echo $(format 33 $1)
}
