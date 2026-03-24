#!/bin/bash
# Clean, filtered RSS discovery for Fedora users.
echo "Enter Website URL:"
read TARGET_URL
echo "--- Scanning $TARGET_URL ---"
curl -sL "$TARGET_URL" | \
    grep -Ei '<link.*application/(rss|atom)\+xml' | \
    grep -oEi 'href="([^"]+)"' | \
    cut -d'"' -f2 | \
    grep -Ei 'rss|xml|feed'
echo "--- Scan Complete ---"