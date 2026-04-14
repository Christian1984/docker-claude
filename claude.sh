#!/bin/bash

# Ensure directories exist
mkdir -p "$(pwd)/claude"

# Create .claude.json as a file if it doesn't exist
if [ ! -f "$(pwd)/claude/.claude.json" ]; then
  touch "$(pwd)/claude/.claude.json"
fi

docker run --rm -it \
  -v "$(pwd)/project:/srv" \
  -v "$(pwd)/claude/.claude:/home/claude/.claude" \
  -v "$(pwd)/claude/.claude.json:/home/claude/.claude.json" \
  claude:isolated "$@"
