# 🔥 Beast Mode v3.2 — Top 1% Industry Authority

> **34 Principal-Level AI Agents** for BMAD Method v6  
> Namespaced `beast-*` to avoid clash with standard BMAD. No fork. No drift. Pure power.
> 
> **Quick Setup:** See [`BMAD_BOOTSTRAP.md`](./BMAD_BOOTSTRAP.md) for <60 second install.

---

## ⚡ TL;DR (30 Seconds)

```bash
# In any new project folder:
npx bmad-method@alpha install

# When prompted:
# 1. Select tools: Google Antigravity, OpenCode, etc.
# 2. Select modules: BMM (BMAD Method) ← IMPORTANT!
# 3. "Install local custom module?" → y
# 4. Path: /Users/YOUR_USERNAME/Library/BMAD/modules/bmad-beast-mode
```

**That's it.** Your 31 specialized agents are now available.

---

## � Critical: What Module to Install

| Your Goal | Install These Modules |
|-----------|----------------------|
| Full product dev (PRD → Architecture → Stories) | **BMM** + Beast Mode |
| Just building agents/workflows | **BMB** + Beast Mode |
| Quick prototyping | **BMB** + Beast Mode |
| Game development | **BMGD** + Beast Mode |

> ⚠️ **BMM (BMAD Method)** gives you `*workflow-init`, `*brainstorm-project`, etc.  
> Without it, you only get Beast Mode agents but not the official workflows.

---

## 📍 Where Do Files End Up?

After `npx bmad-method@alpha install`, your project looks like this:

```
my-project/
├── _bmad/                          # BMAD installation
│   ├── bmm/                        # Official BMAD Method (if installed)
│   │   ├── agents/                 # Official agents
│   │   └── workflows/              # Official workflows
│   ├── beast-mode/                 # YOUR CUSTOM MODULE
│   │   ├── agents/                 # Your 31 agents ← HERE
│   │   │   ├── core/
│   │   │   ├── security/
│   │   │   ├── growth/
│   │   │   ├── ops/
│   │   │   ├── polish/
│   │   │   ├── ai-eco/
│   │   │   └── meta/
│   │   ├── workflows/
│   │   ├── templates/
│   │   └── config/
│   └── core/                       # BMAD Core
├── _bmad-output/                   # Where artifacts go
│   ├── planning-artifacts/         # PRD, architecture, etc.
│   └── implementation-artifacts/   # Stories, code notes
├── .antigravity/ or .opencode/     # Tool configs
└── docs/                           # Long-term documentation
```

---

## � Verify Your Installation

After installing, run these checks:

```bash
# Check Beast Mode agents exist
ls _bmad/beast-mode/agents/

# Expected output:
# ai-eco  core  growth  meta  ops  orchestrator.md  polish  security

# Check a specific agent
cat _bmad/beast-mode/agents/core/analyst.md | head -20
```

**If `_bmad/beast-mode/` doesn't exist**, the module wasn't installed correctly. See Troubleshooting below.

---

## 🎮 How to Use Beast Mode Agents

### Loading Agents (IDE Method)

In your IDE (Antigravity, OpenCode, Cursor, etc.):

```
/beast-analyst          # Load Beast Analyst
/beast-architect        # Load Beast Architect  
/beast-dev              # Load Beast Developer
/bmad                   # List all available agents
```

### Using Agent Commands

```
# After loading beast-analyst:
*beast-analyze context: 'Describe your issue here'

# After loading beast-architect:
*beast-arch

# After loading beast-enforcer:
*beast-enforce context: '...'
```

### Method 1: Quick Fix Flow

```
/beast-analyst
*beast-analyze context: 'Button not working'

/beast-dev  
*beast-fix
```

### Method 2: Full Protocol (Structured Tickets)

```
/beast-enforcer

*beast-enforce context: '
Issue: Login button broken
Current: Button renders but onClick fails
Expected: User can authenticate
Stack: React 18, NextAuth
'

# Follow the generated protocol step by step
```

---

## 📋 Available Agents (31 + Orchestrator)

### Core Squad (9 agents)
| Agent | Command | Purpose |
|-------|---------|---------|
| `brainstormer` | `*brainstorm` | Divergent ideation |
| `analyst` | `*analyze-problem` | Root cause analysis |
| `pm` | `*create-prd` | Product requirements |
| `architect` | `*define-contract` | Technical specification |
| `dev` | `*implement-fix` | Code implementation |
| `qa` | `*review-feature` | Quality validation |
| `ux-designer` | `*define-ux` | User experience design |
| `sm` | `*create-stories` | Story splitting |
| `data-analyst` | `*define-metrics` | Analytics tracking |

### Security Squad (3 agents)
| Agent | Command | Purpose |
|-------|---------|---------|
| `sec-ops` | `*threat-model` | Security architecture |
| `pentester` | `*security-scan` | Vulnerability testing |
| `dpo` | `*privacy-impact` | GDPR/privacy compliance |

### Growth Squad (5 agents)
| Agent | Command | Purpose |
|-------|---------|---------|
| `user-value` | `*value-analysis` | User value mapping |
| `pricing` | `*pricing-model` | Monetization strategy |
| `growth` | `*growth-experiment` | A/B testing |
| `retention` | `*retention-analysis` | Churn prevention |
| `support` | `*support-workflow` | Customer support |

### Ops Squad (6 agents)
| Agent | Command | Purpose |
|-------|---------|---------|
| `sre` | `*slo-definition` | Reliability engineering |
| `devops` | `*pipeline-design` | CI/CD automation |
| `o11y` | `*observability-plan` | Monitoring & logging |
| `finops` | `*cost-analysis` | Cloud cost optimization |
| `perf` | `*performance-audit` | Performance optimization |
| `incident` | `*incident-response` | Incident management |

### Polish Squad (5 agents)
| Agent | Command | Purpose |
|-------|---------|---------|
| `copywriter` | `*ux-copy` | UX writing |
| `a11y` | `*accessibility-audit` | WCAG compliance |
| `i18n` | `*localization-plan` | Internationalization |
| `seo` | `*seo-audit` | Search optimization |
| `tech-writer` | `*documentation` | Technical docs |

### AI-Eco Squad (3 agents)
| Agent | Command | Purpose |
|-------|---------|---------|
| `ai-eval` | `*eval-suite` | LLM evaluation |
| `ai-red-team` | `*adversarial-test` | Prompt injection testing |
| `integrations` | `*integration-design` | Third-party integrations |

### Meta
| Agent | Command | Purpose |
|-------|---------|---------|
| `enforcer` | `*enforce` | Generate structured protocols |
| `orchestrator` | `*start` | Traffic routing |

---

## 🔄 Updating Beast Mode

### Your Source Module Location
```
~/Library/BMAD/modules/bmad-beast-mode/
```

### Update Flow

1. **Edit your source module** (not the installed copy!)
   ```bash
   cd ~/Library/BMAD/modules/bmad-beast-mode
   vim agents/core/analyst.md  # Make your changes
   ```

2. **Push to GitHub** (optional but recommended)
   ```bash
   git add . && git commit -m "Update analyst"
   git push origin main
   ```

3. **Update your project** (choose one):

   **Option A: Re-run installer (clean)**
   ```bash
   cd ~/Desktop/my-project
   npx bmad-method@alpha install
   # Choose: Modify BMAD Installation → Update custom modules
   ```

   **Option B: Manual copy (fast)**
   ```bash
   cd ~/Desktop/my-project
   cp -R ~/Library/BMAD/modules/bmad-beast-mode/* _bmad/beast-mode/
   ```

> ⚠️ **Never edit files inside `_bmad/beast-mode/` directly!**  
> Those changes are lost when you update.

---

## 🆘 Troubleshooting

### Problem: `_bmad/beast-mode/` folder doesn't exist

**Cause:** Module wasn't installed or installed to different location.

**Check 1:** Verify source module exists
```bash
ls ~/Library/BMAD/modules/bmad-beast-mode/module.yaml
# Should show the file
```

**Check 2:** Re-run installer with correct path
```bash
npx bmad-method@alpha install
# When prompted for custom module path, use EXACT path:
/Users/YOUR_USERNAME/Library/BMAD/modules/bmad-beast-mode
```

**Check 3:** Look for alternative locations
```bash
# The installer might place it differently
find _bmad -name "analyst.md" 2>/dev/null
```

---

### Problem: "Module configured" but files not there

**Cause:** BMAD caches module config but didn't copy files.

**Fix:** Manual copy
```bash
mkdir -p _bmad/beast-mode
cp -R ~/Library/BMAD/modules/bmad-beast-mode/* _bmad/beast-mode/
```

---

### Problem: `/load agent` says "not found"

**Cause:** Agent not in expected path.

**Fix 1:** Check the exact path your tool expects
```bash
# For Antigravity
cat .antigravity/agents.json

# For OpenCode
cat .opencode/config.yaml
```

**Fix 2:** Ensure agents are in the right structure
```bash
ls _bmad/beast-mode/agents/core/
# Should list: analyst.md, architect.md, brainstormer.md, etc.
```

---

### Problem: `*workflow-init` doesn't work

**Cause:** You didn't install BMM (BMAD Method module).

**Fix:** Re-run installer and select BMM
```bash
npx bmad-method@alpha install
# Select: BMM: BMad Method Agile-AI Driven-Development
```

---

### Problem: "Can't find input files" during workflow

**Cause:** Artifacts expected in different folder.

**Fix:** BMAD v6 Alpha.22 uses these paths:
- Planning artifacts: `_bmad-output/planning-artifacts/`
- Implementation artifacts: `_bmad-output/implementation-artifacts/`
- Project docs: `docs/`

Create the folders if needed:
```bash
mkdir -p _bmad-output/planning-artifacts
mkdir -p _bmad-output/implementation-artifacts
```

---

## 📊 Complete Installation Example

Here's a full installation walkthrough:

```bash
# 1. Create project
mkdir my-saas-app
cd my-saas-app
git init

# 2. Run BMAD installer
npx bmad-method@alpha install

# 3. Answer prompts:
#    Installation directory: (press Enter for current)
#    Install to this directory? Y
#    Select tools: Google Antigravity ⭐, OpenCode ⭐
#    Install official modules? Y
#    Select modules: BMM: BMad Method ← IMPORTANT!
#    Install local custom module? Y
#    Path: /Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode
#    Continue with installation
#    Install 1 custom module(s) now? Y
#    What shall agents call you? Sam
#    Preferred language? English
#    Document output language? English
#    Output folder? _bmad-output
#    Accept BMM defaults? Y

# 4. Verify installation
ls _bmad/
# Should show: bmm  beast-mode  core (or similar)

ls _bmad/beast-mode/agents/core/
# Should show: analyst.md architect.md brainstormer.md ...

# 5. Start using it
npx bmad session
> /load analyst
> *analyze-problem context: 'Test issue'
```

---

## 🎯 Quick Reference Card

| Action | Command |
|--------|---------|
| Start session | `npx bmad session` |
| Load agent | `/load analyst` |
| See menu | `*menu` |
| Analyze problem | `*analyze-problem context: '...'` |
| Create PRD | `*create-prd` |
| Technical spec | `*define-contract` |
| Implement | `*implement-fix` |
| Review | `*review-feature` |
| Generate protocol | `*enforce context: '...'` |
| Check workflow status | `*workflow-status` |
| Initialize workflow | `*workflow-init` |

---

## 📁 Module Contents

```
bmad-beast-mode/
├── module.yaml          # BMAD v6 contract
├── README.md            # This file
├── ADDING-AGENTS.md     # How to add agents
├── ADDING-WORKFLOWS.md  # How to add workflows
├── agents/              # 33 agent files (292KB)
├── workflows/           # 7 workflow files (40KB)
├── templates/           # 8 template files (32KB)
└── config/              # 5 config files (36KB)
```

**Total size: ~408KB**

---

## 🔗 Resources

| Resource | Link |
|----------|------|
| Beast Mode Repo | [github.com/SamuelSaha/bmad-beast-mode](https://github.com/SamuelSaha/bmad-beast-mode) |
| Official BMAD | [github.com/bmad-code-org/BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD) |
| BMAD Changelog | [CHANGELOG.md](https://github.com/bmad-code-org/BMAD-METHOD/blob/main/CHANGELOG.md) |
| BMAD Docs | [bmad-method.org](https://bmad-method.org) |

---

## 📝 Version History

| Version | Changes |
|---------|---------|
| 3.1.0 | Added Protocol Enforcer, Beast Bridge V4 aliases, comprehensive docs |
| 3.0.0 | Stripped to essentials, BMAD v6 compatible format |
| 2.2.0 | Added Brainstormer agent |
| 2.0.0 | Initial 31-agent roster |

---

**Built with 🔥 by Beast Mode**  
**For BMAD Method v6.0.0-alpha.22+**
