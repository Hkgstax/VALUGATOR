# VISTA: VALUGATOR Documentation System

## Getting Started

1. Begin your first session with Claude using the following command:
   
   ```
   # DOCPROTOCOL: Claude will (1)Load system context from SESSION_STATE.md (2)Process new information (3)Update all affected documents (4)Maintain cross-references via unique IDs (5)Version all changes (6)Generate comprehensive session summary (7)Update knowledge graph (8)Prepare handoff state for next session
   ```

2. Start by explaining your project's objectives to Claude

3. End each session with: "Conclude session and prepare handoff"

4. Begin subsequent sessions with: 
   "Resume project using DOCPROTOCOL. Last session ID: [SESSION-ID]"
   (Use the session ID provided at the end of the previous session)

## Project Workflow

This system supports a complete project lifecycle:

1. **Documentation Phase**
   - Create comprehensive project documentation
   - Define requirements and architecture
   - Establish knowledge base and technical specifications

2. **Development Planning**
   - Break down implementation into discrete tasks
   - Create detailed task descriptions for Claude Code
   - Establish implementation sequence

3. **Planning to Implementation Transition**
   - For each task in Implementation Plan:
     - Create a specific prompt file in Development/Prompts/ directory
     - Create test specifications in Development/Tests/ directory
     - Set up implementation structure in Development/Implementation/

4. **Implementation Phase**
   - Use `generate_dev_session.sh` to create Claude Code prompts
   - Execute implementation tasks in Claude Code
   - Save all code in Development/Implementation/ directory
   - Update documentation with implementation results

## Directory Structure

- **README.md**: Main project overview
- **SESSION_STATE.md**: Current state of knowledge and decisions
- **KNOWLEDGE_GRAPH.md**: Concept relationships and definitions
- **METADATA.json**: Version tracking and cross-references
- **Executive/**: High-level documentation for executives
- **Management/**: Project management documentation
- **Technical/**: Technical specifications and design
- **Development/**: Detailed implementation documentation
   - **IMPLEMENTATION_PLAN.md**: Task breakdown and implementation sequence
   - **TEST_STRATEGY.md**: Overall testing approach and validation criteria
   - **PROMPT_SEQUENCES.md**: Master template for Claude Code prompt structure
   - **Implementation/**: All actual code implementation files
   - **Tests/**: Specification files for what should be tested
   - **Prompts/**: Individual Claude Code prompt files (one per task)
- **CLAUDE_MUST_READ_THIS_FIRST/**: Reference materials for Claude
- **.claude/commands/**: Custom slash commands for Claude Code

## Implementation File Organization

1. **Breaking Down Implementation Tasks**
   - Create individual files for each task in Development/Prompts/
   - Name files as TASK1_NAME.md, TASK2_NAME.md, etc.
   - Follow the template defined in PROMPT_SEQUENCES.md

2. **Test Specifications**
   - Create test specification files in Development/Tests/
   - Define what should be tested before implementation
   - Reference these specifications in actual test code

3. **Code Implementation**
   - All code must be implemented in Development/Implementation/
   - Follow language-specific best practices for structure
   - Include references to documentation in code comments

## Custom Claude Code Commands

This project includes custom slash commands for Claude Code:

- **/project:task-breakdown**: Break down a feature into implementation tasks
- **/project:plan-feature**: Plan feature implementation in detail
- **/project:implement-task**: Implement a specific development task  
- **/project:verify-implementation**: Verify an implementation against requirements
- **/project:analyze-code**: Analyze code structure and quality

## Best Practices

1. **Documentation Sessions**
   - Always follow the session start and end protocols
   - Review SESSION_STATE.md at the beginning of each session
   - Update all relevant documentation with new information

2. **Implementation Sessions**
   - Use structured prompts for Claude Code implementation tasks
   - Keep all implementation files in the correct directories
   - Tell Claude to "think hard" for complex problems
   - Verify implementations against requirements

3. **Multi-Session Projects**
   - Maintain clear documentation of current state
   - Cross-reference between documentation and implementation
   - Update SESSION_STATE.md after each implementation session

4. **Quality Assurance**
   - Use separate Claude sessions for verification
   - Follow test-first development when possible
   - Create test specifications before implementation
   - Document lessons learned during implementation
   - Verify all files are in correct locations before session end
