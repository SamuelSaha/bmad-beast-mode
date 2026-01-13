---
description: "Autonomous Feature Discovery & Implementation (The 'Skunkworks' Protocol)"
---

# 🛸 DISCOVERY & BUILD PROTOCOL ("AUTOPILOT")

> **TRIGGER:** `/discovery`
> **GOAL:** Autonomously identify a high-value opportunity, spec it, and build the MVP.
> **SQUAD:** Director, Brainstormer, Data Analyst, Value, Pricing, AI-Eval, PM, Architect, Dev, QA
> **MODE:** HIGH AUTONOMY (Approvals only at Gate 3)

---

## 💡 STEP 1: THE OPPORTUNITY SCAN (SPARK, ATLAS & EVAL)
**Agents:** `@beast-brainstormer`, `@beast-analyst`, `@beast-eval`
1. **Analyst:** Scan metrics for "Dead Zones" (Drop-off > 20%).
2. **Eval:** Scan codebase for "AI Optimizations" (Could a feature be 10x with LLMs?).
3. **Brainstormer:** Run `*crazy-eights` on the findings.
4. **Constraint:** "Must be 10x better, not 10% better."

## 💎 STEP 2: REVENUE & VALUE VALIDATION (VALUE & PRICING)
**Agents:** `@beast-value`, `@beast-pricing`
1. **Value:** Run "The Mom Test" simulation. Does this solve a burning pain?
2. **Pricing:** Run "Willingness to Pay" model. Can we monetize this?
3. **Verdict:** If it doesn't make money or save massive time -> **KILL IT**.

## 🧠 STEP 3: THE STRATEGY GATE (USER APPROVAL)
**Agent:** `@beast-pm`
1. **Pitch:** "We found an opportunity worth $X/mo. Cost to build: Y hours."
2. **Wait:** STOP and await `[GO / NO-GO]` confirmation.
3. **Action:** If GO, proceed to build.

## 🏛️ STEP 4: AUTONOMOUS SPEC (ARCH & UX)
**Agents:** `@beast-architect`, `@beast-ux`
1. **Architect:** Draft `spec.md` with "Scale-First" principles.
2. **UX:** Create `wireframe.md` with "Mobile Dictatorship" rules.
3. **Sanity Check:** Do we have the data to build this?

## 🔨 STEP 5: THE PHANTOM BUILD (FORGE)
**Agent:** `@beast-dev`
1. **Branch:** Create `feature/discovery-[name]`.
2. **Build:** Implement MVP (No fluff. Core value only).
3. **Test:** Write 1 E2E test to prove it works.

## 🧪 STEP 6: VERIFICATION & DEMO (HUNTER)
**Agent:** `@beast-qa`
1. **Verify:** Does it solve the original pain point?
2. **Demo:** Output a "Usage Guide" for the user to try it.
3. **Status:** "READY FOR REVIEW."
