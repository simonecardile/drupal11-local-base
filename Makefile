SHELL := /bin/bash

.PHONY: help bootstrap build up down restart reset-db fix-permissions logs logs-php logs-nginx logs-mysql logs-adminer ps shell-php shell-mysql composer drush-status drush-cr config-export config-import site-uuid

help:
	@echo "Available commands:"
	@echo "  make bootstrap        - prepare local environment and start containers"
	@echo "  make build            - build containers"
	@echo "  make up               - start the stack"
	@echo "  make down             - stop and remove containers"
	@echo "  make restart          - restart services"
	@echo "  make reset-db         - remove containers and database volume, then rebuild"
	@echo "  make fix-permissions  - fix Drupal runtime permissions"
	@echo "  make logs             - show all logs"
	@echo "  make logs-php         - show php logs"
	@echo "  make logs-nginx       - show nginx logs"
	@echo "  make logs-mysql       - show mysql logs"
	@echo "  make logs-adminer     - show adminer logs"
	@echo "  make ps               - show compose service status"
	@echo "  make shell-php        - open a shell in php container"
	@echo "  make shell-mysql      - open a shell in mysql container"
	@echo "  make composer         - show composer version"
	@echo "  make drush-status     - show drush status"
	@echo "  make drush-cr         - rebuild Drupal caches"
	@echo "  make config-export    - export Drupal config to config/sync"
	@echo "  make config-import    - import Drupal config from config/sync"
	@echo "  make site-uuid        - print Drupal site UUID"

bootstrap:
	./scripts/bootstrap.sh

build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart

reset-db:
	./scripts/reset-db.sh

fix-permissions:
	./scripts/fix-permissions.sh

logs:
	docker compose logs --tail=200

logs-php:
	docker compose logs --tail=200 php

logs-nginx:
	docker compose logs --tail=200 nginx

logs-mysql:
	docker compose logs --tail=200 mysql

logs-adminer:
	docker compose logs --tail=200 adminer

ps:
	docker compose ps

shell-php:
	docker compose exec php bash

shell-mysql:
	docker compose exec mysql bash

composer:
	docker compose exec php composer --version

drush-status:
	docker compose exec php vendor/bin/drush status

drush-cr:
	docker compose exec php vendor/bin/drush cache:rebuild -y

config-export:
	./scripts/export-config.sh

config-import:
	./scripts/import-config.sh

site-uuid:
	docker compose exec php vendor/bin/drush config:get system.site uuid
