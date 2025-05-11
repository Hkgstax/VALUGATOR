# Context Recovery Protocol

## Document ID
[DOC-PROTO-RECOV-1]

## Purpose
This document provides a structured approach to recovering from context loss or session interruption in the VALUGATOR project.

## Context Loss Recovery Protocol

If a session is interrupted or context is lost, follow these steps to restore context:

1. **Begin recovery** with this exact command:
   ```
   Resume project after context loss. Last session ID: [SESSION-ID]
   ```
   Replace [SESSION-ID] with the ID from SESSION_METADATA.json.

2. **Read and internalize critical context**:
   - Review PROTOCOL.md for core session protocols
   - Read SESSION_STATE.md thoroughly to understand current state
   - Check SESSION_METADATA.json for session status
   - Review KNOWLEDGE_GRAPH.md for key concept relationships
   - Examine README.md for project overview

3. **Verify session status** in SESSION_METADATA.json:
   - If status is "active" - resume the interrupted session
   - If status is "concluded" - prepare to start the next session
   - If status is "interrupted" - resume from last stable state

4. **Restore session continuity**:
   - Update SESSION_METADATA.json "context_status.integrity" to "restored"
   - Increment "context_status.recovery_attempts" by 1
   - Update "context_status.last_verified" timestamp

5. **Continue session** according to the appropriate protocol:
   - For active sessions: Continue with current objectives
   - For concluded sessions: Begin new session with next ID
   - For interrupted sessions: First resolve any incomplete updates

## VALUGATOR-Specific Recovery Notes

For the current state of VALUGATOR (after SESSION-003):

1. **Critical Documents to Read**:
   - SESSION_STATE.md - Contains current session state with comprehensive summary
   - Technical/USER_EXPERIENCE_JOURNEY.md - Details of user flow
   - Technical/DIALOGUE_FLOW_PATTERNS.md - Character interaction rules
   - Technical/VISUAL_STYLE_GUIDE.md - Design principles
   - Technical/GATOR_PERSONAS.md - Character definitions
   - Technical/EVALUATION_CRITERIA.md - Startup idea assessment framework

2. **Context Verification**:
   - Understand we've completed product definition (90%)
   - We're transitioning to technical architecture planning
   - SESSION-004 will focus on technical implementation

3. **Recovery Command for SESSION-004**:
   ```
   Resume project after context loss. Last session ID: SESSION-003
   ```

## Potential Context Loss Scenarios

### Scenario 1: Loss During SESSION-004
If context is lost during SESSION-004:
- Read SESSION_STATE.md and SESSION_METADATA.json
- Understand the technical architecture focus
- Resume with pending action items from SESSION-004

### Scenario 2: Loss Between Sessions
If context is lost between SESSION-003 and SESSION-004:
- Begin new SESSION-004 with proper protocol
- Focus on the areas defined in SESSION_STATE.md
- Follow the standard session start procedure

### Scenario 3: Complete Context Loss
If severe context loss occurs with no recent memory:
- Start with README.md and PROTOCOL.md
- Review full SESSION_STATE.md history
- Examine KNOWLEDGE_GRAPH.md for concept relationships
- Review Technical directory documents in priority order

## Checklist
- [ ] Used correct context recovery command
- [ ] Read and internalized all critical context
- [ ] Verified current session status
- [ ] Updated SESSION_METADATA.json appropriately
- [ ] Continued session with proper protocol

## Last Updated
2025-05-13 15:45:00 PDT | SESSION-003 | Claude