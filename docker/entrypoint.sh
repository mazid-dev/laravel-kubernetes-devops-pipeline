#!/bin/sh
set -e

echo "Caching configuration and routes..."
php artisan config:cache
php artisan route:cache

# view:cache শুধুমাত্র তখনই চালাবো যদি resources/views ফোল্ডার থাকে
if [ -d "/var/www/html/resources/views" ]; then
    echo "resources/views found, caching views..."
    php artisan view:cache
else
    echo "resources/views not found, skipping view:cache"
fi

if [ ! -f "/var/www/html/database/database.sqlite" ]; then
    touch /var/www/html/database/database.sqlite
fi

echo "Starting Supervisor..."
exec /usr/bin/supervisord -c /etc/supervisord.conf