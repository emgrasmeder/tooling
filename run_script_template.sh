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

CMD=${1:-}
shift || true
if run_${CMD}; then
  exit 0
else 
  echo -e "Available commands:\n$(declare -F | sed -n "s/declare -f run_/ - /p")"
fi 2>/dev/null
