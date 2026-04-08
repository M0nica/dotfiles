#!/bin/bash
# Creates a flag file to track that this is a fresh session (first message not yet sent)
if command -v jq > /dev/null 2>&1; then
  SESSION_ID=$(jq -r '.session_id // "default"')
else
  SESSION_ID="default"
fi
touch "/tmp/claude-new-session-${SESSION_ID}"
