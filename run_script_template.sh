#!/bin/bash

some_private_function() {
  # do stuff
  echo "hello world"
}

run_something() {
  # do stuff
  echo "hi"
  some_private_function
  # do other stuff
}

run_something_else() {
  # do stuff
  some_private_function
  # do other stuff
}

run_failure() {
  echo "I'm about to fail!"
  echo "This should be the last line of output"
  curl aslkdj
}

validate_args() {
  acceptable_args="$(declare -F | sed -n "s/declare -f run_//p" | tr '\n' ' ')"
  if [[ ! " $acceptable_args " =~ .*\ $1\ .* ]]; then
      echo "Invalid argument: $1"
      echo -e "Available commands:\n$(declare -F | sed -n "s/declare -f run_/ - /p")"
      exit 1
  fi
}

CMD=${1:-}
shift || true
if validate_args ${CMD}; then
  echo "Argument was valid, but I've got nothing to do!"
  exit 0
fi
