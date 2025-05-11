#!/bin/bash

# VISTA: Post-Implementation Documentation Update Generator
# Creates a structured template for updating documentation after implementation tasks

set -e

# Display help information
show_help() {
  echo "Usage: $0 <task_number> [summary]"
  echo "  task_number: The implementation task number that was completed"
  echo "  summary: Optional brief summary of implementation results"
  echo ""
  echo "This script generates a documentation update template for maintaining"
  echo "VISTA documentation after implementing a specific task."
  echo ""
  echo "The template can be used with Claude to update all relevant documents,"
  echo "ensuring that the documentation remains synchronized with implementation."
}

# Check arguments
if [ "$#" -lt 1 ]; then
  show_help
  exit 1
fi

# Process arguments
TASK_NUM="$1"
SUMMARY="${2:-Completed implementation of task $TASK_NUM}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
DATE_WITH_TIME=$(date +"%Y-%m-%d %H:%M:%S %Z")
UPDATE_FILE="documentation_update_task${TASK_NUM}.md"

# Get project directory
PROJECT_DIR="$(pwd)"

# Helper function to extract task title
extract_task_title() {
  # First try the dedicated prompt file
  if ls ${PROJECT_DIR}/Development/Prompts/TASK${TASK_NUM}_*.md 1> /dev/null 2>&1; then
    TASK_FILE=$(ls ${PROJECT_DIR}/Development/Prompts/TASK${TASK_NUM}_*.md | head -n 1)
    TITLE=$(grep -m 1 "^# IMPLEMENTATION TASK ${TASK_NUM}:" "$TASK_FILE" | sed "s/^# IMPLEMENTATION TASK ${TASK_NUM}: //")
    echo "$TITLE"
    return
  fi
  
  # Fall back to PROMPT_SEQUENCES.md
  if [ -f "${PROJECT_DIR}/Development/PROMPT_SEQUENCES.md" ]; then
    TITLE=$(grep -m 1 "IMPLEMENTATION TASK ${TASK_NUM}:" ${PROJECT_DIR}/Development/PROMPT_SEQUENCES.md | sed "s/^# IMPLEMENTATION TASK ${TASK_NUM}: //")
    echo "$TITLE"
    return
  fi
  
  # Default if no title found
  echo "Task ${TASK_NUM}"
}

# Extract current session ID
extract_current_session() {
  if [ -f "${PROJECT_DIR}/SESSION_STATE.md" ]; then
    SESSION_ID=$(grep "^- Session ID:" "${PROJECT_DIR}/SESSION_STATE.md" | head -n 1 | sed 's/^- Session ID: //')
    echo "$SESSION_ID"
    return
  fi
  echo "SESSION-IMPL-001" # Default fallback
}

# Get the task title and current session
TASK_TITLE=$(extract_task_title)
CURRENT_SESSION=$(extract_current_session)

# Create sequence number for next session
NEXT_SESSION_NUM=$(echo "$CURRENT_SESSION" | grep -o '[0-9]\+$')
NEXT_SESSION_NUM=$((NEXT_SESSION_NUM + 1))
NEXT_SESSION_NUM=$(printf "%03d" $NEXT_SESSION_NUM)
NEXT_SESSION="SESSION-IMPL-${NEXT_SESSION_NUM}"

echo "Generating documentation update template for Task $TASK_NUM: $TASK_TITLE..."

# Create the documentation update template
cat > "$UPDATE_FILE" << EOF
# Post-Implementation Documentation Update: Task ${TASK_NUM} - ${TASK_TITLE}

## Implementation Task
- **Task Number**: $TASK_NUM
- **Task Name**: $TASK_TITLE
- **Completed**: $DATE_WITH_TIME

## Documentation Update Instructions

To update the documentation based on the implementation results, please use this prompt with Claude:

\`\`\`
Resume project using DOCPROTOCOL. Last session ID: $CURRENT_SESSION

I've completed Implementation Task $TASK_NUM: $TASK_TITLE and need to update the documentation. Here's a summary of the implementation:

## Implementation Results Summary
$SUMMARY

## Technical Details
[Describe the technical implementation details, including:
- Key components created or modified
- Architecture decisions made during implementation
- Libraries or dependencies used
- Data structures and algorithms implemented
- Performance considerations addressed]

## Changes from Original Plan
[Describe any deviations from the original implementation plan:
- Features that were implemented differently than planned
- Additional components that were created
- Components that were omitted or postponed
- Changes to interfaces or APIs]

## Challenges Encountered
[Describe any significant challenges encountered during implementation:
- Technical obstacles and how they were overcome
- Performance issues and optimizations
- Security considerations that emerged
- Compatibility issues that were addressed]

## Testing and Validation
[Describe how the implementation was tested:
- Tests that were created
- Validation performed against requirements
- Edge cases that were tested
- Known limitations or issues]

## Documentation Updates Needed
[List specific documentation updates needed:
- New components to document
- Changes to existing documentation
- Updated diagrams or visualizations
- Additional examples or usage notes]

Please update all relevant documentation, including:
1. SESSION_STATE.md - Mark Task $TASK_NUM as completed
2. Development/IMPLEMENTATION_PLAN.md - Update status of Task $TASK_NUM
3. Any technical documentation affected by implementation changes
4. KNOWLEDGE_GRAPH.md - Add any new concepts or relationships

Conclude session and prepare handoff
\`\`\`

## Documentation Update Checklist

After Claude updates the documentation, verify the following:

- [ ] SESSION_STATE.md shows Task ${TASK_NUM} as completed
- [ ] Technical documentation includes actual implementation details
- [ ] Any deviations from the original plan are documented
- [ ] New technical decisions are added to the decision record
- [ ] Progress indicators are updated correctly
- [ ] Cross-references between documentation and implementation are maintained
- [ ] Next steps are clearly identified

## Implementation Files to Reference

List the primary files that were created or modified during this implementation task:

1. [List implementation files here...]

## Key Challenges and Solutions

Document any significant challenges encountered during implementation and how they were resolved:

1. [List challenges and solutions here...]

## Next Steps

- Run the next implementation task:
  \`./generate_dev_session.sh $((TASK_NUM + 1))\`

- Or update documentation for the next completed task:
  \`./update_documentation.sh $((TASK_NUM + 1)) "Brief implementation summary"\`
EOF

echo "Documentation update template created: $UPDATE_FILE"
echo ""
echo "Next steps:"
echo "1. Edit $UPDATE_FILE to add specific implementation details"
echo "2. Use the template to update documentation with Claude"
echo "3. Start a new Claude session with the prompt in the template"
echo ""