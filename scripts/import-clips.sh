#!/usr/bin/env zsh

SOURCE="/mnt/d/tommy-workflow/raw/web"
DEST="$HOME/Obsidian/LLM-Wiki/raw/web"

mkdir -p "$SOURCE"
mkdir -p "$DEST"

rsync -av --ignore-existing "$SOURCE/" "$DEST/"
