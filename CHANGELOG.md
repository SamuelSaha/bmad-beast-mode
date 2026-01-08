# Changelog

All notable changes to Beast Mode Squad Roster will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

### Changed
- Updated module.yaml with complete structure

### Technical Details
- BMAD v6 compatible
- Artifact-driven workflow enforcement
- No-dependency constraint by default
- Brownfield-first approach

---

## [Unreleased]

### Planned
- Web bundle for ChatGPT/Claude Projects
- Additional templates (UX Flows, Security Reports)
- Integration tests for workflows
- Squad-specific checklists
