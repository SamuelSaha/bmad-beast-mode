#!/bin/bash
# Beast Mode Hybrid Setup Script

echo "🚀 Initiating Beast Mode Hybrid Setup..."

# 1. Define Paths
# This assumes you have cloned the repo to this specific path on your machine
BMAD_GLOBAL="$HOME/Library/BMAD/modules/bmad-beast-mode"
OPENCODE_CMD=".opencode/commands"

# 2. Validation
if [ ! -d "$BMAD_GLOBAL" ]; then
    echo "❌ Error: Global Library not found at $BMAD_GLOBAL"
    echo "👉 You must clone the repo to this location first."
    exit 1
fi

# 3. Setup OpenCode Directory
echo "🔌 Linking OpenCode Commands..."
mkdir -p "$OPENCODE_CMD"

# 4. Link All Agents
# Finds all .md files in agents/ and symlinks them
find "$BMAD_GLOBAL/agents" -name "*.md" | while read agent_file; do
    agent_name=$(basename "$agent_file")
    ln -sf "$agent_file" "$OPENCODE_CMD/$agent_name"
done

# 5. Link Orchestrator (The Entry Point)
if [ -f "$BMAD_GLOBAL/agents/orchestrator.md" ]; then
    ln -sf "$BMAD_GLOBAL/agents/orchestrator.md" "$OPENCODE_CMD/bmad.md"
fi

echo "✅ OpenCode ready. Type '/bmad' to start."
