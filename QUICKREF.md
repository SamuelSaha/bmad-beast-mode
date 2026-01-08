# Beast Mode: Quick Reference Card

## 🚀 Getting Started
```
*start                    # Initialize Beast Mode
*workflow-init context:   # Route to appropriate workflow
*help                     # Show all commands
```

## ⚡ Workflow Selection

| Workflow | Use For | Time |
|----------|---------|------|
| Quick Fix | Bug fixes, small changes | < 2h |
| Standard | Features, refactors | 1d-1w |
| Enterprise | Critical, compliance | 1-4w |
| AI Feature | LLM/ML integration | 1-2w |

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

## 🚫 Hard Constraints (Default)
- ⛔ ZERO new package.json dependencies
- ⛔ NO changes outside spec-listed files
- ⛔ NO breaking API changes
- ⛔ NO implementation without artifact chain
