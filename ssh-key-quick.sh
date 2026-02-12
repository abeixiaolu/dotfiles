#!/usr/bin/env bash

set -euo pipefail

KEY_DIR="$HOME/.ssh"
KEY_PATH="$KEY_DIR/id_ed25519"
PUB_KEY_PATH="$KEY_PATH.pub"

usage() {
  cat <<'EOF'
Usage:
  ssh-key-quick.sh [email]

Examples:
  ssh-key-quick.sh
  ssh-key-quick.sh your_email@example.com
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

EMAIL="${1:-}"

mkdir -p "$KEY_DIR"
chmod 700 "$KEY_DIR"

if [[ ! -f "$KEY_PATH" ]]; then
  echo "No existing ed25519 key found. Creating one at $KEY_PATH ..."
  if [[ -n "$EMAIL" ]]; then
    ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH"
  else
    ssh-keygen -t ed25519 -f "$KEY_PATH"
  fi
elif [[ ! -f "$PUB_KEY_PATH" ]]; then
  echo "Private key exists but public key is missing. Rebuilding public key ..."
  ssh-keygen -y -f "$KEY_PATH" >"$PUB_KEY_PATH"
fi

if command -v pbcopy >/dev/null 2>&1; then
  pbcopy <"$PUB_KEY_PATH"
  echo "Public key copied to clipboard:"
  echo "$PUB_KEY_PATH"
else
  echo "pbcopy is not available. Here is your public key:"
  cat "$PUB_KEY_PATH"
fi
