#!/bin/sh
set -e

echo "Creating Laravel cache directories..."
mkdir -p /var/www/html/storage/framework/views \
         /var/www/html/storage/framework/cache \
         /var/www/html/storage/framework/sessions \
         /var/www/html/bootstrap/cache

echo "Setting permissions for www-data (UID 82)..."
chown -R 82:82 /var/www/html/storage /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

if [ ! -f "/var/www/html/database/database.sqlite" ]; then
    touch /var/www/html/database/database.sqlite
    chown 82:82 /var/www/html/database/database.sqlite
fi

echo "Caching configuration and routes..."
php artisan config:cache
php artisan route:cache

# php artisan view:cache   # temporarily disabled

echo "Starting Supervisor..."
exec /usr/bin/supervisord -c /etc/supervisord.conf