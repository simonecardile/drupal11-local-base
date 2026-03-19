#!/usr/bin/env bash
set -euo pipefail

docker compose exec php vendor/bin/drush config:import -y
docker compose exec php vendor/bin/drush cache:rebuild -y
