#!/bin/bash

set -eu

rails db:migrate

exec "$@"
