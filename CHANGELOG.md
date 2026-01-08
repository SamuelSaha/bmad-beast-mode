# Changelog

All notable changes to Beast Mode Squad Roster will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-01-08

### 🔥 MAJOR: 10x Agent Capabilities Upgrade

Every agent has been significantly enhanced with:
- **More Commands**: 3-8 commands per agent (up from 1-2)
- **Detailed Checklists**: Step-by-step verification for every task
- **Anti-Patterns**: What NOT to do (common mistakes)
- **Output Gates**: Required/blocking criteria for each phase
- **Escalation Triggers**: When to bring in other squads
- **Templates**: Ready-to-use output formats

### Enhanced Core Squad
- **Analyst**: Added `quick-diag`, `assess-scope`, `extract-context`, `validate-fix`
- **Architect**: Added `enforce-patterns`, `audit-deps`, `design-api`, `design-migration`, `create-adr`
- **Developer**: Added `implement-step`, `generate-component`, `generate-hook`, `generate-api`, `debug-issue`, `safe-refactor`, `prep-review`
- **QA**: Added `create-test-plan`, `explore`, `test-a11y`, `test-security`, `test-performance`, `test-browsers`, `report-bug`, `regression-check`
- **PM**: Added `prioritize`, `write-story`, `define-metrics`, `scope-check`, `decide-tradeoff`, `analyze-competitor`, `validate-feature`, `draft-release-notes`
- **Scrum Master**: Added `split-story`, `write-ac`, `map-dependencies`, `estimate`, `plan-sprint`, `refine-backlog`, `track-blockers`, `run-retro`
- **UX Designer**: Added `map-flow`, `define-states`, `spec-component`, `spec-interaction`, `write-copy`, `spec-responsive`, `spec-animation`, `review-design`
- **Data Analyst**: Added `define-kpis`, `design-event`, `create-tracking-plan`, `define-funnel`, `design-experiment`, `audit-data-quality`, `privacy-check`, `spec-dashboard`

### Enhanced Security Squad
- **SecOps**: Added STRIDE framework, `define-security-reqs`, `spec-validation`, `review-auth`, `review-api-security`, `audit-secrets`, `check-compliance`, `audit-headers`
- **DPO**: Added `inventory-data`, `check-legal-basis`, `audit-consent`, `define-retention`, `implement-user-rights`, `audit-third-parties`, `audit-cookies`, `run-dpia`
- **Pentester**: Added `design-abuse-cases`, `test-injection`, `attack-auth`, `attack-authz`, `attack-business-logic`, `attack-api`, `rate-finding`, `report-finding`, `quick-check`
- **AppSecBot**: Added `scan-deps`, `run-sast`, `scan-secrets`, `check-licenses`, `scan-container`, `run-dast`, `setup-pipeline`, `triage-findings`, `security-metrics`

### Enhanced Ops Squad
- **DevOps**: Added `choose-strategy`, `configure-flags`, `infra-check`, `design-pipeline`, `plan-rollback`, `check-parity`, `plan-dr`
- **DBA**: Added `design-table`, `design-migration`, `design-indexes`, `query-audit`, `plan-data-migration`, `baseline-performance`
- **SRE**: Added `define-slis`, `set-slos`, `design-alerts`, `design-dashboard`, `incident-prep`, `define-oncall`, `capacity-plan`
- **Performance Engineer**: Added `profile-frontend`, `profile-backend`, `analyze-queries`, `load-plan`, `optimize`, `optimize-bundle`

### Enhanced Polish Squad
- **Code Reviewer**: Added `categorize-issue`, `checklist-review`, `write-feedback`, `security-review`, `performance-review`, `approve`, `self-review`

### Enhanced AI-Eco Squad
- **Prompt Engineer**: Added `design-system-prompt`, `create-examples`, `define-output-schema`, `design-guardrails`, `prompt-eval`, `test-adversarial`, `optimize-tokens`, `version-prompt`
- **AI Safety**: Added `bias-check`, `prevent-hallucination`, `ensure-transparency`, `design-content-filter`, `design-oversight`, `plan-ai-incident`, `design-ai-audit`
- **AI Cost**: Added `analyze-tokens`, `project-volume`, `compare-models`, `optimize-tokens`, `design-cache`, `design-limits`, `monitor-costs`
- **AI Architect**: Added `design-client`, `design-retry`, `design-streaming`, `design-fallbacks`, `design-observability`, `eval-pipeline`, `secure-ai-integration`

### Breaking Changes
- Agent file formats significantly expanded
- Some command names changed for consistency

---

## [1.0.0] - 2026-01-08

### Added

#### Squads (31 Agents)
- **Core Squad** (8 agents): Analyst, PM, UX Designer, Architect, Scrum Master, Developer, QA, Data Analyst
- **Security Squad** (4 agents): SecOps, DPO, Pentester, AppSec Automation
- **Growth Squad** (6 agents): User Value Advocate, Pricing Strategist, Experimentation Lead, Retention Analyst, Support Liaison, Entitlements Auditor
- **Ops Squad** (4 agents): DevOps Engineer, Database Architect, SRE, Performance Engineer
- **Polish Squad** (5 agents): Code Reviewer, Tech Writer, Accessibility Auditor, i18n Specialist, Refactor Specialist
- **AI-Eco Squad** (4 agents): Prompt Engineer, AI Safety Auditor, AI Cost Optimizer, AI Integration Architect

#### Orchestrator
- Central Orchestrator agent for workflow routing
- Context validation (Context Fuel enforcement)
- Squad activation triggers
- Gate checking for phase transitions

#### Workflows (4)
- **Quick Fix Flow**: Bug fixes and small changes (< 2 hours)
- **Standard Feature Flow**: Features and medium changes (1 day - 1 week)
- **Enterprise Feature Flow**: Critical, compliance-required changes (1-4 weeks)
- **AI Feature Flow**: LLM/ML integrations (1-2 weeks)

#### Templates (5)
- Analysis Report Template
- PRD Template
- Technical Specification Template
- QA Report Template
- AI Prompt Specification Template

#### Configuration
- Squad configuration with activation triggers
- Complete command registry (45+ commands)

---

## [Unreleased]

### Planned
- Web bundle for ChatGPT/Claude Projects
- Additional templates (UX Flows, Security Reports)
- Integration tests for workflows
- Squad-specific checklists
- IDE plugin support
