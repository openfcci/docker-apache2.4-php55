#!/bin/bash
#chown www-data:www-data /var/www/html -R

if [ "$ALLOW_OVERRIDE" = "**False**" ]; then
    unset ALLOW_OVERRIDE
else
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
    a2enmod rewrite
fi

export ENVIRONMENT=docker
source /etc/apache2/envvars
apachectl configtest
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND
