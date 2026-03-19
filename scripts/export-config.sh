#!/usr/bin/env bash
set -euo pipefail

docker compose exec php vendor/bin/drush config:export -y
docker compose exec php vendor/bin/drush cache:rebuild -y
