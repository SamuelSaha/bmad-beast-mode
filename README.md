# 🔥 Beast Mode Squad Roster

**A 31-agent specialized engineering organization for AI-driven development.**

[![BMAD Compatible](https://img.shields.io/badge/BMAD-v6%20Compatible-blue)](https://github.com/bmad-code-org/BMAD-METHOD)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Agents](https://img.shields.io/badge/Agents-31-green)]()
[![Workflows](https://img.shields.io/badge/Workflows-4-orange)]()

---

## 🎯 What is Beast Mode?

Beast Mode is a **custom BMAD module** that provides a complete, production-ready AI agent organization for software development. It extends the standard BMAD framework with:

- **31 specialized agents** organized into 6 squads
- **4 workflow tracks** from quick fixes to enterprise features
- **Artifact templates** for consistent documentation
- **Squad activation triggers** for smart agent routing

## 📦 Installation

### Option 1: BMAD Module Installation
```bash
# After installing BMAD Method v6
npx bmad-method@alpha install

# Then install Beast Mode as a custom module
# (Copy this directory to your project's _bmad/modules/)
```

### Option 2: Direct Installation
```bash
# Clone directly into your project
git clone https://github.com/samuelsaha/bmad-beast-mode.git _bmad/modules/beast-mode
```

---

## 🏛️ Squad Organization

### 🔵 Core Squad (8 agents)
Essential development workflow agents - **always active**.

| Agent | Role | Command |
|-------|------|---------|
| Analyst | Root Cause Analysis | `*analyze-problem` |
| PM | Product Requirements | `*create-prd` |
| UX | User Experience Design | `*define-ux` |
| Architect | Technical Architecture | `*define-contract` |
| SM | User Stories | `*create-stories` |
| Dev | Implementation | `*implement-fix` |
| QA | Quality Assurance | `*review-feature` |
| Data | Analytics & Tracking | `*define-metrics` |

### 🔴 Security Squad (4 agents)
Security, privacy, and compliance specialists.

| Agent | Role | Command |
|-------|------|---------|
| SecOps | Threat Modeling | `*threat-model` |
| DPO | Privacy Impact | `*privacy-check` |
| Pentester | Offensive Testing | `*abuse-test` |
| AppSecBot | Automated Scanning | `*scan-code` |

**Triggers:** auth, payment, PII, GDPR, upload, secrets

### 🟢 Growth Squad (6 agents)
Product growth and monetization specialists.

| Agent | Role | Command |
|-------|------|---------|
| Value Advocate | Feature Validation | `*sanity-check` |
| Pricing | Monetization Strategy | `*audit-pricing` |
| Growth | A/B Testing | `*plan-experiment` |
| Retention | Churn Analysis | `*churn-risk` |
| Support | Customer Readiness | `*support-audit` |
| Entitlements | Feature Gating | `*audit-entitlements` |

**Triggers:** pricing, subscription, onboarding, retention, quota

### 🟣 Ops Squad (4 agents)
Infrastructure and reliability specialists.

| Agent | Role | Command |
|-------|------|---------|
| DevOps | Deployment Strategy | `*deployment-plan` |
| DBA | Database Design | `*schema-design` |
| SRE | Observability & SLOs | `*define-slo` |
| Perf | Performance Optimization | `*perf-audit` |

**Triggers:** deploy, database, migration, performance, scale

### 🟡 Polish Squad (5 agents)
Code quality and documentation specialists.

| Agent | Role | Command |
|-------|------|---------|
| Reviewer | Code Review | `*review-code` |
| Tech Writer | Documentation | `*write-docs` |
| A11y | Accessibility | `*a11y-audit` |
| i18n | Internationalization | `*i18n-audit` |
| Refactor | Tech Debt | `*plan-refactor` |

**Triggers:** review, documentation, accessibility, translation, cleanup

### 🤖 AI-Eco Squad (4 agents)
AI/ML feature development specialists.

| Agent | Role | Command |
|-------|------|---------|
| Prompt Eng | Prompt Design | `*design-prompt` |
| AI Safety | Ethics & Safety | `*safety-audit` |
| AI Cost | Token Optimization | `*cost-analysis` |
| AI Arch | AI Integration | `*design-integration` |

**Triggers:** AI, LLM, GPT, Claude, prompt, chatbot

---

## 🚀 Workflows

### ⚡ Quick Fix Flow
**For:** Bug fixes, small changes  
**Time:** < 2 hours  
**Agents:** Analyst → Architect → Dev → QA

```
*workflow-init context: "Fix the date picker bug"
```

### 📋 Standard Feature Flow
**For:** Features, medium changes  
**Time:** 1 day - 1 week  
**Agents:** Full Core Squad + optional specialists

```
*workflow-init context: "Add user profile editing feature"
```

### 🏢 Enterprise Feature Flow
**For:** Critical, compliance-required changes  
**Time:** 1-4 weeks  
**Agents:** All squads, sign-off required

```
*workflow-init context: "Implement payment processing"
```

### 🤖 AI Feature Flow
**For:** LLM/ML integrations  
**Time:** 1-2 weeks  
**Agents:** Core + AI-Eco Squad

```
*workflow-init context: "Add AI-powered recommendations"
```

---

## 📁 Artifact Structure

All artifacts are saved to `docs/bmad/{slug}/`:

```
docs/bmad/{slug}/
├── 01-analysis.md           # Analyst output
├── 01b-prd.md               # PM output
├── 01c-ux-flows.md          # UX output
├── 02-technical-spec.md     # Architect output
├── 02b-user-stories.md      # SM output
├── 03-implementation.md     # Dev output
├── 04-qa-report.md          # QA output
├── data-01-tracking-plan.md # Data output
├── sec-01-threat-model.md   # Security output
├── growth-01-*.md           # Growth output
├── ops-01-*.md              # Ops output
├── polish-01-*.md           # Polish output
└── ai-01-*.md               # AI-Eco output
```

---

## 🎮 Quick Start

### 1. Start the Orchestrator
```
*start
```

### 2. Validate Your Context
Provide the required "Context Fuel":
- **Current behavior:** What's happening now?
- **Expected behavior:** What should happen?
- **Evidence:** Console errors, screenshots, repro steps
- **Environment:** Stack, relevant files

### 3. Let Beast Mode Route You
```
*workflow-init context: "Your request here"
```

### 4. Follow the Workflow
Beast Mode will guide you through each phase, creating artifacts and checking gates.

---

## 🔧 Customization

### Adding Custom Agents
1. Create a new `.md` file in `agents/{squad}/`
2. Follow the agent template format
3. Add to `config/squads.yaml`
4. Add commands to `config/commands.yaml`

### Modifying Workflows
1. Edit files in `workflows/`
2. Add/remove phases
3. Adjust gate conditions
4. Update optional squad triggers

---

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Follow BMAD conventions
4. Submit a PR with artifact documentation

---

**Built with 🔥 by Samuel Saha**

*Compatible with BMAD-METHOD™ v6*
