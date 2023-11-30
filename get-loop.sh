#!/usr/bin/env bash

VERSION=${1:-vx}
DOMAIN=$(hostname).laserschwert.io
DOMAIN=${2:-$DOMAIN}

echo "Drücke STRG+C, um das Skript zu beenden"
while true; do
    curl -w " -> %{response_code}\n" http://${VERSION}.${DOMAIN}/state
    sleep 1
done
