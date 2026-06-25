#!/usr/bin/env bash
# The MCP server wraps the same REST API. You can call the REST endpoints directly
# with any Tlaloc API key (tlmx_...). Base URL: https://api.tlaloc.sh/mx
# Get a key at https://console.tlaloc.sh
set -euo pipefail

KEY="${TLALOC_API_KEY:-tlmx_YOUR_API_KEY}"
BASE="https://api.tlaloc.sh/mx"

# Postal code (SEPOMEX) — $0.01
curl -s -H "Authorization: Bearer $KEY" "$BASE/v1/zip?code=06700"

# RFC (SAT) — $0.10
curl -s -H "Authorization: Bearer $KEY" "$BASE/v1/rfc?rfc=GODE561231GR8"

# CURP (RENAPO) — $0.25
curl -s -H "Authorization: Bearer $KEY" "$BASE/v1/curp?curp=GOMC960912MDFXXX09"

# Phone (IFT) — $0.01
curl -s -H "Authorization: Bearer $KEY" "$BASE/v1/phone?number=5512345678"

# CEP institutions catalog (Banxico)
curl -s -H "Authorization: Bearer $KEY" "$BASE/v1/cep/instituciones?fecha=2026-06-01"
