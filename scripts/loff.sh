#!/usr/bin/env bash

set -euo pipefail

: "${BULB_HOST:?set BULB_HOST before running loff.sh}"

printf '{"id":1,"method":"setState","params":{"state":false}}' | nc -u -w 1 "$BULB_HOST" "${BULB_PORT:-38899}"
