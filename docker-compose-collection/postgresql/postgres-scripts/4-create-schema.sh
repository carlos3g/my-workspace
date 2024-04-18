#!/bin/bash
set -e
set -u
function create_extension() {
  local database=$1
  echo "Create schema '$POSTGRES_SCHEMA' for DB '$database'"
  psql -v ON_ERROR_STOP=1 -d "$database" --username "$POSTGRES_USER"  <<-EOSQL
		CREATE SCHEMA IF NOT EXISTS "$POSTGRES_SCHEMA" AUTHORIZATION "$POSTGRES_USER";
EOSQL
}
if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
  for db in $(echo $POSTGRES_MULTIPLE_DATABASES | tr ',' ' '); do
    #echo "pass for DB '$db'"
    create_extension $db
  done
fi
