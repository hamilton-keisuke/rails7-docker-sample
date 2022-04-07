#!/bin/bash

set -eu

rm -rf tmp/pids/server.pid
rails db:prepare

exec "$@"
