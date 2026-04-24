#!/bin/bash
# WordPress REST API helper for nspire2gro.com
# Usage: ./wp.sh <endpoint> [method] [json-body]
# Examples:
#   ./wp.sh /wp/v2/pages
#   ./wp.sh /wp/v2/posts/123 PATCH '{"title":{"raw":"New Title"}}'

set -e

if [ ! -f "$(dirname "$0")/.env" ]; then
  echo "Error: .env file not found. Copy .env.example and fill in credentials."
  exit 1
fi

source "$(dirname "$0")/.env"

ENDPOINT="${1:-/}"
METHOD="${2:-GET}"
BODY="${3:-}"

BASE_URL="${WP_SITE_URL}/wp-json"

if [ -n "$BODY" ]; then
  curl -s -X "$METHOD" \
    -u "${WP_USER}:${WP_APP_PASSWORD}" \
    -H "Content-Type: application/json" \
    -d "$BODY" \
    "${BASE_URL}${ENDPOINT}" | python3 -m json.tool
else
  curl -s -X "$METHOD" \
    -u "${WP_USER}:${WP_APP_PASSWORD}" \
    "${BASE_URL}${ENDPOINT}" | python3 -m json.tool
fi
