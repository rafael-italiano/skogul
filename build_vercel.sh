#!/usr/bin/env bash
set -euo pipefail

echo "Installing dependencies"
pip install -r requirements.txt

echo "Setting PYTHONPATH"
export PYTHONPATH="$PWD/src"

echo "Collecting static files"
python src/manage.py collectstatic --noinput

echo "Preparing Vercel static output"
mkdir -p .vercel/output/static
cp -r staticfiles/* .vercel/output/static/
