#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

ARCHIVE="images/headscale-stack.tar.gz"
if [[ ! -f "$ARCHIVE" ]]; then
  echo "Missing $ARCHIVE" >&2
  exit 1
fi

echo "Loading Docker images from $ARCHIVE ..."
docker load -i "$ARCHIVE"

echo "Starting stack..."
docker compose up -d

echo
echo "Done."
echo "  UI:  http://SERVER_IP:3000"
echo "  API: http://SERVER_IP:8080"
echo
echo "Important: edit config/*.yaml and set server_url / base_url / public_url"
echo "to your real server IP or domain, then run: docker compose up -d"
