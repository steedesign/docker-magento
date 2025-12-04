#!/bin/bash

# Start PHP-FPM
php-fpm &

# Start nginx
nginx -g "daemon off;"
