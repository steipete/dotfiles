#!/bin/bash
# The first j --add must store the directory when ~/.j does not exist yet.
set -eu
root=$(cd "$(dirname "$0")/.." && pwd)
home=$(mktemp -d)
dir=$(mktemp -d)
export HOME="$home"
export PROMPT_COMMAND=""
# shellcheck disable=SC1091
source "$root/.bashrc"
# Interactive shells do not use set -e. Without it, a missing ~/.j makes
# awk fail and the empty temp file is still installed.
set +e
j --add "$dir"
status=$?
set -e
if [ -f "$HOME/.j" ]; then
  got=$(cat "$HOME/.j")
else
  got=""
fi
want="${dir}|1"
if [ "$status" -ne 0 ] || [ "$got" != "$want" ]; then
  echo "j --add status $status stored [$got], want [$want]" >&2
  exit 1
fi
echo "ok"
