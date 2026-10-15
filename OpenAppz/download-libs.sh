#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${DEST:-$DIR/libs}"
mkdir -p "$DEST"

LIBS=(
  "react.min.js|https://cdn.jsdelivr.net/npm/react@18.2.0/umd/react.production.min.js"
  "react-dom.min.js|https://cdn.jsdelivr.net/npm/react-dom@18.2.0/umd/react-dom.production.min.js"
  "chart.min.js|https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"
)

for entry in "${LIBS[@]}"; do
  name="${entry%%|*}"
  url="${entry#*|}"
  echo "Downloading $name from $url"
  curl -fsSL --retry 3 --connect-timeout 10 "$url" -o "$DEST/$name"
done

echo "Done: $DEST"
