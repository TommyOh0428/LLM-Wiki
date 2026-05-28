# Wiki Linting

## Summary

Wiki linting is a maintenance pass where the AI checks the vault for structural and knowledge-quality problems.

## Key points

- Check for contradictions between pages.
- Find stale claims and weak source sections.
- Identify orphan pages and missing backlinks.
- Find duplicated pages or concepts that need their own page.
- Compare `index.md` and `log.md` against the actual wiki.
- Detect raw sources that have not been ingested.

## Details

The source compares wiki linting to code linting. The goal is to keep the knowledge base coherent as new sources are added. Linting is especially useful once multiple sources touch the same concepts or project plans.

For this vault, linting behavior is defined by `AGENTS.md` and `.codex/skills/lint/SKILL.md`.
