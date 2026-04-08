#!/bin/bash
# On the first user message of a session, injects context asking Claude to suggest a conversation name.
# Skips if the conversation was already named via /rename.
# The flag is deleted so this only fires once per session.

input=$(cat)

if command -v jq > /dev/null 2>&1; then
  SESSION_ID=$(echo "$input" | jq -r '.session_id // "default"')
  TRANSCRIPT_PATH=$(echo "$input" | jq -r '.transcript_path // ""')
else
  SESSION_ID="default"
  TRANSCRIPT_PATH=""
fi

FLAG="/tmp/claude-new-session-${SESSION_ID}"
if [ -f "$FLAG" ]; then
  rm "$FLAG"

  # Skip if conversation was already successfully renamed
  if [ -n "$TRANSCRIPT_PATH" ] && [ -f "$TRANSCRIPT_PATH" ] && \
     grep -q 'Session renamed to:' "$TRANSCRIPT_PATH" 2>/dev/null; then
    exit 0
  fi

  echo '{"hookSpecificOutput": {"hookEventName": "UserPromptSubmit", "additionalContext": "After responding to the user message, suggest a short 2-5 word name for this conversation based on the topic. End your response with a single line in this exact format (no extra explanation): `/rename suggested-name-here` — type to name this conversation. Use lowercase-hyphenated format for the name."}}'
fi
