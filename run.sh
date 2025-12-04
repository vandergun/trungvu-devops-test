#!/bin/bash

set -e

echo "Starting app in $APP_ENV environment on port ${APP_PORT:-8000}"
echo "Python version: $(python3 --version)"
echo "Poetry version: $(poetry --version)"

poetry run python3 main.py