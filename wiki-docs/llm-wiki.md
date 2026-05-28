# LLM Wiki

## Summary

An LLM wiki is a persistent, AI-maintained Markdown knowledge base. Instead of answering only from raw documents each time, the AI incrementally converts sources into linked pages that can be queried, maintained, and improved over time.

## Key points

- `raw/` contains original source material and should remain immutable.
- `wiki/` contains synthesized summaries, concept pages, comparisons, and project notes.
- A schema file such as `AGENTS.md` tells the AI how to structure, update, and maintain the knowledge base.
- The wiki gets more useful as more sources are integrated and cross-linked.
- Contradictions should be flagged rather than silently overwritten.

## Details

The LLM wiki pattern is useful when knowledge needs to compound across many sources: technical research, project planning, debugging logs, resume tracking, or learning notes. It works best when the human curates input quality and periodically asks the AI to lint the wiki.

The pattern does not remove the need for source review. The wiki is only as reliable as the raw sources and the AI's synthesis, so important claims should remain traceable to source files.
