#!/usr/bin/env bash
# Add the Tlaloc MCP server to Claude Code.
# Get an API key (tlmx_...) at https://console.tlaloc.sh
set -euo pipefail

claude mcp add --transport http tlaloc \
  https://api.tlaloc.sh/mx/mcp \
  --header "Authorization: Bearer ${TLALOC_API_KEY:-tlmx_YOUR_API_KEY}"

# Then ask Claude, e.g.:
#   "What neighborhoods are in postal code 06700?"
#   "Is RFC GODE561231GR8 active and able to issue invoices?"
