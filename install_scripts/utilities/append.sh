#!/usr/bin/env bash
# append.sh can append text in a block that can be removed

# deplist
# shellcheck source=src/utilities/colors.sh
source "${DOTFILES_PATH}"/install_scripts/utilities/colors.sh
# /deplist

start="##### dotfiles edit #####"
end="##### dotfiles end edit #####"

safe() {
  if [ ! -f "${1}" ]; then
    echo -e "$(fatal) cannot append to non-existent file '$1'"
    exit 1
  fi
}

# $1 = filename
# $2-n = lines to add
append_to_file() {
  local filename="$1"
  safe "$filename"

  if ! grep -q "$start" "$filename"
  then
      # not found
      echo "" >> "${filename}"
      echo "$start" >> "${filename}"
      echo "$end" >> "${filename}"
  fi

  while test ${#} -gt 1
  do
      shift
      add "$filename" "$1"
  done
}

add() {
  local file_path=$1
  local filename=$(basename "$1")
  local text=$2


  if ! grep -q "$text" "$file_path"
  then
    mkdir -p /tmp/system_add
    local tmp=/tmp/system_add/$filename

    sed "/##### dotfiles end edit #####/i $text" "$file_path" > "$tmp" && mv "$tmp" "$file_path"
    rm -rf /tmp/system_add
  fi
}

clear() {
  local file=$(basename "$1")
  mkdir -p /tmp/system_add
  local tmp=/tmp/system_clear/$file

  sed '/'"${start}"'/,/'"${end}"'/d' "$1" > "$tmp" && mv "$tmp" "$1"
  rm -rf /tmp/system_clear
}


