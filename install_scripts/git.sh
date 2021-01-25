#!/usr/bin/env bash
# Sets up some git settings

(
  set -x
  git config --global url.ssh://git@github.com/.insteadOf https://github.com/
  git config --global user.name "Steven Masley"
  git config --global user.email "stevenmasley@coder.com"
  git config --global pull.ff only
)


# TODO: Setup meld
# TODO: Setup some git hooks
