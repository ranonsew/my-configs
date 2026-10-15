---
name: code-review
description: Review source code for correctness, maintainability, security, and requirement coverage without executing or modifying it.
---

# Code Review

Use this skill when the user requests a code review
or wants to verify implementation against requirements.

## Inputs

Read relevant:
- Source files
- Tests
- Requirements
- Progress records
- User-provided errors and test output

## Review areas

1. Correctness
2. Requirement coverage
3. Error handling
4. Security
5. Maintainability
6. Portability
7. Test coverage
8. Unnecessary complexity

## Output

For each finding, include:
- Severity
- File and relevant location
- Explanation
- Suggested correction
- Related requirement or task ID, if applicable

Separate confirmed problems from possible risks.

## Restrictions

Do not modify files.

Do not execute commands.

Do not claim tests passed unless evidence was provided.

Do not invent issues merely to produce findings.
