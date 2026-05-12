#!/bin/sh
set -e

echo "Caching configuration and routes..."
php artisan config:cache
php artisan route:cache

# view:cache temporarily disabled – causes error in current environment
# php artisan view:cache

if [ ! -f "/var/www/html/database/database.sqlite" ]; then
    touch /var/www/html/database/database.sqlite
fi

echo "Starting Supervisor..."
exec /usr/sbin/supervisord -c /etc/supervisord.conf