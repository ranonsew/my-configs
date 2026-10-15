# OpenCode 2 — Personal Agent Setup Requirements

Version: 1.0
Platform: Windows 11
Shell: PowerShell 7
Installation: Scoop (OpenCode 2)
Primary provider: OpenAI via ChatGPT Plus
Configuration scope: User + Project
Status: Setup pending verification

## 1. Installation and Environment

### ENV-001 — Package management
Install OpenCode 2 through Scoop.
Allow future migration to npm without losing user configuration.

### ENV-002 — Operating system
Support native Windows 11 and PowerShell 7.
WSL is optional, not required.

### ENV-003 — Shell
Use pwsh.exe for terminal operations.
Do not assume Bash commands are available.

### ENV-004 — Configuration scope
Keep shared settings in:
~/.config/opencode/

Keep project settings in each repository.
Do not require machine-wide configuration.

### ENV-005 — Editor independence
Support development using VS Code or Zed.
Do not require Vim, Neovim, or another editor.

## 2. Models and Authentication

### MODEL-001 — Authentication
Authenticate OpenCode through the existing ChatGPT Plus
subscription when the provider offers supported sign-in.

### MODEL-002 — Model selection
Select a model confirmed available after authentication.
Do not assume a model ID or paid API access.

### MODEL-003 — Model flexibility
Allow future model changes without restructuring agents,
skills, requirements, or progress documents.

## 3. Agents

### AGENT-001 — Default Builder
Provide a default primary agent for application development.

### AGENT-002 — Advisor
Provide a second primary agent for conversation, education,
debugging, design discussions, and technology comparisons.

### AGENT-003 — Switching
Allow switching between Builder and Advisor.

### AGENT-004 — Persistent context
Use repository documents as durable context.
Do not rely exclusively on conversation history.

## 4. Requirements Management

### REQ-001 — Input
Accept user-provided TXT or Markdown requirements.

### REQ-002 — Clarification
Identify missing requirements and ask questions.

### REQ-003 — Specification
Create and maintain a structured specification.

### REQ-004 — Change management
Identify affected requirements, tasks, and files when
requirements change.

### REQ-005 — Original requirements
Preserve the original requirements separately from the
refined specification.

## 5. Progress Management

### TASK-001 — Task tracking
Maintain a persistent progress document.

### TASK-002 — Stable IDs
Give requirements and implementation tasks stable IDs.

### TASK-003 — File mapping
Record which source files correspond to each task.

### TASK-004 — Statuses
Track Planned, In Progress, Implemented,
Awaiting Verification, Verified, and Blocked.

### TASK-005 — Automatic progress edits
Allow the Builder to update progress documents without
approval, but not arbitrary source files.

### TASK-006 — Resume work
Read the specification and progress document when
resuming a project.

### TASK-007 — Verification
Do not mark work Verified without user-supplied evidence.

## 6. Permissions and Execution

### PERM-001 — Reading
Allow ordinary project file inspection.

### PERM-002 — Source editing
Require approval before modifying source code.

### PERM-003 — Specification editing
Require approval before modifying specifications.

### PERM-004 — Progress editing
Allow automatic updates only to designated progress files.

### PERM-005 — Shell execution
Deny agent-initiated shell commands.

### PERM-006 — Testing
The user runs applications, tests, and build commands.

### PERM-007 — Formatting
The user runs language-specific formatters.
Do not automatically execute formatters or hooks.

### PERM-008 — Secrets
Protect credentials, environment secrets, and SSH keys.

### PERM-009 — Remote operations
Do not independently execute SSH, SCP, deployment,
patching, or other remote operations.

## 7. Research and Skills

### WEB-001 — Web research
Allow supported web-search and web-fetch tools.

### SKILL-001 — Global library
Keep reusable skills in the user configuration directory.

### SKILL-002 — Project selection
Allow projects to restrict which global skills are usable.

### SKILL-003 — Requirements skill
Provide a requirements-to-spec workflow.

### SKILL-004 — Progress skill
Provide a task-tracking and resumption workflow.

### SKILL-005 — Review skill
Provide a read-only code-review workflow.

### SKILL-006 — Third-party skills
Allow selectively adding reviewed external skills later.

## 8. Quality and Safety

### QA-001 — Controlled implementation
Implement only requested or approved tasks.

### QA-002 — Human verification
Ask the user to run relevant commands and provide output.

### QA-003 — Accurate reporting
Distinguish implemented work from tested work.

### QA-004 — No unrelated changes
Keep edits focused on the current task.

### QA-005 — Traceability
Maintain mappings between requirements, tasks, files,
and verification evidence.

## 9. Acceptance Criteria

The setup is accepted only when:

- OpenCode 2 launches successfully.
- ChatGPT authentication works.
- An available model responds.
- Builder is the default primary agent.
- Advisor is selectable and cannot edit files.
- Source edits trigger approval.
- Progress edits work without approval.
- Shell commands are denied.
- Skills load and project filtering works.
- Requirements can become specifications.
- Progress survives restarting OpenCode.
- The agent can resume from project documents.
- The user can supply test output for verification.

## 10. Deferred Features

Not part of initial setup:

- Autonomous application execution
- Automatic tests or formatters
- Remote SSH execution
- MCP integrations
- Third-party agent orchestration
- Automatic Git commits
- Unattended background development
- Production deployment
