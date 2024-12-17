#!/usr/bin/env bash
set -e

# Start Docker daemon
dockerd --host=unix:///var/run/docker.sock &

# Wait until Docker daemon is ready
until docker info > /dev/null 2>&1; do
    sleep 1
done

exec "$@"
