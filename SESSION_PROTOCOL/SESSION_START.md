# Session Start Protocol

## Document ID
[DOC-PROTO-START-1]

## Purpose
This document provides a structured approach to starting a new session with the VISTA documentation system for the VALUGATOR project.

## Standard Start Protocol

1. **Begin the session** with this exact command:
   ```
   Resume project using DOCPROTOCOL. Last session ID: [SESSION-ID]
   ```
   Replace [SESSION-ID] with the ID from SESSION_STATE.md.

2. **Verify context loading** has completed by checking:
   - Knowledge state has been loaded
   - Decision record is available
   - Open questions are accessible
   - Action items are tracked

3. **Set session objectives** by stating:
   - Primary goals for this session
   - Specific documents to be created or updated
   - Key decisions that need to be made

4. **Update SESSION_METADATA.json** (automated):
   - Current session status to "active"
   - Session start timestamp
   - Context integrity verification

## VALUGATOR Next Session (SESSION-004)

For SESSION-004 of the VALUGATOR project, use:
```
Resume project using DOCPROTOCOL. Last session ID: SESSION-003
```

The focus areas for SESSION-004 are:
1. Creating technical architecture diagram focusing on AI dialogue generation system
2. Designing database schema for storing session data and user history
3. Developing implementation plan with feature prioritization and development phases

## First Session Protocol

For the very first session after initialization, use:

```
# DOCPROTOCOL: Claude will (1)Load system context from SESSION_STATE.md (2)Process new information (3)Update all affected documents (4)Maintain cross-references via unique IDs (5)Version all changes (6)Generate comprehensive session summary (7)Update knowledge graph (8)Prepare handoff state for next session
```

## Checklist
- [ ] Used correct session start command
- [ ] Verified proper context loading
- [ ] Established clear session objectives
- [ ] Confirmed SESSION_METADATA.json is updated

## Last Updated
2025-05-13 15:45:00 PDT | SESSION-003 | Claude