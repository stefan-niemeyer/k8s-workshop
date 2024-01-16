#!/usr/bin/env bash

DOMAIN=$(hostname).laserschwert.io
DOMAIN=${1:-$DOMAIN}

echo "Use domain '$DOMAIN'"
for ingressFile in *ingress*.yaml; do
  # shellcheck disable=SC2086
  sed -i 's/\DOMAIN_PLACEHOLDER/'${DOMAIN}'/g' "$ingressFile"
done
