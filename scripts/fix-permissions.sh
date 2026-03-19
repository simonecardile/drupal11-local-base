#!/usr/bin/env bash
set -euo pipefail

mkdir -p web/sites/default/files
touch web/sites/default/files/.gitkeep

if [ -f web/sites/default/settings.php ]; then
  chmod 644 web/sites/default/settings.php || true
fi

chmod 777 web/sites/default/files || true
