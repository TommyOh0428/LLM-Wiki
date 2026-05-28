# Karpathy LLM Wiki Ingest Report

Date: 2026-05-27

## Sources

- `raw/articles/2026-05-24 - llm-wiki.md`
- `raw/youtube/2026-05-25 - Karpathy's LLM Wiki - Full Beginner Setup Guide.md`

## Summary

Ingested the previously unprocessed article source describing the Karpathy-style LLM wiki pattern and retained the prior YouTube ingest context. The article is more abstract than the tutorial: it explains the pattern, architecture, operations, indexing/logging model, optional tooling, and why LLMs reduce the maintenance burden of personal wikis.

## Key takeaways

- The LLM wiki pattern turns raw sources into a durable, linked knowledge base.
- `raw/` should stay read-only, while `wiki/` is maintained by the AI.
- `AGENTS.md` or a similar schema file defines the operating rules.
- Obsidian is the local Markdown and graph interface, while the AI coding agent performs synthesis and maintenance.
- Ingesting, querying, and linting are the three core operational workflows.
- Useful answers can be filed back into the wiki as durable pages.
- `index.md` is content-oriented, while `log.md` is chronological.
- Optional tooling mentioned by the article includes qmd, Obsidian Web Clipper, local image downloads, Marp, and Dataview.

## Files changed

- `index.md` - Updated the source summary list to include one combined source-batch summary.
- `log.md` - Appended the article ingest entry and recorded the follow-up consolidations.
- `wiki/karpathy-llm-wiki-sources.md` - Created the combined source summary page for the article and tutorial.
- `wiki/karpathy-llm-wiki-article.md` - Deleted during follow-up cleanup because it duplicated the same narrow source topic.
- `wiki/karpathy-llm-wiki-beginner-setup-guide.md` - Deleted during follow-up cleanup because it duplicated the same narrow source topic.
- `wiki/llm-wiki.md` - Added article-backed details about architecture, operations, schema, query filing, RAG, Obsidian, linting, and the Memex analogy.
- `wiki/retrieval-augmented-generation.md` - Deleted during follow-up cleanup because the source base did not yet justify a separate page.
- `wiki/obsidian.md` - Deleted during follow-up cleanup because the source base did not yet justify a separate page.
- `wiki/wiki-ingest-workflow.md` - Deleted during follow-up cleanup because the source base did not yet justify a separate page.
- `wiki/wiki-linting.md` - Deleted during follow-up cleanup because the source base did not yet justify a separate page.
- `output/ingest-report/2026-05-27 | karpathy-llm-wiki-ingest-report.md` - Updated this report.

## Notes

- No raw sources were modified.
- The older `wiki-docs/` pages were left in place. The canonical pages referenced by `index.md` now exist under `wiki/`.
- The canonical `wiki/` directory now keeps this source batch to one concept page and one source summary page.
