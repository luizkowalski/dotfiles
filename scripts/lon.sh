#!/usr/bin/env bash

set -euo pipefail

: "${BULB_HOST:?set BULB_HOST before running lon.sh}"

printf '{"id":1,"method":"setState","params":{"state":true}}' | nc -u -w 1 "$BULB_HOST" "${BULB_PORT:-38899}"
