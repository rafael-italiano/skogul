#!/usr/bin/env bash
set -euo pipefail

podman run \
    -p 8080:8000 \
    -v ./src/skogul/:/app/skogul/ \
    -v ./src/manage.py:/app/manage.py \
    --env-file .env \
    skogul-django \
    python -m gunicorn skogul.wsgi:application \
        --bind 0.0.0.0:8000 \
        --workers 3 \
        --reload