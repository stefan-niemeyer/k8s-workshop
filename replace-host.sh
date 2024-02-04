#!/usr/bin/env bash

DOMAIN="${EXTERNAL_DNS}"
DOMAIN=${1:-$DOMAIN}

echo "Use domain '$DOMAIN'"
for ingressFile in *ingress*.yaml; do
  # shellcheck disable=SC2086
  sed -i 's/\DOMAIN_PLACEHOLDER/'${DOMAIN}'/g' "$ingressFile"
done
