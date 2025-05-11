# VISTA Session Protocol

## Document ID
[DOC-ROOT-PROTO-1]

## Core Protocol Commands
This document defines the essential commands and procedures for maintaining session continuity with the VISTA documentation system for the VALUGATOR project.

### Session Start Command
To start a session, use:
```
# DOCPROTOCOL: Claude will (1)Load system context from SESSION_STATE.md (2)Process new information (3)Update all affected documents (4)Maintain cross-references via unique IDs (5)Version all changes (6)Generate comprehensive session summary (7)Update knowledge graph (8)Prepare handoff state for next session
```

### Session Resume Command
To resume an existing session, use:
```
Resume project using DOCPROTOCOL. Last session ID: [SESSION-ID]
```

### Session Conclude Command
To properly conclude a session, use:
```
Conclude session and prepare handoff
```

### Context Recovery Command
If context is lost or interrupted, use:
```
Resume project after context loss. Last session ID: [SESSION-ID]
```

## Session Workflow
Every session follows this standard workflow:

1. **Initialization**: Load current state and context
2. **Information Processing**: Update documentation based on new information
3. **Cross-referencing**: Maintain links between related documents
4. **Versioning**: Track changes to documents
5. **Summarization**: Generate comprehensive session summary
6. **Knowledge Update**: Update knowledge graph with new concepts
7. **Handoff Preparation**: Prepare state for the next session

## Context Recovery Procedure

If session context is lost or interrupted, follow these steps:

1. Check SESSION_METADATA.json for current session status
2. Read SESSION_STATE.md to understand current progress
3. Review the SESSION_PROTOCOL directory files
4. Use the Context Recovery Command to resume

## Session Status Indicators
Sessions have clearly defined status indicators:

- 🟢 **Active**: Session currently in progress
- 🟡 **Concluding**: Session in the process of concluding
- 🔵 **Concluded**: Session properly concluded with handoff
- 🔴 **Interrupted**: Session ended unexpectedly without proper conclusion

## VALUGATOR Project Status

- Current Session: SESSION-003 (concluded)
- Next Session: SESSION-004
- Project Phase: Product Definition (90% complete)
- Next Focus: Technical architecture planning

## Visual Protocol Reminder
```
┌─────────────────────────────────────────────────────┐
│                VISTA Session Flow                   │
│                                                     │
│  ┌───────────┐    ┌───────────┐    ┌───────────┐    │
│  │   START   │───►│  PROCESS  │───►│ CONCLUDE  │    │
│  └───────────┘    └───────────┘    └───────────┘    │
│                                                     │
│  Context Loss Occurs                                │
│       │                                             │
│       ▼                                             │
│  ┌───────────┐    ┌───────────┐    ┌───────────┐    │
│  │  RECOVER  │───►│  RESTORE  │───►│ CONTINUE  │    │
│  └───────────┘    └───────────┘    └───────────┘    │
│                                                     │
└─────────────────────────────────────────────────────┘
```

## Last Updated
2025-05-13 15:45:00 PDT | SESSION-003 | Claude