#!/usr/bin/env bash
# exit on error
zset -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rake db:migrate
