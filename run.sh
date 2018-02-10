#!/bin/sh
set -e

# Make sure there are no orphan rails server from previous runs
echo "rm -f /var/www/tmp/pids/server.pid..."
rm -f /var/www/tmp/pids/server.pid

# Wait for Postgres to become available.
echo "Checking for Postgres..."
until psql -h db -U "postgres" -c '\q' 2>/dev/null; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

# Start the web server
echo "bin/rails s -p 3000 -b '0.0.0.0'..."
bin/rails s -p 3000 -b '0.0.0.0'
