# Skill Appendix: requirements-to-spec

## Purpose

Turn informal requirements into a structured, traceable specification before implementation. Use this skill to clarify what should be built, what is excluded, and how success will be assessed.

This is an instruction set for the assistant, not an executable tool or background process.

## What it does

- Extracts explicit functional and non-functional requirements.
- Identifies ambiguities, contradictions, constraints, assumptions, and open questions.
- Asks focused clarification questions rather than inventing requirements.
- Records agreed decisions and stable requirement IDs, such as `REQ-001`.
- Proposes a specification and requests approval before writing it.
- Preserves original requirements and existing accepted decisions.
- Assesses requirement changes without silently removing earlier requirements.

## What it requires

| Input or condition | Purpose |
|---|---|
| `requirements/initial.md` | Original requirements; kept unchanged |
| `requirements/specification.md`, if present | Existing specification, IDs, and decisions to preserve |
| `progress/tasks.md`, if present | Existing task mappings and implementation context |
| User clarification | Resolve important gaps and contradictions |
| User approval and file-edit permission | Required before writing or changing the specification |

If required information is unavailable, request it rather than treating an assumption as an approved requirement.

## Expected output

The specification includes:

1. Overview and goals.
2. Out-of-scope behavior.
3. Functional requirements.
4. Non-functional requirements.
5. Constraints and assumptions.
6. Architecture decisions.
7. Open questions.
8. Acceptance criteria.
9. Change history.

## When to use it

| Scenario | Recommended use |
|---|---|
| One-off explanation or code question | Usually unnecessary |
| Disposable script | Lightweight clarification may be enough, subject to project rules |
| Small maintained application | Short specification with stable IDs and acceptance criteria |
| Large or long-lived application | Core workflow; explicit requirements and traceability |
| Conversational chatbot for general advice | Use when turning an idea into a defined project |
| Building a chatbot application | Define supported behavior, privacy expectations, access rules, and acceptance criteria |
| Existing bug | Use if intended behavior is unclear or requirements are changing; not every bug requires a new specification |

These are recommendations, not permission to bypass an existing project's required process.

## Typical workflow

1. Read original requirements and existing records.
2. Identify missing details and contradictions.
3. Ask clarification questions.
4. Propose the specification.
5. Obtain approval before writing it.
6. Hand approved requirements to progress-tracking for task planning.
7. Wait for an explicit implementation request before coding.

## Configuration and invocation

- Invoke manually for a new project or explicit requirement change.
- Project `AGENTS.md` instructions can require it at those milestones.
- Global instructions can encourage clarification without requiring a formal specification for every casual question.
- Loading the skill does not independently monitor future changes or write files.

## Relationship to the other skills

| Skill | Relationship |
|---|---|
| [context-continuity](Skill_context-continuity.md) | Preserves the reasons behind requirements and accepted decisions |
| [progress-tracking](Skill_progress-tracking.md) | Maps approved requirements to implementation tasks and evidence |
| [code-review](Skill_code-review.md) | Checks implementation against specified behavior and constraints |

## Boundaries

- Does not implement code as part of specification creation.
- Does not authorize implementation merely because a specification is approved.
- Does not overwrite original requirements or silently replace accepted decisions.
- Does not prove that an implementation meets the specification; verification requires evidence.
- Available actions depend on actual session permissions, not the skill name.
