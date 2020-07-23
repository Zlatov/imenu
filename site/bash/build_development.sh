#!/usr/bin/env bash

set -eu

cd "$(dirname "${0}")"

cd ..

yarn

mkdir -p public/assets
find ./public/assets -type f -delete
find ./public/assets -type d -not -path . | xargs -I {} rm -rf ./dist/{}

npm run build_development
