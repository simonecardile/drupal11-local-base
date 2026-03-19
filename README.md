# drupal11-local-base

A modern local Drupal 11 base project built with Composer and Docker.

## Stack

- Drupal 11
- PHP 8.3
- MySQL 8
- Nginx
- PHP-FPM
- Adminer
- Drush

## Services

- App: http://localhost:8080
- Adminer: http://localhost:8081

## Current scope

At this stage, the project includes:

- Composer-managed Drupal 11 project
- Docker stack with nginx, php-fpm, mysql, and adminer
- persistent MySQL volume
- Drush installed as a project dependency
- Admin Toolbar installed as a contrib module
- config sync directory configured in `settings.php`
- initial configuration export workflow in `config/sync`

## Notes

- Drupal 11 is Composer-first
- the web root is `/web`
- site configuration can be exported to `config/sync`
- contrib modules are installed with Composer and then enabled in Drupal
