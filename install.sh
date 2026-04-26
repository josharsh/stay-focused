#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="$HOME/.claude/skills/stay-focused"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Stay Focused skill..."

# Create directory
mkdir -p "$SKILL_DIR"

# Copy skill file
cp "$SOURCE_DIR/skills/stay-focused/SKILL.md" "$SKILL_DIR/SKILL.md"

echo ""
echo "Stay Focused installed successfully!"
echo ""
echo "Usage:"
echo "  /stay-focused       — activate scope enforcement"
echo "  /stay-focused off   — disable scope enforcement"
echo ""
echo "Skill is installed at: $SKILL_DIR/SKILL.md"
