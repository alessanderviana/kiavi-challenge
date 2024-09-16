#!/bin/bash
set -e

bundle exec rake db:create db:migrate RAILS_ENV=__ENV__
exec "$@"