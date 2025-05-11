#!/bin/bash

# Helper script to create Claude Code implementation sessions

set -e

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <task_number>"
  echo "  task_number: The implementation task number to work on"
  exit 1
fi

TASK_NUM="$1"
SESSION_FILE="claude_code_session_${TASK_NUM}.txt"

echo "Generating Claude Code session for Implementation Task ${TASK_NUM}..."

# First check if there's a standalone task file - using proper pattern matching
if ls Development/Prompts/TASK${TASK_NUM}_*.md 1> /dev/null 2>&1; then
  TASK_FILE=$(ls Development/Prompts/TASK${TASK_NUM}_*.md | head -n 1)
  echo "Found task prompt file: $TASK_FILE"
  PROMPT=$(cat "$TASK_FILE")
else
  # Extract the prompt template from PROMPT_SEQUENCES.md as fallback
  echo "No standalone task prompt file found, extracting from PROMPT_SEQUENCES.md..."
  PROMPT=$(grep -A 50 "IMPLEMENTATION TASK ${TASK_NUM}:" Development/PROMPT_SEQUENCES.md)
  
  if [ -z "$PROMPT" ]; then
    echo "Error: Implementation Task ${TASK_NUM} not found in Development/PROMPT_SEQUENCES.md"
    echo "Please create a file named TASK${TASK_NUM}_NAME.md in Development/Prompts/ directory"
    exit 1
  fi
fi

# Create the session file with instructions
cat > "$SESSION_FILE" << 'ENDSESSION'
# Claude Code Implementation Session

This file contains the prompt to be used with claude.ai/code for implementing this specific task.
Copy the entire content between the START PROMPT and END PROMPT markers into Claude Code.

-------------------START PROMPT-------------------
ENDSESSION

# Add the extracted prompt
echo "$PROMPT" >> "$SESSION_FILE"

# Add closing
cat >> "$SESSION_FILE" << 'ENDSESSION'
-------------------END PROMPT-------------------

## After Implementation

Once Claude Code has completed this implementation task:

1. Save all generated code to the appropriate locations in Development/Implementation/
2. Update the session state and development documentation
3. Mark the implementation task as complete in the Implementation Plan
4. Ensure all files are in their proper directories according to VISTA structure
5. Prepare for the next implementation task
ENDSESSION

echo "Claude Code session file created: $SESSION_FILE"
echo "Open this file and copy the prompt between the markers into claude.ai/code"
