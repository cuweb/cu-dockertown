#!/bin/bash
cd /var/www/html
cp .env.example .env
## php artisan migrate
exec "$@"