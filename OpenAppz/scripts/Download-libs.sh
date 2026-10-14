#!/usr/bin/env bash
set -euo pipefail

DEST="OpenAppz/app/src/main/assets/libs"
mkdir -p "$DEST"

download() {
  echo "Downloading $1"
  curl -fsSL --retry 3 "$2" -o "$DEST/$1"
}

download react.min.js     "https://cdn.jsdelivr.net/npm/react@18.3.1/umd/react.production.min.js"
download react-dom.min.js "https://cdn.jsdelivr.net/npm/react-dom@18.3.1/umd/react-dom.production.min.js"
download chart.min.js     "https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"
