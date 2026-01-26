# 🧰 Beast Mode Skills Library

> **Skills** = Deep domain knowledge + executable scripts + reusable templates that any agent can inherit.

---

## 📐 The Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    THE GOLDEN CHAIN (Workflows)                 │
│   problem-framing → wedge-definition → tech-contract            │
│        → standard-feature → launch-readiness → progressive-rollout │
├─────────────────────────────────────────────────────────────────┤
│                       AGENTS (The Who)                          │
│   @beast-task  @beast-dev  @beast-plane  @beast-architect  ...  │
├─────────────────────────────────────────────────────────────────┤
│                       SKILLS (The Toolbox)                      │
│   saas-workflows  task-creation  plane-management  ...          │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🔗 The Golden Chain

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

**Skip a step = Pay later.**

---

## 🗂️ Skill Categories

| Category | Purpose | Primary Agents |
|----------|---------|----------------|
| **foundation/** | SaaS workflows, task creation, stack mastery | All Core Squad |
| **security/** | Zero-trust, compliance, attack prevention | Security Squad |
| **growth/** | Monetization, retention, French fiscal | Growth Squad |
| **ops/** | CI/CD, observability, Plane PM, cost optimization | Ops Squad |
| **polish/** | A11y, SEO, i18n architecture | Polish Squad |
| **ai/** | Prompt engineering, LLM security, orchestration | AI-Eco Squad |

---

## 📚 Skill Inventory

### Foundation Skills

| Skill | Description | Primary Agent |
|-------|-------------|---------------|
| `saas-workflows` | Full SaaS lifecycle, Golden Chain, 5 certainty layers | @beast-task, @beast-pm |
| `task-creation` | 6-question protocol, canonical template, decomposition | @beast-task |
| `supabase-mastery` | RLS, Edge Functions, Auth, migrations | @beast-dev |
| `next15-patterns` | App Router, Server Actions, Caching | @beast-dev |
| `typescript-precision` | Branded types, Zod, strict mode | @beast-dev |

### Ops Skills

| Skill | Description | Primary Agent |
|-------|-------------|---------------|
| `plane-management` | Plane API, issues, modules, sprints | @beast-plane |
| `cicd-pipelines` | GitHub Actions, Vercel, deploys | @beast-devops |
| `observability` | Logging, metrics, tracing, Sentry | @beast-o11y |

---

## 🔧 How to Use Skills

### As a User:
```bash
@beast-task Use the saas-workflows skill to create tasks for the auth feature.
@beast-dev Use the supabase-mastery skill to implement RLS policies.
```

### As an Agent:
When invoked, the agent will:
1. `view_file` the skill's `SKILL.md` to load domain knowledge
2. Execute any scripts in the skill's `/scripts` folder
3. Reference examples in `/examples` for patterns

---

## 📜 Skill Format

Each skill is a directory containing:

```
skills/foundation/saas-workflows/
├── SKILL.md          # Core knowledge + protocols
├── scripts/
│   └── validate.sh   # Executable automation
└── examples/
    └── task-template.md  # Reference implementations
```

---

## 🚀 Creating New Skills

1. Create folder: `skills/<category>/<skill-name>/`
2. Write `SKILL.md` with frontmatter + instructions
3. Add scripts for automation (optional)
4. Add examples for reference (recommended)

See individual SKILL.md files for detailed protocols.

