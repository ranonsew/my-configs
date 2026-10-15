# Skill Appendix: progress-tracking

## Purpose

Maintain a durable, traceable record of implementation work: what is planned, what changed, what is blocked, and what has supporting verification evidence.

This is an instruction set, not a task runner or test runner.

## What it does

- Maps stable task IDs to requirement IDs.
- Records dependencies and relevant files.
- Distinguishes proposed file mappings from actual changes.
- Tracks implementation status, blockers, and next actions.
- Supplies verification instructions and records user-provided evidence.
- Updates affected tasks when requirements change without silently deleting history.

## What it requires

| Input or condition | Purpose |
|---|---|
| `requirements/specification.md` | Approved requirements and constraints to map tasks against |
| `progress/tasks.md` | Primary durable implementation progress record |
| Implementation information and inspected files | Record actual changes rather than guesses |
| User-provided command output or other acceptance evidence | Support verification status |
| Permission to update designated progress documents | Persist progress without changing unrelated files |

At startup, identify incomplete work, blockers, and tasks awaiting verification.

## Required task fields

| Field | Contents |
|---|---|
| Task ID | Stable identifier, such as `TASK-007` |
| Title | Focused deliverable |
| Requirement IDs | Requirements covered by the task |
| Dependencies | Work that must precede it |
| Relevant files | Proposed files or actual files changed, clearly distinguished |
| Status | Current implementation and verification state |
| Implementation notes | Changes made, important details, and blockers |
| Verification instructions | Exact checks for the user to perform |
| Verification evidence | Supplied results, or an explicit statement that none is available |

## Status lifecycle

```text
Planned -> In Progress -> Implemented -> Awaiting Verification -> Verified
```

| Status | Meaning |
|---|---|
| Planned | Work identified but not started |
| In Progress | Work actively being performed |
| Implemented | Changes written; not necessarily executed or tested |
| Awaiting Verification | Ready for user-run checks or acceptance |
| Verified | User-supplied evidence supports the task's verification criteria |
| Blocked | Work cannot proceed; reason recorded |

If verification fails, return the task to In Progress or Blocked and explain why. Preserve superseded task history rather than silently deleting it; follow the project's allowed status vocabulary.

## When to use it

| Scenario | Recommended use |
|---|---|
| General conversational chatbot | Usually unnecessary |
| One small, disposable change | A short checklist may suffice if project rules allow |
| Small maintained application | Lightweight task records with file mappings and evidence |
| Large or multi-session application | Core workflow with dependencies and requirement mappings |
| Programming-advice chatbot following implementation | Useful when tracking actual deliverables and user-run checks |
| Building a chatbot application | Track UI, backend, integrations, evaluations, and verification tasks |

## Typical workflow

1. Read the approved specification and current tasks.
2. Break requested work into stable, focused tasks.
3. Map requirements, dependencies, and proposed files.
4. Record actual implementation changes after authorized work.
5. Provide exact user-run verification instructions.
6. Record supplied evidence and unresolved failures.
7. Mark Verified only when evidence supports the task's criteria.

Example traceability:

```text
REQ-004 -> TASK-007 -> Relevant source files -> Review findings -> Verification evidence
```

## Configuration and invocation

- Project `AGENTS.md` instructions can require task updates after meaningful changes.
- Use manually for planning, resumption, milestone reporting, or requirement changes.
- Keep small-project records compact; expand detail as dependencies and risk grow.
- Do not create formal task tracking for every casual exchange unless required.
- Updates happen only when the assistant is invoked and has the necessary permissions.

## Relationship to the other skills

| Skill | Relationship |
|---|---|
| [requirements-to-spec](Skill_requirements-to-spec.md) | Supplies the requirements and acceptance criteria |
| [context-continuity](Skill_context-continuity.md) | Preserves objectives, decisions, and next actions across sessions |
| [code-review](Skill_code-review.md) | Supplies findings that may require corrective tasks or revised status |

## Boundaries

- Does not modify source code as part of tracking.
- Does not run tests or applications.
- Does not invent verification results.
- Does not equate code written, static review, or a recommendation with successful runtime verification.
- Automatic updates are limited to designated progress documents and actual permissions.
