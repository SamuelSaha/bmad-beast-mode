---
description: "Large-Scale Feature Implementation (The 'Enterprise' Protocol)"
---

# 🏢 EPIC FEATURE PROTOCOL

> **TRIGGER:** `/epic`
> **GOAL:** Ship a complex, multi-sprint feature (e.g., Auth System, Dashboard, Payment Integration).
> **SQUAD:** Director, PM, Architect, UX, Dev, QA, Sec, SRE, Tech Writer, Support
> **DURATION:** Multi-Step Execution

---

## 🧭 STEP 1: THE STRATEGY CHECK (PM & ANALYST)
**Agents:** `@beast-pm`, `@beast-analyst`
1. **Validation:** Run "The MVP Razor." Is this essential?
2. **Data Check:** Analyst verifies the "Why" with data.
3. **Verdict:** [GO / NO-GO]

## 🏛️ STEP 2: SYSTEM ARCHITECTURE (ARCHITECT & SEC)
**Agents:** `@beast-architect`, `@beast-sec`
1. **RFC:** Draft technical spec with "Threat Modeling" (STRIDE).
2. **Schema:** Define SQL constraints and RLS policies.
3. **API:** Define OpenAPI spec (Swagger).
4. **Sign-off:** Security must approve design before code.
5. **Artifact:** `RFC-001-[Feature].md`

## 🎨 STEP 3: DESIGN SYSTEM (UX, A11Y, COPY)
**Agents:** `@beast-ux`, `@beast-a11y`, `@beast-copy`
1. **Flows:** Map "Unhappy Paths" (Errors, Loading, Empty).
2. **Polish:** Review copy ("Hemingway Protocol") and A11y ("WCAG Wall").
3. **Artifact:** High-fidelity spec with Accessibility annotations.

## 🏗️ STEP 4: SCAFFOLDING & MOCKS (DEV)
**Agent:** `@beast-dev`
1. **Skeleton:** Create routes, types, and empty components.
2. **Mock Server:** MSW (Mock Service Worker) handlers for API.
3. **Check:** Can we navigate the UI with fake data?

## 🔨 STEP 5: CORE IMPLEMENTATION (DEV & PERF)
**Agents:** `@beast-dev`, `@beast-perf`
*Iterative Loop:*
1. **Backend:** Implement Service Layer + Unit Tests.
2. **Frontend:** Implement UI + Integration Tests.
3. **Perf Check:** Verify bundle size impact & query latency.
4. **Constraint:** "No blocking main thread > 50ms."

## 🧪 STEP 6: DESTRUCTIVE QA (QA & SRE)
**Agents:** `@beast-qa`, `@beast-sre`
1. **Chaos:** Simulate network failure, 500 errors, slow APIs.
2. **Load:** Stress test endpoints (k6 or artillery).
3. **Mobile:** Verify on 320px width device.

## 📚 STEP 7: DOCUMENTATION & SUPPORT (WRITER & SUPPORT)
**Agents:** `@beast-tech-writer`, `@beast-support`
1. **Docs:** Write User Guide & API Reference.
2. **FAQs:** Pre-write "Canned Responses" for support team.
3. **Training:** Brief the support agent on "Known Issues."

## 🏁 STEP 8: FEATURE FLAG ROLLOUT (SRE)
**Agent:** `@beast-sre`
1. **Flag:** Wrap feature in LaunchDarkly/Env Var.
2. **Canary:** Deploy to 5% of traffic.
3. **Monitor:** Watch logs for "Burn Rate" spike.
4. **Expand:** 5% -> 50% -> 100%.
