#!/bin/sh
# Downloads the three JS libraries so the app works offline. Run once, with internet.
set -e
L=app/src/main/assets/lib
mkdir -p $L
curl -fL -o $L/three.min.js https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js
curl -fL -o $L/jscad-modeling.min.js https://cdn.jsdelivr.net/npm/@jscad/modeling@2.12.3/dist/jscad-modeling.min.js
echo "Libraries downloaded."
