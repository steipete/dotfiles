#!/bin/bash
# j must not turn "src/bin" into /bin.
set -eu
root=$(cd "$(dirname "$0")/.." && pwd)
work=$(mktemp -d)
home=$(mktemp -d)
mkdir -p "$work/src/bin"
printf '%s\n' "$work/src/bin|50" > "$home/.j"
export HOME="$home"
export PROMPT_COMMAND=""
# shellcheck disable=SC1091
source "$root/.bashrc"
cd "$work"
j src/bin
got=$(pwd -P)
want=$(cd "$work/src/bin" && pwd -P)
if [ "$got" != "$want" ]; then
  echo "j src/bin landed in $got, want $want" >&2
  exit 1
fi
cd "$work"
j /bin
if [ "$(pwd -P)" != "$(cd /bin && pwd -P)" ]; then
  echo "j /bin landed in $(pwd -P)" >&2
  exit 1
fi
echo "ok"
