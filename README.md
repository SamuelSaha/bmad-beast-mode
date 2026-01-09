# Beast Mode: Custom Agent Module for BMAD v6

> **31 specialized agents** that install alongside the official BMAD Method.
> No fork. No drift. Pure extension.

---

## 🚀 Quick Start (2 minutes)

```bash
# 1. Create a new project
mkdir my-app && cd my-app && git init

# 2. Run the BMAD installer
npx bmad-method@alpha install

# 3. Answer the prompts:
#    - Select tools: Choose your IDE (Antigravity, OpenCode, etc.)
#    - Official modules: Select BMM (BMAD Method)
#    - "Install local custom module?" → y
#    - Path: /Users/YOUR_USERNAME/Library/BMAD/modules/bmad-beast-mode

# 4. Done! Your agents are now in:
#    _bmad/beast-mode/agents/
```

---

## 📦 What's Included

### Agents (33 total)

| Squad | Agents | Purpose |
|-------|--------|---------|
| **Core** (9) | brainstormer, analyst, pm, architect, dev, qa, data-analyst, ux-designer, sm | Essential workflow |
| **Security** (3) | sec-ops, pentester, dpo | Security & privacy |
| **Growth** (5) | user-value, pricing, growth, retention, support | Product growth |
| **Ops** (6) | sre, devops, o11y, finops, perf, incident | Infrastructure |
| **Polish** (5) | copywriter, a11y, i18n, seo, tech-writer | Quality & docs |
| **AI-Eco** (3) | ai-eval, ai-red-team, integrations | AI/ML features |
| **Meta** (1) | enforcer | Protocol generation |
| **Router** (1) | orchestrator | Traffic control |

### Workflows (7)

| Workflow | Use Case |
|----------|----------|
| `quick-fix` | Bug fixes (15 min) |
| `micro-fix` | Small changes (30 min) |
| `standard-feature` | Normal features |
| `enterprise-feature` | Large features |
| `ai-feature` | AI/LLM features |
| `brainstorm` | Divergent ideation |
| `brownfield-discovery` | Legacy codebase mapping |

---

## 🔧 Installation Options

### Option A: Fresh Project (Recommended)

```bash
mkdir my-app && cd my-app && git init
npx bmad-method@alpha install
# Select: BMM + your custom module path
```

### Option B: Existing BMAD Project

```bash
cd my-existing-project
npx bmad-method@alpha install
# Choose: "Modify BMAD Installation"
# Add your custom module
```

### Option C: Manual Update (Force Sync)

If you updated your source module and need to push changes to a project:

```bash
cd ~/Desktop/your-project
cp -R ~/Library/BMAD/modules/bmad-beast-mode/agents/ _bmad/beast-mode/agents/
cp ~/Library/BMAD/modules/bmad-beast-mode/module.yaml _bmad/beast-mode/
```

---

## 🎯 Usage Patterns

### Pattern 1: Protocol Enforcer (Structured Tickets)

```bash
# Start a session
npx bmad session

# Load the Enforcer
> /load enforcer

# Paste your Context Fuel
> *enforce context: '
Issue: Login button not working
Current: Button renders but onClick fails
Expected: User can click and authenticate
Stack: React 18, NextAuth, Postgres
'

# Follow the generated protocol
> /load analyst    # Step 1: Analysis
> /load architect  # Step 2: Technical spec
> /load dev        # Step 3: Implementation
> /load qa         # Step 4: Review
```

### Pattern 2: Quick Fix (Small Bugs)

```bash
> /load analyst
> *analyze-problem context: 'Button color wrong on dark mode'
# Analyst outputs root cause

> /load dev
> *implement-fix
# Dev fixes it

> /load qa
> *review-feature
# QA validates
```

### Pattern 3: Brainstorming (Divergent Ideation)

```bash
# Option A: Use official BMAD workflow
> /load analyst
> *brainstorm-project

# Option B: Use Beast Mode Brainstormer
> /load brainstormer
> *brainstorm context: 'How should we handle user onboarding?'
```

---

## 📁 Project Structure After Install

```
my-app/
├── _bmad/
│   ├── _config/           # BMAD core config
│   ├── beast-mode/        # YOUR CUSTOM MODULE
│   │   ├── agents/
│   │   │   ├── core/      # 9 agents
│   │   │   ├── security/  # 3 agents
│   │   │   ├── growth/    # 5 agents
│   │   │   ├── ops/       # 6 agents
│   │   │   ├── polish/    # 5 agents
│   │   │   ├── ai-eco/    # 3 agents
│   │   │   ├── meta/      # 1 agent (enforcer)
│   │   │   └── orchestrator.md
│   │   ├── workflows/
│   │   ├── templates/
│   │   └── config/
│   ├── bmm/               # Official BMad Method
│   └── core/              # BMAD Core
├── _bmad-output/
│   ├── planning-artifacts/   # PRD, architecture, etc.
│   └── implementation-artifacts/  # Stories, reviews
└── docs/                  # Long-term project docs
```

---

## 🔄 Updating Without Breaking Things

### Golden Rule
> **Never edit files inside `_bmad/`.**  
> Edit your source module, then reinstall.

### Update Workflow

```bash
# 1. Edit your source module
cd ~/Library/BMAD/modules/bmad-beast-mode
# Make your changes to agents, workflows, etc.

# 2. Push to GitHub (optional but recommended)
git add . && git commit -m "feat: Update analyst agent"
git push origin main

# 3. Update your project
cd ~/Desktop/my-project
npx bmad-method@alpha install
# Choose: Modify → Update custom modules
```

---

## 🌉 Beast Bridge (V4 Compatibility)

Your module includes **V4 name aliases** so the Protocol Enforcer can find agents:

| V4 Name (Enforcer calls) | → Beast Mode Agent |
|--------------------------|-------------------|
| `security` | sec-ops |
| `data-governance` | dpo |
| `observability` | o11y |
| `performance` | perf |
| `red-team` | ai-red-team |
| `integration-lead` | integrations |
| `accessibility` | a11y |
| `localization` | i18n |
| `ux-writer` | copywriter |
| `developer` | dev |
| `scrum-master` | sm |

---

## ⚠️ Common Mistakes

### ❌ Don't: Edit `_bmad/beast-mode/agents/*.md` directly
**Why:** Changes are lost on next install.  
**Do:** Edit `~/Library/BMAD/modules/bmad-beast-mode/agents/*.md`, then reinstall.

### ❌ Don't: Mix multiple agents in one chat
**Why:** Context collision causes confused responses.  
**Do:** Fresh chat per agent. Pass artifacts forward via file references.

### ❌ Don't: Skip the Protocol Enforcer for complex tickets
**Why:** Unstructured work leads to scope creep.  
**Do:** `/load enforcer` → generate protocol → follow the phases.

### ❌ Don't: Forget to install BMM if you want full methodology
**Why:** Beast Mode is agents only—BMM provides the PRD/architecture workflows.  
**Do:** Install BMM + Beast Mode together.

---

## 🏗️ Adding New Agents to Beast Mode

### Step 1: Create the Agent File

```bash
cd ~/Library/BMAD/modules/bmad-beast-mode
touch agents/core/my-new-agent.md
```

### Step 2: Define the Agent

```markdown
# BMAD-AGENT: My New Agent

agent:
  name: MyNewAgent
  role: Description of what this agent does
  when_to_use: When to activate this agent

  commands:
    my-command:
      description: "What this command does"
      steps:
        1. First step
        2. Second step
```

### Step 3: Register in module.yaml

```yaml
exports:
  agents:
    # ... existing agents ...
    my-new-agent: agents/core/my-new-agent.md
```

### Step 4: Reinstall to Project

```bash
cd ~/Desktop/my-project
npx bmad-method@alpha install
# Modify → Update custom modules
```

---

## 🔌 Adding New Workflows

### Step 1: Create the Workflow File

```bash
cd ~/Library/BMAD/modules/bmad-beast-mode
touch workflows/my-workflow.yaml
```

### Step 2: Define the Workflow

```yaml
name: my-workflow
description: "What this workflow does"

phases:
  - name: analysis
    agent: analyst
    command: "*analyze-problem"
    output: "01-analysis.md"
    
  - name: implementation
    agent: dev
    command: "*implement-fix"
    output: "03-implementation.md"
```

### Step 3: Register in module.yaml

```yaml
exports:
  workflows:
    # ... existing workflows ...
    my-workflow: workflows/my-workflow.yaml
```

### Step 4: Reinstall

```bash
cd ~/Desktop/my-project
npx bmad-method@alpha install
```

---

## 📋 Context Fuel Template

When starting any ticket, provide this context:

```markdown
## Context Fuel

**Issue/Request:**
[What you want to build or fix]

**Current Behavior:**
[What's happening now]

**Expected Behavior:**
[What should happen]

**Evidence:**
- Console errors: [paste any]
- Screenshots: [describe or attach]
- Reproduction: [1. 2. 3.]

**Tech Stack:**
- Frontend: [React/Vue/etc]
- Backend: [Node/Python/etc]
- Database: [Postgres/Mongo/etc]
- Relevant files: [list key files]

**Constraints:**
- [ ] Must not break existing functionality
- [ ] Must be backwards compatible
- [ ] Other: [specify]
```

---

## 🆘 Troubleshooting

### "Can't find agent" error
**Cause:** Module not installed or path wrong.  
**Fix:** Re-run installer with correct path:
```bash
npx bmad-method@alpha install
# Path: /Users/YOUR_USERNAME/Library/BMAD/modules/bmad-beast-mode
```

### "Missing docs" loops
**Cause:** Workflow expects input files that don't exist.  
**Fix:** Run `*workflow-init` first, or manually create the expected files in `_bmad-output/planning-artifacts/`.

### Agents give conflicting advice
**Cause:** Multiple agents in same chat.  
**Fix:** Start fresh chat for each agent. Pass artifacts via file references.

### Changes not reflected after edit
**Cause:** You edited `_bmad/` instead of source module.  
**Fix:** Edit `~/Library/BMAD/modules/bmad-beast-mode/`, then reinstall.

---

## 📊 Version Info

| Property | Value |
|----------|-------|
| Version | 3.1.0 |
| Agents | 33 |
| Workflows | 7 |
| Templates | 8 |
| BMAD Compatibility | v6.0.0-alpha.22+ |

---

## 🔗 Resources

- **BMAD Method:** [github.com/bmad-code-org/BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD)
- **Beast Mode Repo:** [github.com/SamuelSaha/bmad-beast-mode](https://github.com/SamuelSaha/bmad-beast-mode)
- **BMAD Changelog:** [BMAD-METHOD/CHANGELOG.md](https://github.com/bmad-code-org/BMAD-METHOD/blob/main/CHANGELOG.md)

---

**Built with 🔥 Beast Mode**
