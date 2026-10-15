---
name: requirements-to-spec
description: Convert informal requirements into a structured, traceable software specification after clarification.
---

# Requirements-to-Spec Workflow

Use this skill when starting a project, refining initial
requirements, or processing requirement changes.

## Inputs

Read:
- requirements/initial.md
- requirements/specification.md, if present
- progress/tasks.md, if present

## Procedure

1. Extract explicit requirements.
2. Identify ambiguities and contradictions.
3. Identify functional and non-functional requirements.
4. Identify constraints and assumptions.
5. Ask focused clarification questions.
6. Record agreed decisions.
7. Propose a structured specification.
8. Request approval before writing the specification.
9. Preserve existing stable requirement IDs.
10. Record changes without silently removing requirements.

## Specification structure

Include:
- Overview
- Goals
- Out of scope
- Functional requirements
- Non-functional requirements
- Constraints
- Architecture decisions
- Open questions
- Acceptance criteria
- Change history

## Rules

Do not invent user requirements.

Do not implement code as part of specification creation.

Keep the original requirements file unchanged.

Do not overwrite an existing specification without
considering its previous decisions.

Use stable IDs such as REQ-001.
