#!/bin/bash

source export-database-variables.sh

wait-for-it -t 0 "$DATASTORE_DATABASE_HOST:$DATASTORE_DATABASE_PORT"

# Create schema in postgresql
export PGPASSWORD="$DATASTORE_DATABASE_PASSWORD"
psql -1 -h "$DATASTORE_DATABASE_HOST" -p "$DATASTORE_DATABASE_PORT" -U "$DATASTORE_DATABASE_USER" \
        -d "$DATASTORE_DATABASE_NAME" -f shared/postgresql_backend/schema.sql
