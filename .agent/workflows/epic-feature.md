---
description: "Large-Scale Feature Implementation (The 'Enterprise' Protocol)"
---

# 🏢 EPIC FEATURE PROTOCOL

> **TRIGGER:** `/epic`
> **GOAL:** Ship a complex, multi-sprint feature (e.g., Auth System, Dashboard, Payment Integration).
> **SQUAD:** Director, PM, Architect, UX, Dev, QA, Sec, SRE
> **DURATION:** Multi-Step Execution

---

## 🧭 STEP 1: THE STRATEGY CHECK (VANTAGE)
**Agent:** `@beast-pm`
1. **PRD Creation:** Run `*create-prd`.
2. **Scope Lock:** Define P0 MVP vs P1/P2.
3. **Risks:** Identify "Unknown Unknowns."
4. **Verdict:** [GO / NO-GO]

## 🏛️ STEP 2: SYSTEM ARCHITECTURE (MATRIX)
**Agent:** `@beast-architect`
1. **RFC Draft:** Write "Request for Comments" technical spec.
2. **Data Model:** Define Schema changes (SQL).
3. **API Design:** Define REST/GraphQL contract.
4. **Security Review:** Verify with `@beast-sec` (Auth/RBAC).
5. **Artifact:** `architecture-decision-record.md`

## 🎨 STEP 3: DESIGN SYSTEM (MUSE)
**Agent:** `@beast-ux`
1. **User Flows:** Map happy/unhappy paths.
2. **Mockups:** High-fidelity specs with Tailwind.
3. **States:** Design Loading, Error, and Empty states.
4. **Access:** WCAG check with `@beast-a11y`.

## 🏗️ STEP 4: SCAFFOLDING (FORGE)
**Agent:** `@beast-dev`
1. **Setup:** Create routes, types, and DB migrations.
2. **Mock APIs:** Build endpoints returning static data.
3. **Connect:** Wire up Frontend to Mock Backend.

## 🔨 STEP 5: CORE IMPLEMENTATION (FORGE)
**Agent:** `@beast-dev`
*Iterative Loop:*
1. **Business Logic:** Implement Service Layer.
2. **UI Implementation:** Build Components.
3. **Integration:** Connect UI to real API.
4. **Unit Tests:** >80% coverage on util functions.

## 🛡️ STEP 6: SECURITY & PERFORMANCE (AEGIS & NITRO)
**Agents:** `@beast-sec`, `@beast-perf`
1. **Penetration:** Try to bypass Auth/RLS.
2. **Load Test:** Verify DB query performance (N+1 check).
3. **Bundle Audit:** Ensure no massive dependencies added.

## 🧪 STEP 7: END-TO-END QA (HUNTER)
**Agent:** `@beast-qa`
1. **Integration Test:** Cypress/Playwright flows.
2. **Edge Cases:** Network failure, weird inputs.
3. **Mobile Audit:** Verify responsiveness.

## 🏁 STEP 8: FEATURE FLAG ROLLOUT (TITAN)
**Agent:** `@beast-sre`
1. **Flag:** Wrap feature in LaunchDarkly/Env Var.
2. **Deploy:** Ship to Prod (Hidden).
3. **Verify:** Smoke test in Prod.
4. **Enable:** Gradual rollout (10% -> 100%).
