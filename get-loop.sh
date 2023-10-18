#!/usr/bin/env bash

VERSION=${1:-vx}

echo "Drücke STRG+C, um das Skript zu beenden"
while true; do
    curl -X GET -w " - > %{response_code}\n" http://k8s-demo-${VERSION}.internal/state
    sleep 1
done
