# Wiki Ingest Workflow

## Summary

The wiki ingest workflow converts a raw source into concise, linked Markdown pages while preserving the original source unchanged.

## Key points

- Read the source from `raw/`.
- Extract main claims, concepts, entities, tools, project relevance, contradictions, and open questions.
- Create or update relevant pages under `wiki/`.
- Add Obsidian links between related pages.
- Update `index.md`.
- Append to `log.md`.
- Create an ingest report under `output/ingest-report/`.

## Details

Ingesting is the main way the [[llm-wiki]] compounds knowledge. A good ingest should not only summarize the new source; it should also update existing concept pages when the new source adds context.

For this vault, the active Codex ingest behavior is defined by `AGENTS.md` and `.codex/skills/ingest/SKILL.md`.
