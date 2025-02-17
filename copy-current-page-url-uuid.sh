#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Current Page URL UUID
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📋
# @raycast.packageName Google Chrome

# Documentation:
# @raycast.description Copies UUID v4 from last path segment of currently opened page URL in Google Chrome.
# @raycast.author Jack Behrend
# @raycast.authorURL https://behrend.co

URL=$(osascript -e 'tell application "Google Chrome" to get URL of active tab of first window')
SEGMENT=$(echo "$URL" | awk -F/ '{print $NF}')
UUID_V4_REGEX='^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[89aAbB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$'
if [[ "$SEGMENT" =~ $UUID_V4_REGEX ]]; then
  printf "%s" "$SEGMENT" | pbcopy
  echo "UUID copied: $SEGMENT"
else
  echo "UUID not found"
fi