---
name: context-continuity
description: Maintain task context, decisions, constraints, corrections, and progress across follow-ups and sessions. Use for ongoing development, debugging, architecture decisions, recommendations, and requirement changes.
compatibility: opencode
---

# Context Continuity and Task-State Management

## Purpose

Maintain continuity throughout an ongoing task.

Treat conversation as an evolving task state, not a sequence
of unrelated requests.

Prevent unnecessary changes to established decisions,
architecture, scope, and previously verified facts.

This skill defines a behavioral workflow and a durable
Markdown state format.

It does not independently execute between messages.

## 1. State location

Store state inside the current project:

.context/
  INDEX.md
  tasks/
    TASK-001.md
  archive/

Use one file per logical task.

Never store project state in the global skill directory.

Never mix state between repositories.

If the project has no .context directory, create one
when persistent tracking is warranted and permitted.

Use the templates provided with this skill.

If files cannot be written, maintain continuity using
available session context and explain the persistence
limitation only when relevant.

## 2. Session initialization

At the beginning of a project session:

1. Inspect .context/INDEX.md if it exists.
2. Identify the active task.
3. Read only the relevant task-state file.
4. Read relevant project instructions and requirements.
5. Reconcile durable state with current repository evidence.
6. Continue the existing task unless the user requests
   a different one.

Do not load every archived task.

Do not ask the user to repeat information already available
in the repository, state files, or current session.

## 3. Task identity

Every tracked task must have:

- Stable task ID
- Original objective
- Desired outcome
- Current scope
- Definition of completion
- Current status

Preserve the original objective separately from later
changes.

A new conversation does not necessarily mean a new task.

A new question does not necessarily mean a new task.

## 4. Evidence categories

Keep these categories separate:

VERIFIED:
Confirmed by inspected code, configuration, test results,
or other reliable evidence.

USER-REPORTED:
Information explicitly supplied by the user but not
independently verified.

ASSUMPTION:
A working premise that has not been verified.

RECOMMENDATION:
An approach proposed by the agent.

DECISION:
An approach explicitly selected by the user or otherwise
established as the current agreed direction.

UNKNOWN:
Information not yet established.

Never silently promote assumptions to verified facts.

When evidence changes, update the category and record
the reason.

## 5. Message classification

Before responding, determine whether the message is:

A. Follow-up question
B. Clarification request
C. New information
D. Correction
E. Explicit change request
F. Debugging report
G. Progress update
H. New task
I. Criticism or feedback about the response

A message may belong to multiple categories.

Classification is internal; do not display it unless useful.

## 6. Questions are not change requests

Examples:

"Why X instead of Y?"
  -> Explain the existing decision and tradeoffs.

"What about Y?"
  -> Evaluate Y against existing constraints.

"Would Y work?"
  -> Assess feasibility without replacing X.

"Use Y instead of X."
  -> Treat as an explicit change request.

"X is incorrect; the actual value is Z."
  -> Treat as a correction.

Do not reverse decisions merely because an alternative
was mentioned.

Do not interpret criticism as permission to redesign.

## 7. Decision preservation

Before changing an established decision:

1. Identify the existing decision.
2. Identify the new evidence, correction, or requirement.
3. Evaluate whether the decision is still valid.
4. Explain why a change is necessary, if applicable.
5. Specify the exact changes.
6. Preserve everything unaffected.
7. Update the decision record when permitted.

Record for each decision:

- Decision ID
- Status
- Chosen approach
- Alternatives considered
- Rationale
- Tradeoffs
- Confidence
- Evidence
- Conditions that would justify revisiting it

Possible statuses:

- Proposed
- Accepted
- Superseded
- Rejected
- Under Review

Never silently replace an Accepted decision.

If new evidence conflicts with an accepted decision,
explain the conflict before recommending a change.

## 8. Corrections

When the user corrects information:

1. Identify the specific earlier claim.
2. Record the corrected information.
3. Mark the earlier claim as superseded.
4. Identify affected decisions, tasks, and files.
5. Update only the affected state.
6. Use the corrected information going forward.

Do not repeat the previous incorrect claim as current.

Distinguish corrections from preferences and questions.

If the correction conflicts with independently verified
evidence, explain the conflict without dismissing either.

## 9. Debugging

When a bug is reported:

1. Identify the exact failing behavior.
2. Read the existing implementation.
3. Check relevant state and previous decisions.
4. Identify evidence from logs, errors, or tests.
5. Determine the smallest plausible fix.
6. Preserve existing architecture unless necessary.
7. Modify only relevant files after required approval.
8. Record the outcome and verification status.

Do not recreate classes, modules, or functions merely
because the current implementation contains a bug.

Do not discard working code.

Do not treat a bug report as a request to redesign.

If the actual code is available, inspect it before asking
the user to paste it again.

## 10. Requirements changes

For an explicit requirement change:

1. Preserve the original objective.
2. Record the new or modified requirement.
3. Identify affected decisions.
4. Identify affected tasks and source files.
5. Explain the impact.
6. Update the active scope.
7. Preserve unaffected requirements.
8. Update state when permitted.

A change to one platform, dependency, or function does not
automatically invalidate the entire architecture.

## 11. Progress tracking

Record:

- Completed work
- Current work
- Pending work
- Blockers
- Known bugs
- Files involved
- Tests performed
- Verification results
- Next action

Use these statuses:

- Planned
- In Progress
- Implemented
- Awaiting Verification
- Verified
- Blocked
- Superseded

Do not mark work Verified without evidence.

Distinguish code written from code executed and tested.

## 12. Response behavior

Answer the user's actual question first.

Preserve established context.

Do not substitute apologies or acknowledgments for answers.

Do not repeat explanations already resolved unless
new information makes them relevant.

Do not invent missing information.

Do not ask for information already available.

When uncertain, state the uncertainty.

When an earlier recommendation remains valid, explain why.

When it changes, explain the evidence and exact impact.

## 13. State updates

Update persistent state after meaningful events:

- Objective established
- Requirement added or changed
- Important fact corrected
- Decision accepted or superseded
- Implementation milestone reached
- Bug confirmed or resolved
- Verification completed
- Task blocked or completed

Do not write state after every message.

Do not save ordinary conversational filler.

Do not save every intermediate thought.

Preserve concise rationale, not private chain-of-thought.

Do not store passwords, API keys, tokens, SSH private keys,
or other secrets.

Use sanitized descriptions when necessary.

Respect file-edit permissions and user approvals.

## 14. Write discipline

Before updating state:

1. Read the latest file.
2. Preserve unrelated sections.
3. Make the smallest necessary edit.
4. Avoid duplicate decisions or task IDs.
5. Do not overwrite user corrections.
6. Keep entries concise and factual.

If concurrent changes or conflicting state are detected,
ask before overwriting them.

If an edit is denied, continue without claiming it succeeded.

## 15. Task lifecycle

CREATE:
Create a state file when a substantive task begins.

READ:
Read the active task at session startup or when resuming.

UPDATE:
Write only after meaningful changes.

SWITCH:
Change active task in INDEX.md when the user changes focus.

ARCHIVE:
Move completed or abandoned tasks into archive after
appropriate confirmation.

DELETE:
Delete state only when explicitly requested.

Never delete original project files as part of state cleanup.

## 16. Conflict resolution

When conversation and state disagree:

1. Inspect relevant evidence.
2. Identify which information is newer.
3. Distinguish corrections from unsupported claims.
4. Explain any unresolved conflict.
5. Prefer verified evidence where applicable.
6. Do not silently overwrite accepted decisions.

Treat state files as records, not unquestionable truth.

## 17. Compaction and session recovery

Before long work or expected compaction, ensure meaningful
decisions and progress are recorded when possible.

After compaction or a new session:

1. Read INDEX.md.
2. Read the active task file.
3. Reconcile with current repository evidence.
4. Continue from the recorded next action.

Do not claim automatic recovery occurred unless the state
was actually loaded.

## 18. Completion

A task is complete only when its definition of completion
is satisfied.

Summarize:
- What was accomplished
- What was verified
- What remains uncertain
- Any remaining work

Archive only according to the user's instructions.

## 19. Skill boundaries

This skill does not:

- Guarantee perfect memory
- Automatically intercept every message
- Override OpenCode permissions
- Guarantee state writes
- Replace native session history
- Execute independently between prompts

For automatic invocation, use persistent agent instructions.

For automatic state injection, use a compatible OpenCode
plugin if one has been installed and tested.
