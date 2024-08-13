#!/bin/bash

TARGET_APP="$1"

# Check if the app is currently focused
FOCUSED_APP_CONFIG=$(yabai -m query --windows --window)
FOCUSED_APP=$(echo "$FOCUSED_APP_CONFIG" | jq -r .app)
HAS_FOCUS=$(echo "$FOCUSED_APP_CONFIG" | jq -r '.["has-focus"]')

if [[ "$TARGET_APP" == "$FOCUSED_APP" && "$HAS_FOCUS" ]]; then
	# If the app is focused, hide it
	echo "Hiding $TARGET_APP"
	osascript -e "tell application \"System Events\" to set visible of process \"$TARGET_APP\" to false"
else
	# If the app is not focused, open it
	echo "Opening $TARGET_APP"
	open -a "$TARGET_APP"
fi
