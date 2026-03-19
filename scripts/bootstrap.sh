#!/usr/bin/env bash
set -euo pipefail

if [ ! -f .env ]; then
  cp .env.example .env
fi

mkdir -p web/sites/default/files
touch web/sites/default/files/.gitkeep

if [ ! -f web/sites/default/settings.php ]; then
  cp web/sites/default/default.settings.php web/sites/default/settings.php
fi

chmod 644 web/sites/default/settings.php || true
chmod 777 web/sites/default/files || true

docker compose build
docker compose up -d
