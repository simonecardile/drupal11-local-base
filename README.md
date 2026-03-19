# drupal11-local-base

A modern local Drupal 11 base project built with Composer and Docker.

## Stack

- Drupal 11
- PHP 8.3
- MySQL 8
- Nginx
- PHP-FPM
- Adminer

## Services

- App: http://localhost:8080
- Adminer: http://localhost:8081

## Current scope

At this stage, the project includes:

- Composer-managed Drupal 11 project
- Docker stack with nginx, php-fpm, mysql, and adminer
- persistent MySQL volume
- initial config sync directory
- Drupal installer reachable in the browser
