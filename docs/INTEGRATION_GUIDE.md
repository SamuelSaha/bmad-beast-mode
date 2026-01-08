# BMAD Unified Integration Guide

## For OpenCode, Antigravity, Claude Code, and Other AI IDEs

---

## 🏗️ Architecture

```
~/Library/BMAD/modules/beast-mode/     ← SINGLE SOURCE OF TRUTH
│
├── Your Project A
│   └── .opencode/commands/            ← ✅ Symlinks to global
│   └── docs/bmad/                     ← ✅ Shared artifacts
│
├── Your Project B  
│   └── .opencode/commands/            ← ✅ Symlinks to global
│   └── docs/bmad/                     ← ✅ Shared artifacts
│
└── Antigravity/Cursor/etc.
    └── Context → ~/Library/BMAD/      ← ✅ Points to global
```

---

## 🔧 Setup Script

Run this ONCE from your **project root**:

```bash
#!/bin/bash
# BMAD Project Integration Script

BMAD_HOME=~/Library/BMAD/modules/beast-mode

# Create OpenCode commands directory
mkdir -p .opencode/commands

# Core Squad Symlinks
ln -sf "$BMAD_HOME/agents/core/analyst.md" .opencode/commands/analyst.md
ln -sf "$BMAD_HOME/agents/core/architect.md" .opencode/commands/architect.md
ln -sf "$BMAD_HOME/agents/core/dev.md" .opencode/commands/dev.md
ln -sf "$BMAD_HOME/agents/core/qa.md" .opencode/commands/qa.md
ln -sf "$BMAD_HOME/agents/core/pm.md" .opencode/commands/pm.md
ln -sf "$BMAD_HOME/agents/core/sm.md" .opencode/commands/sm.md
ln -sf "$BMAD_HOME/agents/core/ux-designer.md" .opencode/commands/ux.md
ln -sf "$BMAD_HOME/agents/core/data-analyst.md" .opencode/commands/data.md

# Security Squad Symlinks
ln -sf "$BMAD_HOME/agents/security/sec-ops.md" .opencode/commands/secops.md
ln -sf "$BMAD_HOME/agents/security/pentester.md" .opencode/commands/pentester.md
ln -sf "$BMAD_HOME/agents/security/dpo.md" .opencode/commands/dpo.md
ln -sf "$BMAD_HOME/agents/security/appsec-automation.md" .opencode/commands/appsec.md

# Growth Squad Symlinks
ln -sf "$BMAD_HOME/agents/growth/pricing.md" .opencode/commands/pricing.md
ln -sf "$BMAD_HOME/agents/growth/growth.md" .opencode/commands/growth.md
ln -sf "$BMAD_HOME/agents/growth/retention.md" .opencode/commands/retention.md

# Ops Squad Symlinks
ln -sf "$BMAD_HOME/agents/ops/devops.md" .opencode/commands/devops.md
ln -sf "$BMAD_HOME/agents/ops/dba.md" .opencode/commands/dba.md
ln -sf "$BMAD_HOME/agents/ops/sre.md" .opencode/commands/sre.md
ln -sf "$BMAD_HOME/agents/ops/perf.md" .opencode/commands/perf.md

# Polish Squad Symlinks
ln -sf "$BMAD_HOME/agents/polish/code-reviewer.md" .opencode/commands/reviewer.md
ln -sf "$BMAD_HOME/agents/polish/tech-writer.md" .opencode/commands/docs.md
ln -sf "$BMAD_HOME/agents/polish/a11y.md" .opencode/commands/a11y.md

# AI-Eco Squad Symlinks
ln -sf "$BMAD_HOME/agents/ai-eco/prompt-engineer.md" .opencode/commands/prompteng.md
ln -sf "$BMAD_HOME/agents/ai-eco/ai-safety.md" .opencode/commands/aisafety.md
ln -sf "$BMAD_HOME/agents/ai-eco/ai-cost.md" .opencode/commands/aicost.md
ln -sf "$BMAD_HOME/agents/ai-eco/ai-architect.md" .opencode/commands/aiarch.md

# Orchestrator
ln -sf "$BMAD_HOME/agents/orchestrator.md" .opencode/commands/bmad.md

# Quick Reference
ln -sf "$BMAD_HOME/QUICKREF.md" .opencode/commands/help.md

echo "✅ BMAD Integration Complete!"
echo "Available commands: /analyst, /architect, /dev, /qa, /secops, /devops, etc."
```

---

## 📱 Antigravity / Cursor / IDE Setup

### Add to your IDE's System Instructions or .cursorrules:

```markdown
# BMAD PROTOCOL v2.0 ACTIVATED

## Source of Truth
You have access to the BMAD Protocol at: ~/Library/BMAD/modules/beast-mode/

## Files Available
- **Agent Definitions:** ~/Library/BMAD/modules/beast-mode/agents/
- **Quick Reference:** ~/Library/BMAD/modules/beast-mode/QUICKREF.md
- **Trigger Matrix:** ~/Library/BMAD/modules/beast-mode/docs/TRIGGER_MATRIX.md
- **Workflows:** ~/Library/BMAD/modules/beast-mode/workflows/

## Instruction
When the user asks for a task:
1. DO NOT hallucinate a process.
2. Consult the QUICKREF.md for the appropriate command.
3. Check TRIGGER_MATRIX.md for which squads to activate.
4. Adopt the persona defined in the agent's file.
5. Execute the standard command from that agent.
6. Generate artifacts to: docs/bmad/{slug}/

## Artifact Path Convention
All artifacts go to: `docs/bmad/{feature-slug}/`
- 01-analysis.md (Analyst)
- 01b-prd.md (PM)
- 02-technical-spec.md (Architect)
- 03-implementation.md (Dev)
- 04-qa-report.md (QA)

## Context Fuel Requirement
Before any analysis, ensure you have:
- Current behavior (what happens now)
- Expected behavior (what should happen)
- Evidence (errors, screenshots, repro steps)

If missing, request it before proceeding.
```

---

## 🚀 Usage Workflow

### Phase 1: Analysis (Terminal/OpenCode)
```
/bmad "I need to add Apple Pay to checkout"
→ Triggers: Security, Growth, Ops squads identified

/analyst
→ Creates: docs/bmad/apple-pay/01-analysis.md
```

### Phase 2: Architecture (Either Tool)
```
/architect
→ Creates: docs/bmad/apple-pay/02-technical-spec.md
```

### Phase 3: Implementation (IDE/Antigravity)
```
"Implement based on docs/bmad/apple-pay/02-technical-spec.md using the Dev agent."
→ Writes code following spec constraints
```

### Phase 4: Verification (Terminal/OpenCode)
```
/qa
→ Creates: docs/bmad/apple-pay/04-qa-report.md
```

---

## ✅ Verification Checklist

- [ ] Global repo exists at `~/Library/BMAD/modules/beast-mode`
- [ ] OpenCode `.opencode/commands/` has symlinks
- [ ] IDE context points to `~/Library/BMAD/modules/beast-mode`
- [ ] Both tools read from project's `docs/bmad/` folder
- [ ] `/analyst` command works in OpenCode
- [ ] Antigravity can access agent definitions

---

## 🔄 Updating Agents

Since everything is symlinked to the global source:

```bash
# Update the global library
cd ~/Library/BMAD/modules/beast-mode
git pull origin main

# ALL projects are now updated instantly!
```

No need to update individual projects.
