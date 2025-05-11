#!/bin/bash

# VISTA session recovery helper script for VALUGATOR
# Assists with recovering from context loss

set -e

# Get current session info from SESSION_METADATA.json
CURRENT_SESSION=$(grep -o '"id": "[^"]*"' SESSION_METADATA.json | head -1 | cut -d'"' -f4)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
CURRENT_STATUS=$(grep -o '"status": "[^"]*"' SESSION_METADATA.json | head -1 | cut -d'"' -f4)
RECOVERY_ATTEMPTS=$(grep -o '"recovery_attempts": [0-9]*' SESSION_METADATA.json | cut -d':' -f2 | tr -d ' ')
NEW_RECOVERY_ATTEMPTS=$((RECOVERY_ATTEMPTS + 1))

echo "Preparing context recovery for session $CURRENT_SESSION (current status: $CURRENT_STATUS)..."

# Update SESSION_METADATA.json recovery counters
sed -i.bak "s/\"recovery_attempts\": [0-9]*/\"recovery_attempts\": $NEW_RECOVERY_ATTEMPTS/" SESSION_METADATA.json
sed -i.bak "s/\"integrity\": \"[^\"]*\"/\"integrity\": \"restored\"/" SESSION_METADATA.json
sed -i.bak "s/\"last_verified\": \"[^\"]*\"/\"last_verified\": \"$TIMESTAMP\"/" SESSION_METADATA.json
rm -f SESSION_METADATA.json.bak

# Update last_command.sh
cat > "last_command.sh" << EOF_LASTCMD
#!/bin/bash

# VISTA last command tracker
# Automatically tracks the most recent protocol command
# Use this to verify the last state-changing command that was executed

# Current command
# Command: Recover session
# Timestamp: ${TIMESTAMP}
# Session: ${CURRENT_SESSION}
# Status: Context recovery initiated (attempt #$NEW_RECOVERY_ATTEMPTS)
EOF_LASTCMD

chmod +x "last_command.sh"

echo "Updated SESSION_METADATA.json and last_command.sh"
echo ""
echo "To recover context, tell Claude:"
echo ""
echo "Resume project after context loss. Last session ID: $CURRENT_SESSION"
echo ""
echo "Claude will read the PROTOCOL.md file and SESSION_PROTOCOL directory"
echo "to restore context based on the current session status ($CURRENT_STATUS)."
echo ""
echo "Critical files to read for recovery:"
echo "1. SESSION_STATE.md"
echo "2. PROTOCOL.md"
echo "3. Technical/USER_EXPERIENCE_JOURNEY.md" 
echo "4. Technical/DIALOGUE_FLOW_PATTERNS.md"
echo "5. Technical/VISUAL_STYLE_GUIDE.md"