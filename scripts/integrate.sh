#!/bin/bash
#
# BMAD Beast Mode - Project Integration Script
# Run this from your project root to enable BMAD agents
#
# Usage: bash ~/Library/BMAD/modules/beast-mode/scripts/integrate.sh
#

set -e

BMAD_HOME=~/Library/BMAD/modules/beast-mode
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║           🔥 BMAD BEAST MODE INTEGRATION 🔥                ║"
echo "║                    v2.0.0 (10x Edition)                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if BMAD is installed
if [ ! -d "$BMAD_HOME" ]; then
    echo -e "${YELLOW}⚠️  BMAD not found at $BMAD_HOME${NC}"
    echo "Please install first:"
    echo "  mkdir -p ~/Library/BMAD/modules"
    echo "  git clone https://github.com/YOUR_USERNAME/bmad-beast-mode ~/Library/BMAD/modules/beast-mode"
    exit 1
fi

echo -e "${GREEN}✓ BMAD found at $BMAD_HOME${NC}"

# Create OpenCode commands directory
echo ""
echo -e "${BLUE}📁 Creating .opencode/commands directory...${NC}"
mkdir -p .opencode/commands

# Create symlinks for all agents
echo -e "${BLUE}🔗 Creating symlinks to global agents...${NC}"

# Core Squad
ln -sf "$BMAD_HOME/agents/core/analyst.md" .opencode/commands/analyst.md
ln -sf "$BMAD_HOME/agents/core/architect.md" .opencode/commands/architect.md
ln -sf "$BMAD_HOME/agents/core/dev.md" .opencode/commands/dev.md
ln -sf "$BMAD_HOME/agents/core/qa.md" .opencode/commands/qa.md
ln -sf "$BMAD_HOME/agents/core/pm.md" .opencode/commands/pm.md
ln -sf "$BMAD_HOME/agents/core/sm.md" .opencode/commands/sm.md
ln -sf "$BMAD_HOME/agents/core/ux-designer.md" .opencode/commands/ux.md
ln -sf "$BMAD_HOME/agents/core/data-analyst.md" .opencode/commands/data.md
echo "  ✓ Core Squad (8 agents)"

# Security Squad
ln -sf "$BMAD_HOME/agents/security/sec-ops.md" .opencode/commands/secops.md
ln -sf "$BMAD_HOME/agents/security/pentester.md" .opencode/commands/pentester.md
ln -sf "$BMAD_HOME/agents/security/dpo.md" .opencode/commands/dpo.md
ln -sf "$BMAD_HOME/agents/security/appsec-automation.md" .opencode/commands/appsec.md
echo "  ✓ Security Squad (4 agents)"

# Growth Squad
ln -sf "$BMAD_HOME/agents/growth/pricing.md" .opencode/commands/pricing.md
ln -sf "$BMAD_HOME/agents/growth/growth.md" .opencode/commands/growth.md
ln -sf "$BMAD_HOME/agents/growth/retention.md" .opencode/commands/retention.md
ln -sf "$BMAD_HOME/agents/growth/entitlements.md" .opencode/commands/entitlements.md
ln -sf "$BMAD_HOME/agents/growth/support.md" .opencode/commands/support.md
ln -sf "$BMAD_HOME/agents/growth/user-value.md" .opencode/commands/value.md
echo "  ✓ Growth Squad (6 agents)"

# Ops Squad
ln -sf "$BMAD_HOME/agents/ops/devops.md" .opencode/commands/devops.md
ln -sf "$BMAD_HOME/agents/ops/dba.md" .opencode/commands/dba.md
ln -sf "$BMAD_HOME/agents/ops/sre.md" .opencode/commands/sre.md
ln -sf "$BMAD_HOME/agents/ops/perf.md" .opencode/commands/perf.md
echo "  ✓ Ops Squad (4 agents)"

# Polish Squad
ln -sf "$BMAD_HOME/agents/polish/code-reviewer.md" .opencode/commands/reviewer.md
ln -sf "$BMAD_HOME/agents/polish/tech-writer.md" .opencode/commands/docs.md
ln -sf "$BMAD_HOME/agents/polish/a11y.md" .opencode/commands/a11y.md
ln -sf "$BMAD_HOME/agents/polish/i18n.md" .opencode/commands/i18n.md
ln -sf "$BMAD_HOME/agents/polish/refactor.md" .opencode/commands/refactor.md
echo "  ✓ Polish Squad (5 agents)"

# AI-Eco Squad
ln -sf "$BMAD_HOME/agents/ai-eco/prompt-engineer.md" .opencode/commands/prompteng.md
ln -sf "$BMAD_HOME/agents/ai-eco/ai-safety.md" .opencode/commands/aisafety.md
ln -sf "$BMAD_HOME/agents/ai-eco/ai-cost.md" .opencode/commands/aicost.md
ln -sf "$BMAD_HOME/agents/ai-eco/ai-architect.md" .opencode/commands/aiarch.md
echo "  ✓ AI-Eco Squad (4 agents)"

# Orchestrator and References
ln -sf "$BMAD_HOME/agents/orchestrator.md" .opencode/commands/bmad.md
ln -sf "$BMAD_HOME/QUICKREF.md" .opencode/commands/help.md
ln -sf "$BMAD_HOME/docs/TRIGGER_MATRIX.md" .opencode/commands/triggers.md
echo "  ✓ Orchestrator & References"

# Create docs/bmad directory for artifacts
echo ""
echo -e "${BLUE}📄 Creating docs/bmad/ for artifacts...${NC}"
mkdir -p docs/bmad
echo "  ✓ docs/bmad/ ready"

# Create .cursorrules or update with BMAD context
echo ""
echo -e "${BLUE}📝 Creating .cursorrules for IDE integration...${NC}"
cat > .cursorrules << 'EOF'
# BMAD PROTOCOL v2.0 ACTIVATED

## Source of Truth
You have access to the BMAD Protocol at: ~/Library/BMAD/modules/beast-mode/

## Agent Definitions
- Core: ~/Library/BMAD/modules/beast-mode/agents/core/
- Security: ~/Library/BMAD/modules/beast-mode/agents/security/
- Growth: ~/Library/BMAD/modules/beast-mode/agents/growth/
- Ops: ~/Library/BMAD/modules/beast-mode/agents/ops/
- Polish: ~/Library/BMAD/modules/beast-mode/agents/polish/
- AI-Eco: ~/Library/BMAD/modules/beast-mode/agents/ai-eco/

## References
- Quick Reference: ~/Library/BMAD/modules/beast-mode/QUICKREF.md
- Trigger Matrix: ~/Library/BMAD/modules/beast-mode/docs/TRIGGER_MATRIX.md

## Protocol
1. Consult QUICKREF.md for commands
2. Check TRIGGER_MATRIX.md for squad activation
3. Adopt agent persona from definition file
4. Output artifacts to: docs/bmad/{feature-slug}/

## Context Fuel Required
Before analysis, ensure:
- Current behavior (what's happening)
- Expected behavior (what should happen)
- Evidence (errors, screenshots, repro)

If missing, request before proceeding.
EOF
echo "  ✓ .cursorrules created"

# Summary
echo ""
echo -e "${GREEN}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              ✅ INTEGRATION COMPLETE!                      ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo ""
echo "📋 Available Commands:"
echo ""
echo "  🔵 Core:      /analyst /architect /dev /qa /pm /sm /ux /data"
echo "  🔴 Security:  /secops /pentester /dpo /appsec"
echo "  🟢 Growth:    /pricing /growth /retention /entitlements"
echo "  🟣 Ops:       /devops /dba /sre /perf"
echo "  🟡 Polish:    /reviewer /docs /a11y /i18n /refactor"
echo "  🤖 AI-Eco:    /prompteng /aisafety /aicost /aiarch"
echo ""
echo "  🚀 Start:     /bmad"
echo "  ❓ Help:      /help"
echo "  📊 Triggers:  /triggers"
echo ""
echo "Artifacts will be saved to: docs/bmad/{slug}/"
echo ""
