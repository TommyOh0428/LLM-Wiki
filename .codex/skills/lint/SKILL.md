---
name: lint
description: Health-check the Obsidian LLM wiki for contradictions, stale claims, orphan pages, missing links, duplicated pages, missing index entries, missing log records, weak source grounding, and unprocessed raw sources. Use for wiki maintenance, not for ingesting or answering normal questions.
---

# Wiki Lint Skill

Use this skill to audit and maintain the Obsidian LLM wiki.

Do not use this skill for:

- ingesting new raw sources
- answering a normal wiki query
- editing raw files
- broad restructuring without user approval
- adding unsourced background knowledge

## Core principles

- Audit first, fix second.
- Never modify `raw/`.
- Prefer small safe fixes over large rewrites.
- Preserve existing claims unless they are clearly contradicted by better source-backed information.
- Report uncertainty instead of guessing.
- Keep the wiki usable, linked, source-grounded, and easy to navigate.

## Required workflow

### 1. Load wiki context

Read these first if they exist:

- `AGENTS.md`
- `index.md`
- `log.md`

Then inspect the main folders:

- `raw/`
- `wiki/`
- `output/`
- `outputs/`
- `.agents/skills/`

Use existing conventions from the repository.

### 2. Determine lint scope

If the user provides a scope, lint only that scope.

Possible scopes:

- whole wiki
- `wiki/`
- `wiki/concepts/`
- `wiki/projects/`
- `wiki/tools/`
- `wiki/questions/`
- `raw/`
- `index.md`
- `log.md`

If no scope is provided, lint the whole wiki.

Before making edits, summarize:

- scope
- checks to perform
- whether this is audit-only or fix mode
- files/folders likely to be inspected

### 3. Modes

Default mode is audit-only.

In audit-only mode:

- inspect the wiki
- create a lint report
- do not modify wiki pages except the lint report itself
- do not update `index.md` or `log.md` unless the user requested reporting history

In fix mode:

- perform safe fixes only
- update `index.md` when needed
- append a lint entry to `log.md`
- create or update the lint report

Ask before fix mode if the user did not explicitly request fixes.

### 4. Lint checks

Check for:

#### Source grounding

- pages without a `Sources` section
- important claims without source references
- pages that cite raw files that do not exist
- raw sources referenced in wiki pages but missing from `log.md`
- wiki pages that appear to contain unsourced background knowledge

#### Raw source processing

- raw files that do not appear in:
  - `log.md`
  - `index.md`
  - `wiki/**`
  - `output/ingest-report/**`
  - `outputs/ingest-report/**`

- raw files with unclear naming
- raw files that appear duplicated

#### Index health

- important wiki pages missing from `index.md`
- `index.md` links pointing to missing pages
- index entries with stale summaries
- index categories that no longer match folder structure
- important folders not represented in `index.md`

#### Log health

- created or updated wiki pages without corresponding `log.md` records
- ingest/query/lint reports not mentioned in `log.md`
- log entries missing source lists or report links
- inconsistent log entry formats

#### Link health

- broken Obsidian links
- orphan wiki pages with no inbound links
- pages with no outbound links
- excessive link spam
- important related pages not linked to each other

#### Duplication

- duplicate or near-duplicate pages
- overlapping concept pages
- source summary pages that repeat the same content unnecessarily
- multiple reports for the same date/topic that should be consolidated

#### Contradictions

- pages that make conflicting claims
- newer source-backed claims that supersede older claims
- project decisions that conflict with current project pages
- unresolved contradictions that should become open questions

#### Staleness

- pages with old claims but no date context
- project pages that appear inactive or outdated
- tool setup pages that may be version-sensitive
- decisions that lack current status

#### Structure

- files in the wrong folder
- inconsistent filename style
- missing expected sections
- weak page titles
- pages that should be split
- pages that should be merged, but only recommend merging unless user approves

### 5. Safe fixes

Safe to fix in fix mode:

- broken internal links when the correct target is obvious
- missing `index.md` entries for important pages
- small formatting inconsistencies
- missing `Related pages` sections
- missing `Sources` section placeholder when sources are clearly present elsewhere in the page
- adding backlinks between clearly related existing pages
- adding a `log.md` lint entry
- updating or creating a lint report

Do not ask before these if user explicitly requested fix mode.

### 6. Risky fixes requiring approval

Ask before:

- deleting pages
- renaming files
- moving files
- merging pages
- splitting pages
- rewriting major sections
- changing folder structure
- changing source-grounded claims
- marking claims as outdated without clear evidence
- modifying raw files
- changing `AGENTS.md`
- changing skill files under `.agents/skills/`

### 7. Report location

Create reports under:

- `output/lint-report/`

If the repo already uses `outputs/lint-report/`, follow the existing convention.

Create the folder if it does not exist.

### 8. Report filename convention

Use this format:

```txt
YYYY-MM-DD - topic - lint-report.md
```

Examples:

```txt
2026-05-24 - whole-wiki - lint-report.md
2026-05-24 - concepts-folder - lint-report.md
2026-05-24 - raw-processing - lint-report.md
```

Use lowercase kebab-case for the topic.

Do not use `|` in filenames.

### 9. Lint report template

Use this structure:

```md
# Lint Report: Topic

## Scope

## Mode

Audit-only or fix mode.

## Summary

## High-priority issues

## Medium-priority issues

## Low-priority issues

## Source grounding issues

## Unprocessed raw sources

## Broken or weak links

## Orphan pages

## Missing index entries

## Missing log records

## Duplicates or overlaps

## Contradictions

## Stale claims

## Safe fixes applied

## Risky fixes requiring approval

## Recommended next investigations

## Files inspected

## Files changed

## Verification
```

### 10. Update `log.md`

Only update `log.md` when:

- user requested fix mode
- a lint report was created and the wiki convention requires report tracking
- the user explicitly asked to record the lint run

Use this format:

```md
## YYYY-MM-DD | lint | Topic

Scope:

- ...

Mode:

- audit-only or fix

Summary:

- ...

Reports:

- `output/lint-report/...`

Safe fixes applied:

- ...

Unresolved issues:

- ...

Recommended next investigations:

- ...
```

### 11. Verification commands

Use local commands when possible.

Useful commands:

```bash
find raw -type f | sort
find wiki -type f | sort
find output outputs -type f 2>/dev/null | sort
rg -n "\[\[[^]]+\]\]" wiki index.md log.md
rg -n "Sources|Source|raw/" wiki index.md log.md output outputs
rg -n "TODO|TBD|unknown|unclear|outdated|deprecated|contradiction" wiki index.md log.md
git status --short
git diff -- raw/
```

For broken Obsidian links, compare `[[page-name]]` references against actual Markdown filenames when practical.

For unprocessed raw sources, compare raw file paths against:

```bash
rg -n "raw/" log.md index.md wiki output outputs
```

### 12. Final response

End with a concise summary:

- lint scope
- mode
- report path
- number of high/medium/low-priority issues
- safe fixes applied
- unresolved issues
- risky fixes requiring approval
- recommended next action
