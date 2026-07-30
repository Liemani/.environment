# AGENTS

New AI agents should begin by reading the source documents directly.

## Read In Order

1. `README.md`
2. `PRINCIPLES.md`
3. `memory/index.md`

## Source Of Truth

- `README.md` = what this project is and how to navigate it
- `PRINCIPLES.md` = why this project is organized this way
- `memory/index.md` = project memory entry point
- `memory/records/index.md` = record collection entry point
- `memory/indexes/index.md` = index collection entry point
- `memory/*` = project memory documents and navigation
- `memory/*/index.md` = what each collection does
- `memory/indexes/template.md`, `memory/wiki/template.md`, `memory/records/*/template.md` = local guide docs for their own document type
- `raw/*` = unreconciled source inputs
- `config/*` = editable environment configuration sources
- `profile/profile.ini` = machine-specific input, created from `profile/profile.ini.sample`
- `effective/*` = built runtime configuration; do not edit or commit it
- When creating a new memory document, inspect the local `template.md` first and copy only the template block.

## Guidelines

- Prefer existing structures over introducing new ones.
- Avoid duplicating information across documents.
- Keep the system minimal.
