#!/bin/bash

# Show what we execute
set -x

# MySQL authentication
MYSQLAUTH="--user=$MYSQL_USER --password=$MYSQL_PASSWORD"

# Wait for MySQL to come up.
until mysql $MYSQLAUTH -e ""; do
    echo "Failed to connect to MySQL - retrying..."
    sleep 1
done

mysql $MYSQLAUTH -e "CREATE DATABASE IF NOT EXISTS magento2"

cd /var/www/magento2/htdocs

bin/magento sampledata:deploy
php /var/www/magento2/composer.phar update

bin/magento setup:install \
	        --db-host=mysql \
		--db-name=magento2 \
		--db-user="$MYSQL_USER" \
		--db-password="$MYSQL_PASSWORD" \
		--backend-frontname=admin \
		--base-url=http://$PUBLIC_HOST/ \
		--admin-lastname=Doe \
		--admin-firstname=John \
		--admin-email=john@doe.com \
		--admin-user=admin \
		--admin-password=password123 \
		--language=en_US \
                --currency=USD  \
                --timezone=America/Chicago \
                --use-rewrites=1

# Check permissions again
find . -type d -exec chmod 770 {} \; && find . -type f -exec chmod 660 {} \; && chmod u+x bin/magento

# reindex and flush the cache
bin/magento indexer:reindex
bin/magento cache:clean
bin/magento cache:flush
bin/magento setup:static-content:deploy

chown www-data:www-data -R /var/www/magento2

# Run the web server
exec /usr/sbin/apache2 -D FOREGROUND
