#!/bin/sh
# Downloads the JS libraries so the app works offline. Run once, with internet.
set -e
cd "$(dirname "$0")"

L=app/src/main/assets/lib
mkdir -p "$L"

curl -fL --retry 3 -o "$L/three.min.js" \
  https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js

curl -fL --retry 3 -o "$L/OrbitControls.js" \
  https://cdn.jsdelivr.net/npm/three@0.128.0/examples/js/controls/OrbitControls.js

curl -fL --retry 3 -o "$L/jscad-modeling.min.js" \
  https://cdn.jsdelivr.net/npm/@jscad/modeling@2.12.3/dist/jscad-modeling.min.js

for f in three.min.js OrbitControls.js jscad-modeling.min.js; do
  [ -s "$L/$f" ] || { echo "Missing or empty: $f"; exit 1; }
done

echo "Libraries downloaded."
