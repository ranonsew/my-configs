# Skill Appendix: context-continuity

## Purpose

Preserve an ongoing task's objective, decisions, corrections, evidence, and next action across conversations and sessions. Treat follow-up questions as continuations rather than automatic requests to redesign or change scope.

This is an instruction set, not automatic memory or a background process.

## What it does

- Recovers the active task at session startup.
- Separates the original objective from later scope changes.
- Preserves accepted decisions unless new evidence justifies revisiting them.
- Distinguishes questions, corrections, debugging reports, and explicit change requests.
- Records meaningful milestones and next actions.
- Reconciles stored state with current project evidence.
- Keeps verified facts separate from assumptions and recommendations.

## What it requires

| Input or condition | Purpose |
|---|---|
| Conversation and relevant project evidence | Establish current facts, objectives, and constraints |
| `.context/INDEX.md`, if present | Identify the active task |
| Relevant task-state file | Recover decisions, progress, blockers, and next action |
| Project instructions and requirements | Respect established process and scope |
| Write permission | Required to persist or update state |

When files cannot be written, use available conversation context without claiming durable persistence.

## Persistent layout

```text
.context/
  INDEX.md
  tasks/
    TASK-001.md
  archive/
```

- Use one state file per logical task and the skill's templates when available.
- Keep state in the project, not the global skill directory.
- Read the active task rather than loading every archived task.
- Create persistent state only when warranted and permitted.
- Archive with appropriate confirmation; delete state only when explicitly requested.

## Evidence categories

| Category | Meaning |
|---|---|
| VERIFIED | Supported by inspected code, configuration, results, or other reliable evidence |
| USER-REPORTED | Supplied by the user but not independently verified |
| ASSUMPTION | Unverified working premise |
| RECOMMENDATION | Proposed approach, not an accepted decision |
| DECISION | Established or explicitly selected direction |
| UNKNOWN | Not yet established |

A fact confirmed by static inspection does not establish runtime correctness. In this project, marking implementation tasks Verified requires user-supplied evidence.

## When to use it

| Scenario | Recommended use |
|---|---|
| One-off factual question | Usually unnecessary |
| Ongoing advisory chatbot | Useful for preserving goals, preferences, and decisions; project files may be unnecessary for casual conversation |
| Small multi-session project | Recommended; keep state concise |
| Large or long-lived project | Core workflow, with separate logical task records |
| Debugging or corrections | Recover prior decisions and update only affected facts |
| Resuming after a session change | Read the index and active state before proceeding |

## Typical workflow

1. Read the index and relevant active task.
2. Read project instructions and relevant requirements.
3. Reconcile records with available evidence.
4. Answer the actual question without assuming it requests changes.
5. Preserve unaffected decisions and implementation.
6. Update permitted state after meaningful changes.
7. Record a clear next action for resumption.

For example, “Would SQLite work?” requests an assessment. “Use SQLite instead of JSON” requests a change. Do not treat these as equivalent.

## Configuration and invocation

- Global `AGENTS.md` instructions are useful for continuity habits across projects.
- Project instructions can define when task state must be read or updated.
- Invoke when establishing substantive work, resuming, debugging, correcting facts, revisiting decisions, or changing requirements.
- Automatic state injection requires a compatible, installed, and verified integration; the skill itself does not provide it.

## Relationship to the other skills

| Skill | Relationship |
|---|---|
| [requirements-to-spec](Skill_requirements-to-spec.md) | Defines intended behavior; continuity preserves its rationale and accepted decisions |
| [progress-tracking](Skill_progress-tracking.md) | Tracks deliverables and verification; continuity tracks the task's broader context and next action |
| [code-review](Skill_code-review.md) | Provides findings that may affect current facts, decisions, and next steps |

Avoid duplicating full task lists across records. Keep `progress/tasks.md` as the durable implementation progress record and use continuity state for concise context.

## Boundaries

- Does not guarantee perfect memory or automatic recovery.
- Does not execute independently between prompts.
- Does not override file permissions or user approvals.
- Does not treat stored records as unquestionable truth.
- Does not store secrets or every conversational exchange.
- Does not modify state after editing has been denied.
