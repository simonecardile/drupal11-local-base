# drupal11-local-base

A modern local Drupal 11 base project built with Composer and Docker.

## Goal

This repository is a learning and reference project for a modern Drupal setup.

It focuses on:

- Drupal 11 local development
- Composer-managed project structure
- Docker-based local runtime
- MySQL persistence
- contrib module installation through Composer
- Drupal configuration export and import workflow

## Stack

- Drupal 11
- PHP 8.3
- Nginx
- PHP-FPM
- MySQL 8
- Adminer
- Drush

## Services

- App: http://localhost:8080
- Adminer: http://localhost:8081

## Database credentials

- Database: `drupal11`
- Username: `drupal`
- Password: `drupal`
- Host: `mysql`
- Port: `3306`

## Project structure

```text
drupal11-local-base/
├─ config/
│  └─ sync/
├─ docker/
│  ├─ nginx/
│  │  └─ default.conf
│  └─ php/
│     ├─ Dockerfile
│     └─ php.ini
├─ scripts/
│  ├─ bootstrap.sh
│  ├─ export-config.sh
│  ├─ fix-permissions.sh
│  ├─ import-config.sh
│  └─ reset-db.sh
├─ web/
├─ .dockerignore
├─ .env.example
├─ .gitignore
├─ compose.yaml
├─ composer.json
├─ composer.lock
├─ Makefile
└─ README.md
```

## Modern Drupal structure

This project uses the recommended modern Drupal structure:

- the project root contains `composer.json`, `vendor/`, Docker files, and project-level tooling
- the web root is `web/`
- Drupal core is installed under `web/core`
- public files are stored under `web/sites/default/files`
- exported configuration is stored in `config/sync`

## Why Composer matters

In modern Drupal, Composer is the standard way to:

- create the project
- install Drupal core
- install contributed modules and themes
- manage third-party PHP dependencies
- keep package versions aligned

## Contrib module example

This project includes a contributed module installed with Composer:

- Admin Toolbar

It was required through Composer and then enabled in Drupal.

## Configuration management

This project is configured to store synchronized configuration in:

```php
$settings['config_sync_directory'] = '../config/sync';
```

Configuration can be exported from the active site to YAML files and imported back into the site.

## Important note about configuration import

A full configuration import is intended for copies of the same site.

For successful import, the target site must have a matching site UUID.

## Local setup

### 1. Create the local environment file

```bash
cp .env.example .env
```

### 2. Build and start the stack

```bash
make bootstrap
```

### 3. Open the application

- App: http://localhost:8080
- Adminer: http://localhost:8081

## Useful commands

### Start and stop

```bash
make up
make down
make restart
```

### Build

```bash
make build
```

### Reset database volume

```bash
make reset-db
```

### Fix permissions

```bash
make fix-permissions
```

### Logs

```bash
make logs
make logs-php
make logs-nginx
make logs-mysql
make logs-adminer
```

### Shell access

```bash
make shell-php
make shell-mysql
```

### Composer and Drush

```bash
make composer
make drush-status
make drush-cr
```

### Configuration management

```bash
make config-export
make config-import
make site-uuid
```

## What this repository teaches

- how a modern Drupal project is structured
- why Composer is central in Drupal 10/11
- how to run Drupal with Docker using nginx, php-fpm, and mysql
- how to install contrib modules with Composer
- how to use Drush in a real project
- how to export configuration to YAML
- how to think about config sync and site UUID

## Drupal 7 vs Drupal 11

### Drupal 7
- typically less Composer-centric
- older project structure
- less formalized configuration workflow
- contributed modules often managed manually

### Drupal 11
- Composer-first
- `/web` as document root in the recommended template
- Drush integrated into the project workflow
- configuration export/import is part of the standard development model

## Disclaimer

This repository is intended for local learning and modern Drupal practice.
It is not a production-ready deployment template.
