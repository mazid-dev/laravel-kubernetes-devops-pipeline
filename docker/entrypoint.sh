#!/bin/sh
set -e

echo "Caching configuration and routes..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

if [ ! -f "/var/www/html/database/database.sqlite" ]; then
    touch /var/www/html/database/database.sqlite
fi

echo "Starting Supervisor..."
exec /usr/bin/supervisord -c /etc/supervisord.conf