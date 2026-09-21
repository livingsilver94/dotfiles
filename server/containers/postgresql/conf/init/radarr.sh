#!/bin/bash
set -e

password=$(cat /run/secrets/radarr_postgres_password)
psql -v ON_ERROR_STOP=1 -v radarr_password "$password" -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
    CREATE USER radarr WITH PASSWORD :'radarr_password';
    CREATE DATABASE "radarr-main" OWNER radarr;
    CREATE DATABASE "radarr-log" OWNER radarr;
EOSQL
