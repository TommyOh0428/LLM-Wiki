# Karpathy LLM Wiki Sources

## Summary

This page summarizes two closely related sources about the LLM wiki pattern: an abstract article explaining the idea and a Teachers Tech tutorial showing a beginner setup with Obsidian and an AI coding agent.

## Key points

- Both sources describe an [[llm-wiki]] as a persistent Markdown knowledge base maintained by an AI agent.
- The article explains the general pattern: raw sources, AI-maintained wiki pages, and a schema file that defines workflow rules.
- The tutorial demonstrates the same pattern as a concrete beginner workflow using Obsidian, raw source folders, a schema file, source ingestion, graph browsing, cross-source questions, and linting.
- Both sources contrast the pattern with ordinary document-QA workflows where knowledge is retrieved from scratch for each question.
- The article adds broader guidance about filing useful query answers back into the wiki and using optional tools such as qmd, Obsidian Web Clipper, Marp, and Dataview.
- The tutorial adds practical limitations: the workflow works best at personal scale, depends on curated sources, needs an AI coding agent, and still benefits from review.

## Details

The article is intentionally abstract and meant to be adapted by an LLM agent to the user's domain. It emphasizes the wiki as a compounding artifact: sources are read once, synthesized into pages, cross-linked, and maintained over time.

The tutorial covers the same concept through a setup walkthrough. It shows how a user might create an Obsidian vault, add `raw/` and `wiki/` folders, use a schema file, ingest example sources, inspect the graph view, ask cross-source questions, and run linting.

Taken together, the sources support this vault's current structure: keep raw sources immutable, maintain concise wiki pages under `wiki/`, use `index.md` as the catalog, use `log.md` as the chronological history, and avoid creating separate pages unless the source base justifies them.

## Related pages

- [[llm-wiki]]

## Sources

- `raw/articles/2026-05-24 - llm-wiki.md`
- `raw/youtube/2026-05-25 - Karpathy's LLM Wiki - Full Beginner Setup Guide.md`

## Open questions

- Which future answer types should be saved back into this vault as durable wiki pages?
- At what vault size should this wiki add a dedicated Markdown search tool instead of relying on `index.md` and `rg`?
