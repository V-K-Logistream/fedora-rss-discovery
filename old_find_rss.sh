#!/bin/bash

# --- Fedora RSS-Discovery Tool ---
# Designed for: General Audience (Fedora Linux)
# Logic: Scans HTML headers for standardized RSS/Atom links.

# 1. Ask the user for the website address
echo "Please enter the Website URL (e.g., https://example.com):"
read TARGET_URL

echo "Searching for feeds on: $TARGET_URL..."
echo "--------------------------------------"

# 2. Use 'curl' to fetch the website source silently (-s)
# 3. Use 'grep' to find lines containing RSS or Atom XML types
# 4. Refined logic: Filters specifically for feed-related keywords
curl -sL "$TARGET_URL" | \
    grep -Ei '<link.*application/(rss|atom)\+xml' | \
    grep -oEi 'href="([^"]+)"' | \
    cut -d'"' -f2 | \
    grep -Ei 'rss|xml|feed'

# 5. Final check: If the output is empty, notify the user
if [ $? -ne 0 ]; then
    echo "NOTICE: No standard RSS/Atom feeds were detected on this page."
fi

echo "--------------------------------------"
echo "Scan Complete. Copy any links above into your RSS Reader."
