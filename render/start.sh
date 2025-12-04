#!/bin/bash

# Start PHP-FPM
php-fpm &

# Start nginx
nginx -g "daemon off;"

 #!/usr/bin/env bash
set -e

cd /var/www/html || exit 1

mkdir -p var/page_cache var/cache var/session var/log generated pub/static pub/media

chown -R www-data:www-data var generated pub/static pub/media || true

find var generated pub/static pub/media -type d -exec chmod 775 {} \; || true
find var generated pub/static pub/media -type f -exec chmod 664 {} \; || true

# daarna pas php-fpm + nginx starten
php-fpm -D
nginx -g 'daemon off;'

