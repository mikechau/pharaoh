#!/bin/bash

if [ "$RAILS_ENV" == "production" ]; then
  exec bundle exec passenger start -p "$PORT" --min-instances 3 --max-pool-size 3 --no-friendly-error-pages --nginx-config-template ./config/nginx.conf.erb
else
  exec bin/rails server
fi
