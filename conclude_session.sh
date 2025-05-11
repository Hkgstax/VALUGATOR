#!/bin/bash

# VISTA session conclusion helper script for VALUGATOR
# Automatically updates metadata when concluding a session

set -e

# Get current session info from SESSION_METADATA.json
CURRENT_SESSION=$(grep -o '"id": "[^"]*"' SESSION_METADATA.json | head -1 | cut -d'"' -f4)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Determine next session ID
if [[ $CURRENT_SESSION == SESSION-INIT-* ]]; then
  NEXT_SESSION="SESSION-001"
elif [[ $CURRENT_SESSION =~ SESSION-([0-9]+)$ ]]; then
  CURRENT_NUM=${BASH_REMATCH[1]}
  NEXT_NUM=$(printf "%03d" $((10#$CURRENT_NUM + 1)))
  NEXT_SESSION="SESSION-$NEXT_NUM"
else
  NEXT_SESSION="SESSION-001"
fi

echo "Concluding session $CURRENT_SESSION and preparing handoff to $NEXT_SESSION..."

# Update SESSION_METADATA.json status
sed -i.bak "s/\"status\": \"[^\"]*\"/\"status\": \"concluding\"/" SESSION_METADATA.json
sed -i.bak "s/\"actual_end_time\": \"[^\"]*\"/\"actual_end_time\": \"$TIMESTAMP\"/" SESSION_METADATA.json
rm -f SESSION_METADATA.json.bak

# Update last_command.sh
cat > "last_command.sh" << EOF_LASTCMD
#!/bin/bash

# VISTA last command tracker
# Automatically tracks the most recent protocol command
# Use this to verify the last state-changing command that was executed

# Current command
# Command: Conclude session
# Timestamp: ${TIMESTAMP}
# Session: ${CURRENT_SESSION}
# Status: Session concluding, handoff prepared for ${NEXT_SESSION}
EOF_LASTCMD

chmod +x "last_command.sh"

echo "Updated SESSION_METADATA.json and last_command.sh"
echo ""
echo "To properly conclude your session, tell Claude:"
echo ""
echo "Conclude session and prepare handoff"
echo ""
echo "After Claude updates the documentation, begin your next session with:"
echo ""
echo "Resume project using DOCPROTOCOL. Last session ID: $NEXT_SESSION"