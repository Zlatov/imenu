#!/usr/bin/env bash

set -eu

cd "$(dirname "${0}")"

cd ../..

# Для первой проверки:
# bundle exec cap production deploy:check

bundle exec cap production deploy
