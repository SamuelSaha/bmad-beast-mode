---
description: "Large-Scale Feature Implementation (The 'Enterprise' Protocol)"
---

# 🏢 EPIC FEATURE PROTOCOL

> **TRIGGER:** `/epic-feature`
> **GOAL:** Ship a complex, multi-sprint feature (Auth, Dashboard, Payments, etc.)
> **SQUAD:** Full Beast Squad (10+ agents)
> **MODE:** Multi-Phase with Hard Gates
> **DURATION:** Days, not hours

---

## 🚨 EPIC CLASSIFICATION

| Complexity | Indicators | Duration |
|------------|-----------|----------|
| 🔵 Medium | 2-3 domains, known patterns | 2-3 days |
| 🟠 Large | 4+ domains, new integrations | 1 week |
| 🔴 Critical | Security, payments, data migration | 2+ weeks |

---

## 📋 PHASE 0: EPIC BRIEF (30 min)
**Agent:** `@beast-pm` + `@beast-analyst`

**Commercial Check (MANDATORY):**
1. What's the ROI? (Revenue, Retention, Time Saved)
2. What's the cost? (Dev hours, Infra, Maintenance)
3. Is this worth building? (Pareto: 80% value from 20% scope?)

**Strategy Gate:**
- Run "The MVP Razor"
- Validate with data (not gut feel)
- Define "Done" in measurable terms

**GATE:** PM outputs `[GO / NO-GO / DEFER]`

**Output:** Epic Brief (1 page max)
- Problem Statement
- Success Metrics (North Star + KPIs)
- P0 Scope (what's essential)
- Explicit Non-Scope (what we're NOT building)

---

## 🏛️ PHASE 1: ARCHITECTURE (2-4 hours)
**Agent:** `@beast-architect` + `@beast-sec`

**Technical Design:**
1. **RFC Draft:** Technical spec with constraints
2. **Threat Model:** STRIDE analysis on new surfaces
3. **Schema Design:** SQL constraints, RLS policies
4. **API Contract:** OpenAPI spec (if applicable)

**Security Gate (MANDATORY):**
- Iron Dome Protocol check
- Zod schemas defined for all inputs
- RLS policies for all new tables
- No security design = NO CODE

// turbo
```bash
# Check for existing patterns
find src -name "*.ts" | head -20
```

**Output:** `RFC-001-[Feature].md`

---

## 🎨 PHASE 2: DESIGN SYSTEM (2-4 hours)
**Agent:** `@beast-ux` + `@beast-a11y` + `@beast-copy`

**Atomic Law Enforcement:**
1. **Flows:** Map ALL states (Happy, Sad, Loading, Empty, Error)
2. **Mobile First:** Design for 320px, scale up
3. **Accessibility:** WCAG 2.1 AA minimum
4. **Copy:** Apply Hemingway Protocol (simple, clear)

**Design Tokens Only:**
- NO raw hex codes
- Tailwind variables only
- 8px spacing grid

**Output:** High-fidelity spec with:
- ASCII wireframes
- Component specifications
- Interaction states
- A11y annotations

---

## 🏗️ PHASE 3: SCAFFOLDING (1-2 hours)
**Agent:** `@beast-dev`

**Foundation Work:**
1. Create routes, types, and empty components
2. Set up mock data (MSW handlers if API-first)
3. Verify navigation works with placeholders

// turbo
```bash
npm run dev
```

**Checkpoint:** Can we navigate the UI with fake data?

---

## 🔨 PHASE 4: CORE IMPLEMENTATION (Variable)
**Agent:** `@beast-dev` + `@beast-perf`

**Iterative Loop:**
```
REPEAT for each component:
  1. Backend: Service Layer + Unit Tests
  2. Frontend: UI + Integration Tests
  3. Perf Check: Bundle size + Latency
  4. Commit with conventional message
```

**Performance Constraints:**
- Main thread blocking: <50ms
- API latency: <200ms
- Bundle contribution: <50kb per feature

// turbo
```bash
npm run test && npm run build
```

**Continuous Integration:**
- Every commit triggers CI
- No merge if tests fail
- Lint must pass

---

## 🧪 PHASE 5: DESTRUCTIVE QA (4-8 hours)
**Agent:** `@beast-qa` + `@beast-sre`

**Chaos Engineering:**
1. Simulate network failures (offline, slow 3G)
2. Inject 500 errors from APIs
3. Test on 320px mobile viewport
4. Stress test endpoints (k6 or artillery)

**Edge Case Gauntlet:**
- Empty states
- Max length inputs (10,000 chars)
- Unicode, emoji, special characters
- Rapid repeated actions

// turbo
```bash
npm run test:e2e
```

**GATE:** QA outputs `[PASS / WARN / FAIL]`

---

## 🎯 PHASE 5.5: ZERO-DEFECT VERIFICATION (MANDATORY)
**Agent:** `@beast-dev`

**All code must be verified before proceeding.**

// turbo
```bash
npm run build && npm run lint && npm run test
```

**Output required:**
```markdown
## ✅ VERIFICATION REPORT
**Build:** ✅ Passed
**Lint:** ✅ Passed
**Tests:** ✅ All pass (unit + integration)
**E2E:** ✅ All pass
**Performance:** ✅ Within thresholds
```

**GATE:** ALL checks must pass. No exceptions.

---

## 📚 PHASE 6: DOCUMENTATION (2 hours)
**Agent:** `@beast-docs` + `@beast-support`

1. **User Guide:** How to use the feature
2. **API Reference:** If endpoints exposed
3. **FAQs:** Pre-written support responses
4. **Known Issues:** Document edge cases

**Output:** `docs/[feature]/README.md`

---

## 🚀 PHASE 7: FEATURE FLAG ROLLOUT
**Agent:** `@beast-sre` + `@beast-devops`

**Canary Deployment:**
1. Wrap in feature flag (LaunchDarkly/env var)
2. Deploy to 5% of traffic
3. Monitor error rates, latency
4. Expand: 5% → 25% → 50% → 100%

// turbo
```bash
git log -5 --oneline
```

**Rollback Plan:** One command to disable

---

## 📊 EXIT CRITERIA

| Check | Required |
|-------|----------|
| All P0 requirements implemented | ✅ |
| Security review passed | ✅ |
| QA sign-off | ✅ |
| Performance within budget | ✅ |
| Documentation complete | ✅ |
| Feature flag working | ✅ |
| Rollback tested | ✅ |

---

## ⏱️ PHASE DURATION GUIDE

| Phase | Minimum | Typical |
|-------|---------|---------|
| 0. Brief | 30 min | 1 hour |
| 1. Architecture | 2 hours | 4 hours |
| 2. Design | 2 hours | 4 hours |
| 3. Scaffold | 1 hour | 2 hours |
| 4. Implementation | 4 hours | 2-3 days |
| 5. QA | 4 hours | 1 day |
| 6. Docs | 1 hour | 2 hours |
| 7. Rollout | 1 hour | 1 day |

---

## 🚨 ABORT CONDITIONS

STOP the epic if:
- P0 scope keeps growing (scope creep)
- Security review finds critical issues
- Dependencies are blocked
- ROI no longer makes sense

**Recovery:** Checkpoint progress, defer to next sprint
