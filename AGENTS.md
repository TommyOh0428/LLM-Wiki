This repository is my Obsidian-based LLM wiki where it saves all the information regarding all the projects that I am planning.

## Purpose

This wiki is a persistent knowledge base maintained by Codex. It is used for:
- software engineering learning
- cloud computing
- IoT and embedded systems
- FinTech pipeline project planning
- coding project documentation
- resume/project tracking
- debugging logs
- technical research

The human curates sources and asks questions. Codex maintains the wiki.

## Architecture

There are three layers:

1. raw/
   - Contains original source material.
   - Codex may read these files.
   - Codex must not edit, delete, rename, or reorganize raw sources unless explicitly asked.

2. wiki/
   - Contains Codex-maintained Markdown pages.
   - Codex may create, update, link, and reorganize pages here.
   - Pages should be concise, structured, and connected with Obsidian links.

3. schema/instructions
   - This AGENTS.md file defines the rules.
   - Codex should follow this file when ingesting, querying, linting, or updating the wiki.

## Special files

### index.md

The content-oriented catalog of the wiki.

Every important wiki page should be listed in index.md with:
- Obsidian link
- one-line summary
- category
- last updated date when useful

Codex should read index.md first when answering questions about the wiki.

### log.md

The chronological append-only history.

Codex should append to log.md after:
- ingesting a new source
- creating or significantly updating wiki pages
- answering a major question that should be preserved
- running a lint/maintenance pass

Use this format:

## [YYYY-MM-DD] type | title

Summary:
- ...

Files changed:
- [[path/to/file]]

## Wiki conventions

Use Obsidian links:

[[concept-name]]

Prefer filenames in lowercase kebab-case:

fintech-pipeline.md
cloud-run.md
codex-wsl-setup.md

Each wiki page should usually contain:

# Title

## Summary

## Key points

## Details

## Related pages

## Sources

## Open questions

## Maintenance rules

When ingesting a source:
1. Read the source from raw/.
2. Identify the main entities, concepts, tools, projects, and claims.
3. Create or update relevant pages under wiki/.
4. Add cross-links between related pages.
5. Update index.md.
6. Append an entry to log.md.
7. Flag contradictions instead of silently overwriting old claims.

When answering a question:
1. Read index.md first.
2. Search relevant wiki pages.
3. Answer based on the wiki when possible.
4. If the answer is useful long-term, offer to save it as a new wiki page.
5. Cite wiki files by path.

When linting the wiki:
Look for:
- orphan pages
- missing backlinks
- stale claims
- duplicated pages
- contradictions
- important concepts without their own page
- index.md entries that are missing or outdated

## Safety rules

Do not delete raw sources.
Do not remove old claims without preserving context.
Do not invent citations.
Do not reorganize the whole vault unless explicitly asked.
Ask before making large structural changes.