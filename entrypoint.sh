#!/bin/bash
set -e

export ENVIRONMENT=__ENV__

# Runs db create and db migrate commands accordinly the environment
bundle exec rake db:{create,migrate} RAILS_ENV=$ENVIRONMENT
exec "$@"

# Avoids the server is already running error
rm -f /app/tmp/pids/server.pid

# Runs the "rails server" command accordinly the environment
if [ $ENVIRONMENT == "production" ]; then
  rails server -e $ENVIRONMENT -b 0.0.0.0
else
  rails server -b 0.0.0.0
fi