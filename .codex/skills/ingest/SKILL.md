---
name: ingest
description: Use when ingesting newly added or explicitly requested raw sources from raw/ into the Obsidian LLM wiki. Reads sources, summarizes them, updates wiki pages, index.md, log.md, and ingest reports without modifying raw files.
---

---

# Wiki Ingest Skill

You maintain a Karpathy-style LLM wiki with three layers:

- `raw/` contains immutable source material.
- `wiki/` contains synthesized Markdown pages.
- `AGENTS.md`, `index.md`, and `log.md` define the schema and history.

## Core principles

- Preserve raw sources exactly as they are.
- Prefer source-grounded synthesis over broad background explanation.
- Avoid page explosion.
- Prefer updating existing pages over creating duplicate pages.
- Keep every important claim traceable to a raw source.
- Ask before making broad structural changes.

## Required workflow

### 1. Read repository context

Before ingesting, read these files if they exist:

- `AGENTS.md`
- `index.md`
- `log.md`

Also inspect:

- `output/ingest-report/`
- existing related pages under `wiki/`

### 2. Determine ingest scope

If the user names one or more files, ingest only those files.

If the user says "current source", "new source", "newly created data", "latest clip", or gives no specific file, scan `raw/` for unprocessed files.

Treat a raw file as already processed if it is referenced in at least one of:

- `log.md`
- `index.md`
- a `Sources` section in `wiki/`
- an existing ingest report under `output/ingest-report/`

Treat a raw file as unprocessed if no reliable reference to it exists.

If the scope is ambiguous, present the candidate source list and ask for confirmation before editing.

### 3. Read selected sources

Read all selected raw sources.

Do not modify, rename, move, or delete raw files.

Classify each source as:

- `high-quality`: clear, relevant, source-backed, useful for the wiki
- `medium-quality`: useful but incomplete, narrow, or partially unclear
- `low-quality`: too ambiguous, noisy, irrelevant, duplicated, or unsupported

Low-quality sources should not create new wiki pages unless the user explicitly asks.

### 4. Create an ingest plan before editing

Before changing files, produce a short ingest plan containing:

- selected source files
- source quality classification
- proposed new pages
- proposed existing pages to update
- proposed index/log/report changes
- risks or ambiguities

Ask for confirmation before major edits when:

- more than 5 wiki pages would be changed
- new top-level folders would be created
- the source contradicts existing wiki content
- the source is ambiguous or low-quality
- the ingest would reshape the wiki structure

### 5. Extract source-grounded knowledge

Extract only information supported by the selected raw sources:

- key claims
- concepts
- tools
- entities
- projects
- workflows
- decisions
- contradictions
- open questions
- project relevance
- source limitations

Do not add unsourced general background knowledge.

### 6. Create or update wiki pages

Create or update pages under `wiki/`.

Every new or updated page must be primarily grounded in the selected raw sources.

Create a source summary page for each ingested source or tightly related batch.

Create separate concept/entity/tool/project pages only when the item is central to the source and useful for future retrieval.

Do not create separate pages for minor mentions.

Do not create pages for:

- implementation mechanics
- repo administration
- Codex behavior
- Obsidian setup
- ingest/lint/query workflow
- general background knowledge

unless the selected raw source is explicitly about that topic.

If a source only supports a short note, keep it inside the source summary page.

### 7. Update existing pages carefully

Update existing related pages only when the selected source adds new source-backed information.

Preserve existing claims.

If the new source contradicts an existing page:

- do not silently overwrite
- add a `Contradictions` or `Notes` section
- explain the conflict
- cite the relevant raw source path

### 8. Use Obsidian links

Use Obsidian links for internal references:

- `[[page-name]]`
- `[[folder/page-name]]`

Only link to pages that already exist or that are newly created during this ingest.

Avoid creating links to unjustified future pages.

### 9. Update `index.md`

Update `index.md` with every important new or significantly updated page.

Each index entry should include:

- Obsidian link
- one-line summary
- category
- source relationship when useful

### 10. Update `log.md`

Append a dated entry to `log.md`.

Use this format:

## YYYY-MM-DD — ingest — topic

Summary:

- ...

Sources ingested:

- `raw/...`

Wiki pages created:

- `wiki/...`

Wiki pages updated:

- `wiki/...`

Reports:

- `output/ingest-report/...`

Open questions:

- ...

Do not replace old log entries.

### 11. Create ingest report

Create or update a Markdown report under:

`output/ingest-report/`

Use this filename format:

`YYYY-MM-DD-topic-ingest-report.md`

Avoid characters such as `|`, `:`, `?`, `*`, `<`, `>`, and `"` in filenames.

If a report already exists for the same day and topic, update that report instead of creating a duplicate.

The report must include:

# Ingest Report: Topic

## Date

## Sources selected

## Source quality

## Summary

## Key takeaways

## Pages created

## Pages updated

## Index updates

## Log update

## Contradictions or risks

## Open questions

## Next actions

### 12. Final response

After editing, report:

- sources ingested
- pages created
- pages updated
- report path
- unresolved issues
- recommended next action

Do not claim that a source was ingested unless it was actually processed and recorded in `log.md`.
