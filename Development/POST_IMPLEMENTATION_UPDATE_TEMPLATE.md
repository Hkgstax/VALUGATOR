# Post-Implementation Documentation Update Template

## Overview
This template provides a structured format for updating VISTA documentation after implementing a task. It ensures consistent capture of implementation details, changes, and required documentation updates.

## Session Information
- **Task Number**: [TASK_NUMBER]
- **Task Name**: [TASK_NAME]
- **Implementation Date**: [YYYY-MM-DD]
- **Previous Session**: [PREVIOUS_SESSION_ID]
- **Current Session**: [CURRENT_SESSION_ID]

## 1. Implementation Summary
[Provide a concise summary (3-5 sentences) of what was implemented, focusing on completed functionality rather than technical details]

## 2. Technical Details

### Components Implemented
[List the key components created or modified]
- Component 1: [Description]
- Component 2: [Description]
- ...

### Architecture & Design
[Describe the implemented architecture, including key design patterns, component interactions, and data flow]

### Technologies Used
[List technologies, libraries, frameworks, or tools used in implementation]
- Technology 1: [Purpose/Function]
- Technology 2: [Purpose/Function]
- ...

## 3. Decision Record

### Implementation Decisions
[Document important technical decisions made during implementation]
- [DEC-IMPL-XXX]: [Decision description]
  - Rationale: [Why this decision was made]
  - Alternatives: [Alternatives considered]
  - Impact: [Impact on the codebase or system]

### Changes from Original Plan
[Describe any deviations from the original implementation plan]
- Original plan: [Description]
- Actual implementation: [Description]
- Rationale for change: [Explanation]

### New Questions Raised
[List any new questions or considerations that emerged during implementation]
- [Q-IMPL-XXX]: [Question description]
  - Status: [Open/Addressed]
  - Impact: [What areas this affects]

## 4. Testing & Validation

### Test Implementation
[Describe tests implemented]
- Unit tests: [Coverage and results]
- Integration tests: [Coverage and results]
- Manual testing: [Scenarios and outcomes]

### Validation Against Requirements
[Verify implementation against original requirements]
- Requirement 1: [Met/Partially Met/Not Met] - [Details]
- Requirement 2: [Met/Partially Met/Not Met] - [Details]
- ...

### Known Limitations
[Document any known limitations, edge cases, or constraints]

## 5. Documentation Updates Required

### File Updates
[List specific files that need updates]
- [File path]: [Changes required]
- [File path]: [Changes required]
- ...

### New Documentation Needed
[Describe new documentation that should be created]
- [Document type]: [Content description]
- [Document type]: [Content description]
- ...

### Diagram Updates
[Note any diagrams or visual documentation that need updates]

## 6. Next Steps

### Action Items
[List specific actions needed as follow-up]
- [ACT-XXX]: [Action description]
  - Owner: [Person responsible]
  - Status: [Pending]
  - Deadline: [Timeline]

### Dependencies for Next Tasks
[Note any dependencies created or resolved for subsequent tasks]

### Recommendations
[Provide recommendations for future implementation tasks]

## Usage Instructions
1. Fill in all sections with detailed information about your implementation
2. Use this template to update Claude with implementation results
3. Begin your Claude session with:
   ```
   Resume project using DOCPROTOCOL. Last session ID: [PREVIOUS_SESSION_ID]
   ```
4. Submit the completed template
5. End with: "Conclude session and prepare handoff"