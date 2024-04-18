#!/bin/bash
set -e
set -u
function create_extension() {
  local database=$1
  echo "Create extension uuid for DB '$database'"
  psql -v ON_ERROR_STOP=1 -d "$database" --username "$POSTGRES_USER" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp"
EOSQL
}
if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
  for db in $(echo $POSTGRES_MULTIPLE_DATABASES | tr ',' ' '); do
    create_extension $db
  done
fi
