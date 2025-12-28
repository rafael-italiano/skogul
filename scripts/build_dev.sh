#!/usr/bin/env bash
set -euo pipefail

podman build \
    -f Containerfile \
    -t skogul-django