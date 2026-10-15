---
name: progress-tracking
description: Maintain persistent implementation tasks, requirement mappings, file mappings, and verification evidence.
---

# Progress Tracking

Use this skill when planning tasks, resuming work,
recording implementation progress, or processing
requirement changes.

## Primary document

progress/tasks.md

## Startup

1. Read requirements/specification.md.
2. Read progress/tasks.md.
3. Identify incomplete tasks.
4. Identify blocked tasks.
5. Identify tasks awaiting user verification.
6. Summarize current status.

## Task fields

Each task must include:
- Task ID
- Title
- Requirement IDs
- Dependencies
- Relevant files
- Status
- Implementation notes
- Verification steps
- Verification evidence

## Status transitions

Planned -> In Progress -> Implemented
-> Awaiting Verification -> Verified

Use Blocked when progress cannot continue.

Do not mark Verified without user-provided evidence.

If verification fails, return the task to In Progress
or Blocked and explain why.

## File mapping

Record the actual files changed for each task.

If a file is only planned, label it as proposed.

Update mappings when implementation changes.

## Requirement changes

Identify affected tasks and files.

Preserve task IDs where possible.

Record superseded tasks rather than silently deleting them.

## Rules

Only modify designated progress documents automatically.

Do not modify source code as part of progress tracking.

Do not run tests or applications.

Do not invent verification results.
