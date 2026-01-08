# Beast Mode: Quick Reference Card v2.1

## 🚀 Getting Started
```
*start                    # Initialize Beast Mode
*workflow-init context:   # Route to appropriate workflow
*help                     # Show all commands
```

## ⚡ Workflow Selection

| Workflow | Use For | Time | Command |
|----------|---------|------|---------|
| Quick Fix | Bug fixes, small changes | < 2h | `*start` |
| Standard | Features, refactors | 1d-1w | `*start` |
| Enterprise | Critical, compliance | 1-4w | `*start` |
| AI Feature | LLM/ML integration | 1-2w | `*start` |
| **Brainstorm** | Ideation, design thinking | 30-60m | `*brainstorm` |
| **Brownfield** | Map existing code | 1-2h | `*scan-legacy` |

## 🏭 Enterprise Commands (v2.1)
```
*brainstorm topic: "{IDEA}"           # Creative Intelligence workflow
*scan-legacy                           # Brownfield discovery
*party topic: "{DECISION}"             # Multi-agent escalation
*automate-test source: "{spec}"        # Generate Playwright tests
*framework stack: "playwright"          # Scaffold test framework
*trace source: "{prd}"                  # Traceability matrix
```

## 🔵 Core Commands
```
*analyze-problem context: "{issue}"
*create-prd source: "docs/bmad/{slug}/01-analysis.md"
*define-ux source: "docs/bmad/{slug}/01b-prd.md"
*define-contract source: "docs/bmad/{slug}/01b-prd.md"
*create-stories source: "docs/bmad/{slug}/02-technical-spec.md"
*implement-fix spec: "docs/bmad/{slug}/02-technical-spec.md"
*review-feature spec: "docs/bmad/{slug}/02-technical-spec.md"
*define-metrics source: "docs/bmad/{slug}/01b-prd.md"
```

## 🔴 Security Commands
```
*threat-model source: "docs/bmad/{slug}/02-technical-spec.md"
*privacy-check source: "docs/bmad/{slug}/01b-prd.md"
*abuse-test source: "docs/bmad/{slug}/03-implementation.md"
*scan-code source: "src/"
```

## 🟢 Growth Commands
```
*sanity-check source: "docs/bmad/{slug}/01-analysis.md"
*audit-pricing source: "docs/bmad/{slug}/01b-prd.md"
*plan-experiment source: "docs/bmad/{slug}/01b-prd.md"
*churn-risk source: "docs/bmad/{slug}/01-analysis.md"
*support-audit source: "docs/bmad/{slug}/02-technical-spec.md"
*audit-entitlements source: "docs/bmad/{slug}/02-technical-spec.md"
```

## 🟣 Ops Commands
```
*deployment-plan source: "docs/bmad/{slug}/02-technical-spec.md"
*infra-check source: "docs/bmad/{slug}/02-technical-spec.md"
*schema-design source: "docs/bmad/{slug}/02-technical-spec.md"
*query-audit source: "docs/bmad/{slug}/03-implementation.md"
*define-slo source: "docs/bmad/{slug}/02-technical-spec.md"
*incident-prep source: "docs/bmad/{slug}/02-technical-spec.md"
*perf-audit source: "docs/bmad/{slug}/03-implementation.md"
*load-plan source: "docs/bmad/{slug}/02-technical-spec.md"
```

## 🟡 Polish Commands
```
*review-code source: "docs/bmad/{slug}/03-implementation.md"
*write-docs source: "docs/bmad/{slug}/03-implementation.md"
*api-docs source: "docs/bmad/{slug}/02-technical-spec.md"
*a11y-audit source: "docs/bmad/{slug}/01c-ux-flows.md"
*i18n-audit source: "docs/bmad/{slug}/03-implementation.md"
*plan-refactor source: "docs/bmad/{slug}/03-implementation.md"
*dead-code-scan source: "src/"
```

## 🤖 AI-Eco Commands
```
*design-prompt source: "docs/bmad/{slug}/01b-prd.md"
*prompt-eval source: "docs/bmad/{slug}/ai-01-prompt-spec.md"
*safety-audit source: "docs/bmad/{slug}/ai-01-prompt-spec.md"
*bias-check source: "docs/bmad/{slug}/ai-01-prompt-spec.md"
*cost-analysis source: "docs/bmad/{slug}/ai-01-prompt-spec.md"
*optimize-tokens source: "docs/bmad/{slug}/ai-01-prompt-spec.md"
*design-integration source: "docs/bmad/{slug}/02-technical-spec.md"
*eval-pipeline source: "docs/bmad/{slug}/ai-01-prompt-spec.md"
```

## 🎉 Party Mode (Multi-Agent Escalation)
When stuck, invoke party mode:
```
*party topic: "Architecture decision"
*party topic: "Security vs UX tradeoff"
```

Available parties:
- **Technical**: Architect + Dev + QA
- **Product**: PM + UX + Data
- **Security**: SecOps + DPO + Pentester
- **Ops**: DevOps + SRE + DBA
- **AI**: PromptEng + AISafety + AICost

## 📋 Context Fuel Template
```
Current behavior: [What happens now]
Expected behavior: [What should happen]
Evidence: [Console errors, screenshots, repro steps]
Environment: [Stack, libs, relevant files]
```

## ✅ Gate Check
```
*gate-check phase: "{phase}"
*status
```

## 📊 LLM Quick Load
For any LLM, paste the contents of:
```
llms-full.txt
```

## 🚫 Hard Constraints (Default)
- ⛔ ZERO new package.json dependencies
- ⛔ NO changes outside spec-listed files
- ⛔ NO breaking API changes
- ⛔ NO implementation without artifact chain

## 📁 Artifact Locations
| Phase | File |
|-------|------|
| Product Brief | `docs/bmad/{slug}/00-product-brief.md` |
| Analysis | `docs/bmad/{slug}/01-analysis.md` |
| PRD | `docs/bmad/{slug}/01b-prd.md` |
| UX Flows | `docs/bmad/{slug}/01c-ux-flows.md` |
| Tech Spec | `docs/bmad/{slug}/02-technical-spec.md` |
| Stories | `docs/bmad/{slug}/02b-user-stories.md` |
| Implementation | `docs/bmad/{slug}/03-implementation.md` |
| QA Report | `docs/bmad/{slug}/04-qa-report.md` |
| Test Automation | `tests/e2e/{slug}.spec.ts` |
