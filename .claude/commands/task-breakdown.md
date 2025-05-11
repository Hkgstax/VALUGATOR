# Task Breakdown Command

Break down the feature "$ARGUMENTS" into discrete implementation tasks suitable for Claude Code sessions.

## Approach
1. Analyze the feature requirements in detail
2. Identify all necessary components and dependencies
3. Break the feature into logically discrete implementation tasks
4. Sequence the tasks in dependency order
5. Size tasks to fit within Claude Code's context window
6. Ensure each task has clear boundaries and interfaces
7. Create validation criteria for each task

## Output Format
For each implementation task, provide:

```
## Task $NUMBER: $NAME

### Description
$Brief_description

### Requirements
- $Requirement1
- $Requirement2
...

### Acceptance Criteria
- $Criterion1
- $Criterion2
...

### Dependencies
- $Dependency1
- $Dependency2
...

### Estimated Complexity
$LOW|MEDIUM|HIGH
```

## Example Tasks
Include at least one task for each of these categories:
1. Setup and infrastructure
2. Core functionality 
3. Error handling
4. Testing
5. Documentation