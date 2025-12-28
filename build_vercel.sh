#!/usr/bin/env bash
set -euo pipefail

echo "Installing dependencies"
pip install -r requirements.txt

echo "Collecting static files"
python manage.py collectstatic --noinput

echo "Preparing Vercel output"
mkdir -p .vercel/output/static
cp -r staticfiles/* .vercel/output/static/
