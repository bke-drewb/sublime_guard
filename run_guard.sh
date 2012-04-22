#!/bin/bash

# Normally I would have the set -e here but rvm when loaded as function isn't compatible with set -e
set -e

function run_guard() {
  printf "Running 'bundle exec guard'. All output/failures from this point on is from the 'bundle exec guard' command.\n\n"
  cd "$1" && bundle exec guard
}

# If you install this fork, you're using rbenv. I assume you installed it in your
# home directory.
export PATH=~/.rbenv/bin:$PATH

eval "$(rbenv init -)"
echo "Starting Guard for $1"

run_guard "$1"