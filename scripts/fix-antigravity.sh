#!/bin/bash
# Beast Mode: Antigravity Auto-Fix Script
# Detects and fixes missing agents.json configuration

set -e

echo "🔍 Beast Mode Antigravity Diagnostic Tool"
echo "=========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in a BMAD project
if [ ! -d "_bmad" ]; then
    echo -e "${RED}❌ ERROR: _bmad folder not found.${NC}"
    echo "   Run this script from your project root (where _bmad/ exists)."
    exit 1
fi

echo -e "${GREEN}✓${NC} Found _bmad folder"

# Check if beast-mode is installed
if [ ! -d "_bmad/beast-mode" ]; then
    echo -e "${RED}❌ ERROR: Beast Mode not installed.${NC}"
    echo "   Run: npx bmad-method@alpha install"
    echo "   And select Beast Mode as a custom module."
    exit 1
fi

echo -e "${GREEN}✓${NC} Found Beast Mode installation"

# Check if agents exist
AGENT_COUNT=$(find _bmad/beast-mode/agents -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
echo -e "${GREEN}✓${NC} Found ${AGENT_COUNT} agent files"

# Check for .antigravity folder
if [ ! -d ".antigravity" ]; then
    echo -e "${YELLOW}⚠${NC}  .antigravity folder missing — creating it..."
    mkdir -p .antigravity
    echo -e "${GREEN}✓${NC} Created .antigravity folder"
fi

# Check for agents.json
if [ -f ".antigravity/agents.json" ]; then
    EXISTING_AGENTS=$(grep -c '"name"' .antigravity/agents.json 2>/dev/null || echo "0")
    echo -e "${GREEN}✓${NC} Found agents.json with ${EXISTING_AGENTS} agents"
    
    if [ "$EXISTING_AGENTS" -lt 30 ]; then
        echo -e "${YELLOW}⚠${NC}  agents.json seems incomplete (expected 34 agents)"
        echo ""
        read -p "   Overwrite with complete config? [y/N] " -n 1 -r
        echo ""
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "   Skipped. No changes made."
            exit 0
        fi
    else
        echo -e "${GREEN}✓${NC} agents.json appears complete!"
        echo ""
        echo "All checks passed. If agents still don't appear:"
        echo "1. Reload Antigravity: Cmd+Shift+P → Reload Window"
        echo "2. Type @ in chat to see agent list"
        exit 0
    fi
else
    echo -e "${YELLOW}⚠${NC}  agents.json is MISSING — this is the bug!"
fi

echo ""
echo "🔧 Creating complete agents.json..."

cat > .antigravity/agents.json << 'EOF'
{
  "agents": [
    {"name": "beast-analyst", "path": "_bmad/beast-mode/agents/core/analyst.md", "description": "Root cause analysis, debugging"},
    {"name": "beast-architect", "path": "_bmad/beast-mode/agents/core/architect.md", "description": "System design, APIs, architecture"},
    {"name": "beast-dev", "path": "_bmad/beast-mode/agents/core/dev.md", "description": "Implementation, coding, shipping"},
    {"name": "beast-pm", "path": "_bmad/beast-mode/agents/core/pm.md", "description": "PRDs, requirements, prioritization"},
    {"name": "beast-qa", "path": "_bmad/beast-mode/agents/core/qa.md", "description": "Testing, QA, quality gates"},
    {"name": "beast-brainstormer", "path": "_bmad/beast-mode/agents/core/brainstormer.md", "description": "Ideation, creative thinking"},
    {"name": "beast-data", "path": "_bmad/beast-mode/agents/core/data-analyst.md", "description": "Metrics, analytics, KPIs"},
    {"name": "beast-ux", "path": "_bmad/beast-mode/agents/core/ux-designer.md", "description": "UX design, wireframes, flows"},
    {"name": "beast-sm", "path": "_bmad/beast-mode/agents/core/sm.md", "description": "Sprint planning, story splitting"},
    {"name": "beast-sec", "path": "_bmad/beast-mode/agents/security/sec-ops.md", "description": "Security architecture, threat modeling"},
    {"name": "beast-pentest", "path": "_bmad/beast-mode/agents/security/pentester.md", "description": "Penetration testing, vulnerabilities"},
    {"name": "beast-dpo", "path": "_bmad/beast-mode/agents/security/dpo.md", "description": "GDPR, privacy, compliance"},
    {"name": "beast-sre", "path": "_bmad/beast-mode/agents/ops/sre.md", "description": "Reliability, SLOs, uptime"},
    {"name": "beast-devops", "path": "_bmad/beast-mode/agents/ops/devops.md", "description": "CI/CD, pipelines, automation"},
    {"name": "beast-o11y", "path": "_bmad/beast-mode/agents/ops/o11y.md", "description": "Monitoring, logging, observability"},
    {"name": "beast-finops", "path": "_bmad/beast-mode/agents/ops/finops.md", "description": "Cloud costs, cost optimization"},
    {"name": "beast-perf", "path": "_bmad/beast-mode/agents/ops/perf.md", "description": "Performance, speed, latency"},
    {"name": "beast-incident", "path": "_bmad/beast-mode/agents/ops/incident.md", "description": "Incident management, outages"},
    {"name": "beast-growth", "path": "_bmad/beast-mode/agents/growth/growth.md", "description": "Growth experiments, A/B tests"},
    {"name": "beast-pricing", "path": "_bmad/beast-mode/agents/growth/pricing.md", "description": "Pricing strategy, monetization"},
    {"name": "beast-retention", "path": "_bmad/beast-mode/agents/growth/retention.md", "description": "Churn reduction, engagement"},
    {"name": "beast-support", "path": "_bmad/beast-mode/agents/growth/support.md", "description": "Customer success, support"},
    {"name": "beast-value", "path": "_bmad/beast-mode/agents/growth/user-value.md", "description": "User research, value proposition"},
    {"name": "beast-copy", "path": "_bmad/beast-mode/agents/polish/copywriter.md", "description": "UX writing, microcopy, marketing"},
    {"name": "beast-a11y", "path": "_bmad/beast-mode/agents/polish/a11y.md", "description": "Accessibility, WCAG compliance"},
    {"name": "beast-i18n", "path": "_bmad/beast-mode/agents/polish/i18n.md", "description": "Internationalization, localization"},
    {"name": "beast-seo", "path": "_bmad/beast-mode/agents/polish/seo.md", "description": "SEO, search rankings, schema"},
    {"name": "beast-docs", "path": "_bmad/beast-mode/agents/polish/tech-writer.md", "description": "Documentation, API docs"},
    {"name": "beast-eval", "path": "_bmad/beast-mode/agents/ai-eco/ai-eval.md", "description": "LLM evaluation, prompt testing"},
    {"name": "beast-red", "path": "_bmad/beast-mode/agents/ai-eco/ai-red-team.md", "description": "AI red teaming, jailbreak testing"},
    {"name": "beast-integration", "path": "_bmad/beast-mode/agents/ai-eco/integrations.md", "description": "API integrations, third-party"},
    {"name": "beast-enforcer", "path": "_bmad/beast-mode/agents/meta/enforcer.md", "description": "Protocol enforcement, checklists"},
    {"name": "beast-orch", "path": "_bmad/beast-mode/agents/orchestrator.md", "description": "Intelligent routing, coordination"}
  ]
}
EOF

echo -e "${GREEN}✓${NC} Created agents.json with 34 agents"
echo ""
echo "=========================================="
echo -e "${GREEN}🎉 FIX COMPLETE!${NC}"
echo ""
echo "Next steps:"
echo "1. Reload Antigravity: Cmd+Shift+P → Reload Window"
echo "2. Type @ in chat — you should see all beast-* agents"
echo ""
echo "If issues persist, try:"
echo "- Restart Antigravity completely"
echo "- Check if agent files exist: ls _bmad/beast-mode/agents/core/"
