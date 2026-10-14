#!/usr/bin/env bash
set -euo pipefail

DEST="$(dirname "$0")/app/src/main/assets/libs"
mkdir -p "$DEST"

# name|url (pin exact versions)
LIBS=(
  "react.min.js|https://cdn.jsdelivr.net/npm/react@18.3.1/umd/react.production.min.js"
  "react-dom.min.js|https://cdn.jsdelivr.net/npm/react-dom@18.3.1/umd/react-dom.production.min.js"
  "chart.min.js|https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"
)

for entry in "${LIBS[@]}"; do
  name="${entry%%|*}"; url="${entry#*|}"
  echo "Downloading $name"
  curl -fsSL --retry 3 "$url" -o "$DEST/$name"
done
echo "Done: $DEST"
