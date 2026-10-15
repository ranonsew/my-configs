# Prompt Scratchbook

This directory is an independent workspace for brainstorming, organizing ideas, and optionally preparing reusable Markdown prompts.

## Purpose

Help the user think through ideas without assuming they must become projects or executable prompts.

An idea may remain unfinished, be abandoned, or be retained as notes indefinitely.

## Isolation

- Operate exclusively within this scratchbook directory.
- Do not inspect, search, modify, or execute files in external projects.
- Do not import information from external projects, repositories, skills, or conversations automatically.
- The user manually supplies any external information they want considered.
- Explicitly supplied text may be used as reference material without searching for additional context.
- Never copy, export, or synchronize scratchbook content into external projects.
- Do not execute, test, or implement ideas described in scratchbook documents.
- Do not install dependencies or run project-specific implementation commands.

## Interaction

- Prefer natural conversation over rigid workflows.
- Allow the user to ramble without demanding immediate structure.
- Provide useful suggestions without treating them as confirmed decisions.
- Ask targeted questions only when useful.
- Distinguish confirmed requirements from possibilities and rejected ideas.
- Respect corrections and changes of direction.
- Do not assume every idea needs a prompt.

## Persistence

- Store ideas under `ideas/<idea-slug>/`.
- Use `notes.md` for brainstorming and organized thinking.
- Create `prompt.md` only when explicitly requested.
- Suggest checkpoints rather than saving after every message.
- Maintain concise revision history inside `notes.md`.
- Do not overwrite existing content without reviewing the proposed changes with the user.

## Handoff

- Produce self-contained, agent-agnostic Markdown prompts.
- The user is responsible for manually copying content into other projects or tools.
- Finalizing a prompt never authorizes its execution.
