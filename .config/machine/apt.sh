#!/usr/bin/env bash
set -euo pipefail

PKG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/machine/apt.packages"

if [[ ! -f "$PKG_FILE" ]]; then
  echo "apt.sh: missing package list: $PKG_FILE" >&2
  exit 1
fi

sudo apt update
# Read packages ignoring blank lines and comments
grep -vE '^\s*(#|$)' "$PKG_FILE" | xargs -r sudo apt install -y

