# LLM Wiki

## Summary

An LLM wiki is a persistent, AI-maintained Markdown knowledge base. Instead of answering only from raw documents at query time, the AI incrementally converts sources into linked pages that can be queried, maintained, and improved over time.

## Key points

- The pattern is designed to improve on retrieval-augmented generation by compiling knowledge once and keeping the synthesis current.
- `raw/` contains original source material and should remain immutable.
- `wiki/` contains synthesized summaries, concept pages, comparisons, and project notes.
- A schema file such as `AGENTS.md` tells the AI how to structure, update, and maintain the knowledge base.
- Obsidian can act as the local Markdown viewer and graph interface, while an AI coding agent writes and maintains the wiki.
- Good answers to questions can be filed back into the wiki so exploratory work compounds instead of disappearing into chat history.
- Contradictions should be flagged rather than silently overwritten.

## Details

The core claim is that most document-QA workflows make the model rediscover the same knowledge every time. An LLM wiki inserts a maintained Markdown layer between raw sources and answers. When a new source arrives, the AI reads it, extracts the important claims, updates related pages, creates new pages only where justified, links related concepts, and records contradictions or open questions.

The source article describes three layers:

- Raw sources: immutable source documents curated by the human.
- The wiki: LLM-generated Markdown files that summarize, connect, compare, and synthesize source material.
- The schema: a rules document such as `AGENTS.md` or `CLAUDE.md` that defines the directory structure, page conventions, ingest workflow, query behavior, and maintenance behavior.

The pattern is useful when knowledge accumulates over time: technical research, project planning, learning notes, debugging records, course notes, competitive analysis, due diligence, trip planning, or internal team knowledge. It works best when the human curates source quality and periodically asks the AI to lint the wiki.

The article frames Obsidian as the IDE, the LLM as the programmer, and the wiki as the codebase. The human usually does not write wiki pages directly; they curate sources, ask questions, and steer emphasis. The AI handles summarizing, cross-referencing, bookkeeping, and maintenance.

The pattern is related in spirit to Vannevar Bush's Memex: a private, curated knowledge store where associative links matter. The article argues that LLMs solve the maintenance burden that made hand-maintained personal wikis difficult to sustain.

## Supporting concepts

Retrieval-augmented generation, or RAG, is the baseline document-QA pattern that the sources contrast with an LLM wiki. In RAG, the system retrieves relevant chunks from raw documents at query time and generates an answer from those chunks. The sources argue that this can work for simple questions but does not naturally preserve synthesis, cross-links, or contradiction tracking between questions.

Obsidian is presented as a useful interface rather than the core engine. Its value is that it works with local Markdown files and provides graph view for inspecting links. The article also mentions Obsidian Web Clipper for saving web articles as Markdown, local image downloads for durable assets, and optional plugins or formats such as Dataview and Marp.

## Operations

Ingest is the process of reading a raw source, extracting important claims and concepts, creating or updating wiki pages, adding links, updating `index.md`, and appending to `log.md`. The article says a single source may touch many pages, but this vault should avoid over-splitting when the source only supports short notes.

Query means answering from the wiki first. The article emphasizes that useful answers can become new wiki pages when they represent durable comparisons, plans, syntheses, or discoveries.

Linting is a maintenance pass for contradictions, stale claims, orphan pages, missing backlinks, duplicate pages, missing index entries, and unprocessed raw sources. The sources compare it to code linting: it keeps the wiki coherent as it grows.

## Related pages

- [[karpathy-llm-wiki-sources]]

## Sources

- `raw/articles/2026-05-24 - llm-wiki.md`
- `raw/youtube/2026-05-25 - Karpathy's LLM Wiki - Full Beginner Setup Guide.md`

## Open questions

- At what vault size should this wiki add a dedicated search tool such as qmd instead of relying mainly on `index.md` and `rg`?
- Which kinds of long-term answers should be filed back as standalone wiki pages in this vault?
