#!/bin/bash

set -e -o pipefail

some_private_function() {
  # do stuff
  echo "hello world"
}

__something() {
  # do stuff
  echo "hi"
  some_private_function
  # do other stuff
}

__something_else() {
  # do stuff
  some_private_function
  # do other stuff
}

validate_args() {
  acceptable_args="$(declare -F | sed -n "s/declare -f __//p" | tr '\n' ' ')"

  if [[ -z $1 ]]; then
    echo "Must provide an argument" 
    printf "Available commands:\n$(declare -F | sed -n "s/declare -f __/ - /p")"
    exit 1
  fi
  if [[ ! " $acceptable_args " =~ .*\ $1\ .* ]]; then
      echo "Invalid argument: $1"
      printf "Available commands:\n$(declare -F | sed -n "s/declare -f __/ - /p")"
      exit 1
  fi
}

CMD=${1:-}
shift || true
if validate_args ${CMD}; then
  __${CMD} $@
  exit 0
fi








