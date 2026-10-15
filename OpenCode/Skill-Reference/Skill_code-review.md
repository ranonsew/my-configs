# Skill Appendix: code-review

## Purpose

Inspect source code for correctness, maintainability, security, and requirement coverage without modifying files or executing commands.

This is a static review workflow, not an automated test suite or proof that code works.

## What it does

- Reads relevant source, tests, requirements, and progress records.
- Examines user-provided errors and test output.
- Checks correctness, error handling, security, portability, and maintainability.
- Looks for missing requirement coverage and unnecessary complexity.
- Evaluates test coverage through inspection.
- Separates confirmed problems from possible risks.
- Reports actionable findings without inventing issues to fill a quota.

## What it requires

| Input or condition | Purpose |
|---|---|
| Relevant source files | Primary evidence for findings |
| Review scope or objective | Focus on a change, module, defect, or requirement set |
| Requirements and acceptance criteria, where available | Assess intended behavior and coverage |
| Tests and progress records, where relevant | Understand expected checks and implementation status |
| User-supplied errors or test results, if available | Assess reported failures without claiming execution |

Without requirements, a review can still inspect code quality and likely defects, but cannot reliably establish full requirement coverage.

## Review areas

1. Correctness.
2. Requirement coverage.
3. Error handling.
4. Security.
5. Maintainability.
6. Portability.
7. Test coverage.
8. Unnecessary complexity.

## Finding format

| Field | Contents |
|---|---|
| Severity | Relative impact or urgency |
| Location | File and relevant line, symbol, or section |
| Explanation | What is wrong or risky and why it matters |
| Suggested correction | Focused remediation without applying it |
| Requirement or task ID | Traceability where available |
| Evidence qualification | Confirmed problem versus possible risk |

No findings means no issues were identified within the inspected scope; it does not guarantee correctness or security.

## When to use it

| Scenario | Recommended use |
|---|---|
| General conversational chatbot | Unnecessary unless discussing an actual code review |
| Tiny script | Brief review before relying on it |
| Small maintained application | At meaningful changes and before acceptance |
| Large application | Incremental reviews by change, feature, or risk area |
| Existing bug | Inspect the implementation and supplied evidence before proposing a fix |
| Security-sensitive project | Core safeguard, alongside independent security testing and runtime verification |
| Building a chatbot application | Inspect access controls, secret handling, data isolation, integrations, and error handling |

For chatbot applications, code review does not replace behavioral evaluations, adversarial testing, or monitoring.

## Typical workflow

1. Establish the review scope.
2. Read relevant requirements, source, tests, and state.
3. Inspect behavior and evidence without executing commands.
4. Report confirmed defects separately from possible risks.
5. Suggest focused corrections.
6. Treat implementation as a separate, approved activity.
7. Request user-run verification when needed after corrections.

## Configuration and invocation

- Invoke manually when requesting a review or requirement-coverage assessment.
- Project instructions can require reviews at feature or acceptance milestones.
- Prefer frequent, scoped reviews over one large review at the end.
- A reviewer workflow remains read-only even when other project activities permit edits.
- Loading the skill does not automatically review future changes.

## Relationship to the other skills

| Skill | Relationship |
|---|---|
| [requirements-to-spec](Skill_requirements-to-spec.md) | Defines intended behavior and acceptance criteria |
| [context-continuity](Skill_context-continuity.md) | Supplies established decisions, known issues, and relevant history |
| [progress-tracking](Skill_progress-tracking.md) | Tracks corrective work and subsequent user-provided verification evidence |

Review findings can inform later progress updates, but this review skill itself does not edit files.

## Boundaries

- Does not modify source, documentation, or state files.
- Does not execute commands, tests, builds, or applications.
- Does not claim tests passed without supplied evidence.
- Does not authorize a redesign merely because an alternative is mentioned.
- Does not replace runtime checks, specialist audits, or user acceptance.
