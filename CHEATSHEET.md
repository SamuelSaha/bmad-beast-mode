# 🦁 BEAST MODE CHEAT SHEET

> **Quick Reference Guide** — All commands, workflows, agents, and skills at a glance.

---

## ⚡ QUICK START

```bash
# Activate the Director for intelligent routing
*start

# Assemble a custom multi-agent team
*squad-up

# Verify the last change
*verify

# Run the Janitor protocol on current file
*clean
```

---

## 🔄 WORKFLOWS (Slash Commands)

### Layer A — Problem & Scope

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/problem-framing` | Turn vague ideas into buildable problems | "I have an idea but it's fuzzy" |
| `/wedge-definition` | Define minimum differentiated solution | "What's the smallest thing we can ship?" |

### Layer B — Solution Design

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/discovery-protocol` | Solution design & architecture | "How should we build this?" |
| `/tech-contract` | Freeze interfaces before coding | "Let's lock the API before dev starts" |

### Layer C — Build & Change

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/standard-feature` | Ship routine features in <1 day | Default for most features |
| `/skill-feature` | Complex features with skill injection | Auth, billing, permissions |
| `/quick-fix` | Fix bugs in <30 minutes | Small, isolated bugs |
| `/bug-localize` | Pinpoint exact bug source | Before `/quick-fix` for unclear bugs |
| `/smart-refactor` | Pay down tech debt safely | Structure change, no behavior change |
| `/epic-feature` | Multi-day complex features | Large initiatives |
| `/10x-feature` | Multiply feature impact | Optimization phase |

### Layer D — Validation & Launch

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/launch-protocol` | Zero-defect production releases | Pre-launch checklist |
| `/progressive-rollout` | Controlled exposure with metrics | Gradual deployment |
| `/close-issue` | Auto-sync Plane on completion | After feature/bug complete |

### Layer E — Post-Launch

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/feedback-ingestion` | Turn runtime behavior into backlog | Post-launch learning |

---

## 🧑‍💼 AGENTS (@ Mentions)

### Core Squad (10 agents)

| Agent | Call Sign | What They Do | Example Prompt |
|-------|-----------|--------------|----------------|
| `@beast-analyst` | ATLAS | Root cause analysis, 5 Whys | "Why is login failing?" |
| `@beast-architect` | MATRIX | System design, APIs | "Design the auth architecture" |
| `@beast-dev` | FORGE | Implementation, coding | "Build the login form" |
| `@beast-pm` | VANTAGE | PRDs, requirements | "Write PRD for onboarding" |
| `@beast-qa` | HUNTER | Testing, edge cases | "Test the payment flow" |
| `@beast-sm` | TEMPO | Sprint planning | "Break this into stories" |
| `@beast-brainstormer` | SPARK | Ideation, naming | "Name ideas for this feature" |
| `@beast-data` | ORACLE | Metrics, analytics | "What KPIs should we track?" |
| `@beast-ux` | MUSE | UX design, wireframes | "Design the settings page" |
| `@beast-task` | SCRIBE | Task creation, decomposition | "Create tasks for auth feature" |

### Security Squad (3 agents)

| Agent | Call Sign | What They Do | Example Prompt |
|-------|-----------|--------------|----------------|
| `@beast-sec` | AEGIS | Security architecture | "Review security of API" |
| `@beast-pentest` | BREAKER | Penetration testing | "Find vulnerabilities" |
| `@beast-dpo` | SENTINEL | GDPR, privacy | "Is this GDPR compliant?" |

### Ops Squad (7 agents)

| Agent | Call Sign | What They Do | Example Prompt |
|-------|-----------|--------------|----------------|
| `@beast-sre` | TITAN | Reliability, SLOs | "Keep auth service running" |
| `@beast-devops` | FLOW | CI/CD, pipelines | "Set up GitHub Actions" |
| `@beast-o11y` | SCOPE | Monitoring, logs | "Add logging to payments" |
| `@beast-finops` | VAULT | Cloud costs | "Reduce our AWS bill" |
| `@beast-perf` | NITRO | Performance | "Make search faster" |
| `@beast-incident` | ZERO | Incident management | "Site is down!" |
| `@beast-plane` | ORBIT | Plane PM, issues | "Create issue for bug" |

### Growth Squad (4 agents)

| Agent | Call Sign | What They Do | Example Prompt |
|-------|-----------|--------------|----------------|
| `@beast-growth` | BOOST | Acquisition, conversion | "Improve signup funnel" |
| `@beast-monetization` | MINT | Pricing, revenue | "Design pricing tiers" |
| `@beast-value` | COMPASS2 | User research | "What do users want?" |
| `@beast-finance` | CAPITAL | French fiscal law | "Calculate PFU vs IR" |

### Polish Squad (2 agents)

| Agent | Call Sign | What They Do | Example Prompt |
|-------|-----------|--------------|----------------|
| `@beast-navigator` | COMPASS | Route/page localization | "Where is this bug?" |
| `@beast-i18n` | BABEL | Internationalization | "Translate to French" |

### AI-Eco Squad (3 agents)

| Agent | Call Sign | What They Do | Example Prompt |
|-------|-----------|--------------|----------------|
| `@beast-eval` | JUDGE | LLM evaluation | "Test our AI accuracy" |
| `@beast-red` | VIRUS | AI red teaming | "Break our AI" |
| `@beast-integration` | NEXUS | API integrations | "Connect to Stripe API" |

### Meta Agents (2 agents)

| Agent | Call Sign | What They Do | Example Prompt |
|-------|-----------|--------------|----------------|
| `@beast-orch` | DIRECTOR | Routing, coordination | "Who handles this?" |
| `@beast-enforcer` | WARDEN | Protocol enforcement | "Are we ready to ship?" |

---

## 🧰 SKILLS (Inject with "Use X skill")

### Foundation

| Skill | Purpose | Example |
|-------|---------|---------|
| `execution-discipline` | Deterministic execution, verification | **ALWAYS ACTIVE** (foundational) |
| `saas-workflows` | Full SaaS lifecycle, Golden Chain | "Use saas-workflows skill to plan the feature" |
| `task-creation` | 6-question tasks, decomposition | "Use task-creation skill to break this down" |
| `react-state-patterns` | Global vs local state, lifting | "Use react-state-patterns for store design" |
| `frontend-engineering` | Semantic HTML, a11y, SVG, React | "Use frontend-engineering for component review" |
| `supabase-mastery` | RLS, Edge Functions, Auth | "Use supabase-mastery skill for RLS" |
| `next15-patterns` | App Router, Server Actions | "Use next15-patterns for the page" |
| `typescript-precision` | Branded types, Zod | "Use typescript-precision for validation" |

### Security

| Skill | Purpose | Example |
|-------|---------|---------|
| `zero-trust` | Auth, validation, defense | "Use zero-trust skill for auth review" |

### Growth

| Skill | Purpose | Example |
|-------|---------|---------|
| `french-fiscal` | IR, PFU, IFI calculations | "Use french-fiscal for tax simulation" |

### Ops

| Skill | Purpose | Example |
|-------|---------|---------|
| `cicd-pipelines` | GitHub Actions, Vercel | "Use cicd-pipelines for deployment" |
| `observability` | Logging, metrics, Sentry | "Use observability skill for monitoring" |
| `plane-management` | Plane API, issues, sprints | "Use plane-management to create issue" |

### Polish

| Skill | Purpose | Example |
|-------|---------|---------|
| `accessibility-wcag` | WCAG 2.2 AA compliance | "Use accessibility-wcag for audit" |

### AI

| Skill | Purpose | Example |
|-------|---------|---------|
| `ai-development` | Probabilistic PRD, Golden Datasets | "Use ai-development for AI feature" |
| `prompt-engineering` | LLM prompts, RAG, safety | "Use prompt-engineering for the chatbot" |

---

## 📋 PLANE PROJECT MANAGEMENT

### Issue Management

```bash
# List all projects
python3 plane_client.py -w samsam list_projects

# List issues in project
python3 plane_client.py -w samsam list_issues -p Couplance

# Create issue
python3 plane_client.py -w samsam create_issue \
  -p Couplance \
  -t "Bug: Login fails on mobile" \
  --priority 1 \
  --state "Todo" \
  --assignees "email@example.com"

# Update issue state
python3 plane_client.py -w samsam update_issue \
  -p Couplance \
  -i COUPLANCE-1 \
  --state "Done"
```

### Sub-Issues & Links

```bash
# Create sub-issue
python3 plane_client.py -w samsam create_sub_issue \
  -p Couplance \
  --parent COUPLANCE-1 \
  -t "Implement fix for mobile login"

# Add external link
python3 plane_client.py -w samsam add_link \
  -p Couplance \
  -i COUPLANCE-1 \
  --url "https://figma.com/design" \
  --title "Design Spec"
```

### Modules (Sprints)

```bash
# Create module
python3 plane_client.py -w samsam create_module \
  -p Couplance \
  -n "Sprint 1" \
  --start_date 2026-01-22 \
  --target_date 2026-02-05

# Add issue to module
python3 plane_client.py -w samsam add_issue_to_module \
  -p Couplance \
  -m "Sprint 1" \
  -i COUPLANCE-1
```

### Labels

```bash
# Create label
python3 plane_client.py -w samsam create_label \
  -p Couplance \
  -n "frontend" \
  -c "#3498db"
```

---

## 📝 TASK CREATION (6 Questions)

Every task must answer:

| # | Question | Section |
|---|----------|---------|
| 1 | What is changing? | Change Scope |
| 2 | Why is it changing? | Context |
| 3 | What is NOT changing? | Exclusions |
| 4 | What is impacted? | Impact Analysis |
| 5 | What must be documented? | Documentation Updates |
| 6 | How do we know it's done? | Acceptance Criteria |

### Task Types

| Type | Purpose | Label Color |
|------|---------|-------------|
| `decision` | Locks scope/direction | Purple `#9b59b6` |
| `design` | Diagrams/specs | Blue `#3498db` |
| `implementation` | Code changes | Green `#2ecc71` |
| `refactor` | Structure, no behavior | Orange `#f39c12` |
| `test` | Validation | Teal `#1abc9c` |
| `documentation` | Docs only | Gray `#95a5a6` |
| `release` | Deployment | Red `#e74c3c` |
| `prompt` | AI prompt engineering | Purple `#9b59b6` |

---

## 🤖 AI DEVELOPMENT

### Stochastic Floor (Accuracy Thresholds)

| Risk Level | Required Accuracy | Fallback |
|------------|-------------------|----------|
| High (medical, legal) | 99%+ | Human review |
| Medium (support, search) | 90%+ | Rule-based |
| Low (creative, suggestions) | 70%+ | User edits |

### AI-PRD Checklist

- [ ] Proto-prompts included
- [ ] Few-shot examples (3-5)
- [ ] Stochastic Floor defined
- [ ] Fallback strategy documented
- [ ] Model routing logic specified
- [ ] Token budget defined

### Golden Dataset

```
golden_dataset/
├── inputs/
│   ├── happy_path/
│   ├── edge_cases/
│   └── adversarial/
└── expected_outputs/
```

Minimum: **50 test cases**

### Kill Switch

```typescript
if (featureFlags.get('ai_feature')) {
  return await aiProcess(input);
} else {
  return legacyProcess(input);  // Fallback
}
```

---

## 🔗 THE GOLDEN CHAIN

```
problem-framing       (Layer A - Problem certainty)
       ↓
wedge-definition      (Layer A - Scope certainty)
       ↓
solution-design       (Layer B - Solution certainty)
       ↓
tech-contract         (Layer B - Interface certainty)
       ↓
standard-feature      (Layer C - Implementation certainty)
       ↓
launch-readiness      (Layer D - Operational certainty)
       ↓
progressive-rollout   (Layer D - Deployment certainty)
       ↓
feedback-ingestion    (Layer E - Learning certainty)
```

**Rule:** Skip a step = Pay later.

---

## ⚖️ HIERARCHY OF VALUE

When rules conflict, higher wins:

1. **SECURITY** > Everything
2. **PERFORMANCE** > Aesthetics
3. **SIMPLICITY** > Features
4. **UX** > Cleverness
5. **FEATURES** > Polish

---

## 🚫 COMMON MISTAKES

| Don't | Do |
|-------|-----|
| Use `react-day-picker` | Use `<input type="date">` |
| Use pure black `#000000` | Use Obsidian `#020204` |
| Transitions in `layout.tsx` | Use `template.tsx` |
| Paste imports mid-file | Read lines 1-20 first |
| Leave console.logs | Delete before commit |
| "Update docs accordingly" | Specify exact file + section |
| Investigate without locating | Run `/bug-localize` first |
| Skip security checks | Every task needs security section |

---

## 📊 VERIFICATION REPORT TEMPLATE

```markdown
## Verification Report

### Changes Made
- [ ] File 1: [change description]
- [ ] File 2: [change description]

### Tests Run
- [ ] `npm run build` ✅
- [ ] `npm run lint` ✅
- [ ] `npm run test` ✅

### Verification Steps
1. [Step 1] → Result: ✅
2. [Step 2] → Result: ✅

### Status
✅ VERIFIED WORKING
```

---

## 🔒 PROTOCOL VERSION

```
Protocol: Beast Mode Apex
Version: 5.0.0
Last Updated: 2026-01-22
Skills: 17 | Agents: 37 | Workflows: 15
Standard: Production-Grade Distributed Execution
```
