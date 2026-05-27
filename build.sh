#!/usr/bin/env bash
# Build script for Cloudflare Pages (or any platform).
# Replaces the @@BUILD_TIME@@ placeholder in index.html with the ISO 8601
# timestamp of the most recent git commit so the page can display a
# "Last updated" stamp in the header.

set -euo pipefail

ts=$(git log -1 --format='%cI')
echo "Embedding build time: $ts"

# Portable sed (works on both GNU and BSD).
if sed --version >/dev/null 2>&1; then
  sed -i "s|@@BUILD_TIME@@|${ts}|g" index.html
else
  sed -i '' "s|@@BUILD_TIME@@|${ts}|g" index.html
fi

echo "Done."
