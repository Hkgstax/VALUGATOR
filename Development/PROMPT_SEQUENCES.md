# Claude Code Prompt Sequences

## Document ID
[DOC-DEV-PROMPT-1]

## Prompt Design Principles
- Clear, specific instructions with task context
- Structured step-by-step approach
- Consistent formatting and naming conventions
- Explicit validation criteria
- Cross-references to relevant documentation

## Enhanced Prompt Structure

Claude Code performs best with well-structured prompts that provide comprehensive context and clear objectives. All implementation tasks should follow this format:

```
# IMPLEMENTATION TASK [#]: [Task Name]

## Context
[Relevant background from project documentation]

## Objective
[Specific goal of this implementation task]

## Starting Point
[Current state of the code/project relevant to this task]

## Requirements
- [Requirement 1]
- [Requirement 2]
- [...]

## Steps
1. [First implementation step with clear acceptance criteria]
2. [Second implementation step with clear acceptance criteria]
3. [...]

## References
- [DOC-ID-1]: [Brief description with link]
- [DOC-ID-2]: [Brief description with link]

## Constraints
- [Constraint 1, such as specific libraries to use or avoid]
- [Constraint 2, such as performance considerations]
- [...]

## Expected Output
[Description of what the completed task should deliver]

## Validation
- [Specific test or validation method]
- [Expected outcome or behavior]
- [Edge cases to consider]

## Next Steps
[Brief description of what follows after this task is complete]
```

## Prompt Sequence 1: Project Initialization
```
# IMPLEMENTATION TASK 1: [Task Name]

## Context
[Relevant background from project documentation]

## Objective
[Specific goal of this implementation task]

## Starting Point
[Current state of the code/project relevant to this task]

## Requirements
- [Requirement 1]
- [Requirement 2]
- [...]

## Steps
1. [First implementation step with clear acceptance criteria]
2. [Second implementation step with clear acceptance criteria]
3. [...]

## References
- [DOC-ID-1]: [Brief description with link]
- [DOC-ID-2]: [Brief description with link]

## Constraints
- [Constraint 1, such as specific libraries to use or avoid]
- [Constraint 2, such as performance considerations]
- [...]

## Expected Output
[Description of what the completed task should deliver]

## Validation
- [Specific test or validation method]
- [Expected outcome or behavior]
- [Edge cases to consider]

## Next Steps
[Brief description of what follows after this task is complete]
```

## Prompt Sequence 2: [Next Task]
*To be defined during project planning*

## Last Updated
2025-05-10 20:52:54 PDT | SESSION-INIT-001 | Claude
