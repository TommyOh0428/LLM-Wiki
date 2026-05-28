---
name: query
description: Answer questions against the Obsidian LLM wiki by searching existing wiki pages, synthesizing source-grounded answers, citing local files, identifying gaps or contradictions, and optionally saving valuable answers back into wiki/.
---

# Wiki Query Skill

Use this skill when the user asks a question that should be answered from the Obsidian LLM wiki.

Do not use this skill for:

- ingesting new raw sources
- linting the whole wiki
- general web research
- editing raw files
- answering only from general background knowledge

## Core principles

- Answer from the wiki first.
- Cite local files clearly.
- Separate sourced wiki knowledge from inference.
- Identify uncertainty, missing sources, and contradictions.
- Do not modify files unless the user asks to save the answer or create a report.
- Useful answers should be offered as new wiki pages so knowledge compounds over time.

## Required workflow

### 1. Load wiki context

Read these first if they exist:

- `AGENTS.md`
- `index.md`
- `log.md`

Use them to understand:

- wiki structure
- naming conventions
- source conventions
- existing categories
- previous ingest/query history

### 2. Understand the question

Classify the query type:

- factual lookup
- synthesis
- comparison
- project planning
- decision support
- contradiction check
- timeline/history
- concept explanation
- source coverage check

If the question is ambiguous, state the likely interpretation and continue with the most useful answer. Ask a clarification only when the answer would likely be wrong without it.

### 3. Search the wiki

Search relevant locations:

- `index.md`
- `wiki/`
- `log.md`
- `output/query-report/`
- `output/ingest-report/`
- `outputs/query-report/`
- `outputs/ingest-report/`

Prefer fast local search tools when available:

```bash
rg -n "keyword|related term|synonym" index.md wiki log.md output outputs
find wiki -type f | sort
```

Search with:

- exact terms from the question
- synonyms
- related project names
- related concept names
- linked page names from `index.md`

### 4. Select sources

Read the most relevant pages before answering.

Prioritize:

1. directly relevant wiki pages
2. source summary pages
3. project/concept/entity pages
4. previous query reports
5. `log.md` for timeline or provenance
6. raw sources only when wiki pages are insufficient and the user’s question requires original evidence

Do not rely only on filenames or index entries. Read page contents.

### 5. Evidence rules

For each important claim in the answer, connect it to one of:

- a wiki page path
- a raw source path
- a query report path
- an ingest report path
- a clearly marked inference based on cited wiki pages

Use local citations or clear file references such as:

- `wiki/concepts/cloud-run.md`
- `wiki/projects/fintech-pipeline.md`
- `raw/web/2026-05-24 - article.md`
- `output/ingest-report/2026-05-24 - llm-wiki - ingest-report.md`

When a claim is an inference, say so explicitly.

Do not invent citations.

### 6. Synthesize the answer

Answer in the format best suited to the question.

Possible formats:

- concise explanation
- comparison table
- decision matrix
- timeline
- project plan
- architecture summary
- pros/cons
- checklist
- Markdown page draft
- chart or report suggestion

The answer should include:

- direct answer
- supporting evidence
- relevant wiki references
- contradictions or uncertainty
- missing sources or gaps
- suggested next wiki action if useful

### 7. Handle contradictions

If pages disagree:

1. Identify the conflicting pages.
2. Summarize each position.
3. Prefer newer or better-sourced claims only when justified.
4. Do not silently overwrite old information.
5. Recommend whether a lint pass or source review is needed.

### 8. Decide whether to save the answer

If the answer is valuable long-term, ask whether to save it as a wiki page.

Examples worth saving:

- comparisons
- architecture decisions
- project plans
- technical explanations
- timelines
- repeated questions
- synthesized insights
- decision records
- debugging solutions

Do not save trivial answers unless the user explicitly asks.

### 9. Saving behavior

If the user asks to save the answer, create or update a suitable Markdown page.

Preferred locations:

- `wiki/questions/` for Q&A-style answers
- `wiki/decisions/` for decisions
- `wiki/projects/` for project-specific plans
- `wiki/concepts/` for reusable technical explanations
- `wiki/tools/` for tool workflows
- `wiki/reports/` for long-form synthesis

Use lowercase kebab-case filenames.

Example:

```txt
wiki/questions/how-should-i-structure-llm-wiki-operations.md
```

When saving:

1. Create or update the page.
2. Add related Obsidian links.
3. Add a Sources section.
4. Update `index.md`.
5. Append to `log.md`.
6. Create or update a query report.

### 10. Page template for saved answers

Use this structure when saving a query answer:

```md
# Title

## Question

## Answer

## Evidence

## Analysis

## Related pages

## Gaps and uncertainty

## Sources
```

For decision-style answers, use:

```md
# Decision: Title

## Context

## Options

## Decision

## Reasoning

## Tradeoffs

## Follow-up actions

## Sources
```

### 11. Update `index.md`

When saving a new or significantly updated page, update `index.md`.

Each entry should include:

- Obsidian link
- one-line summary
- category
- date if useful

Do not add every minor query unless it has long-term value.

### 12. Update `log.md`

Append a dated query entry when the answer is saved or when a report is created.

Use this format:

```md
## YYYY-MM-DD | query | Topic

Question:

- ...

Summary:

- ...

Wiki pages referenced:

- `wiki/...`

Raw sources referenced:

- `raw/...`

Pages created:

- `wiki/...`

Pages updated:

- `wiki/...`

Reports:

- `output/query-report/...`

Gaps or follow-ups:

- ...
```

### 13. Create query report

Create reports under:

- `output/query-report/`

If the repo already uses `outputs/`, follow the existing convention.

Report filename convention:

```txt
YYYY-MM-DD - topic - query-report.md
```

Use hyphens, not `|`, because `|` is unsafe or awkward in Windows paths.

If a report with the same date and topic already exists, update that report instead of creating a duplicate.

The report should include:

```md
# Query Report: Topic

## Question

## Search strategy

## Pages reviewed

## Answer summary

## Evidence

## Contradictions or uncertainty

## Gaps

## Saved outputs

## Follow-up questions
```

### 14. Verification

Before final response, verify when possible:

- saved page exists
- `index.md` was updated if needed
- `log.md` was updated if needed
- query report was created or updated
- cited files exist
- no raw files were modified

Useful commands:

```bash
git status --short
git diff -- raw/
rg -n "query topic|saved page title|raw source path" index.md log.md wiki output outputs
find output/query-report outputs/query-report -type f 2>/dev/null | sort
```

### 15. Final response

End with a concise summary:

- answer summary
- main files referenced
- pages created or updated, if any
- report path, if created
- unresolved gaps
- suggested next action
