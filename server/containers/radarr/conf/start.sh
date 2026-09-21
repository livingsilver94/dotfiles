#!/bin/sh

password=$(cat /run/secrets/radarr_postgres_password)
sed "s|__RADARR_POSTGRES_PASSWORD__|${password}|" /config/config.xml > /tmp/config.xml
cp /tmp/config.xml /config/config.xml && rm /tmp/config.xml
exec /init "$@"
