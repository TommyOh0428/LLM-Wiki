#!/usr/bin/env zsh

# Use this script to import clips from the web folder on the D drive to the raw/web folder in the Obsidian vault. 
# It uses rsync to only copy new files, avoiding duplicates.
# Windows filesystem -> WSL filesystem path conversion is handled by the script, 
# so you can run this from WSL without worrying about path issues.

SOURCE="/mnt/d/tommy-workflow/raw/web"
DEST="$HOME/Obsidian/LLM-Wiki/raw/web"

mkdir -p "$SOURCE"
mkdir -p "$DEST"

rsync -av --ignore-existing "$SOURCE/" "$DEST/"
