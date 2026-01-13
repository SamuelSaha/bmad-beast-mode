---
description: "Autonomous Feature Discovery & Implementation (The 'Skunkworks' Protocol)"
---

# 🛸 DISCOVERY & BUILD PROTOCOL ("AUTOPILOT")

> **TRIGGER:** `/discovery`
> **GOAL:** Autonomously identify a high-value opportunity, spec it, and build the MVP.
> **SQUAD:** Director, Brainstormer, Data Analyst, Value, PM, Architect, Dev, QA
> **MODE:** HIGH AUTONOMY (Approvals only at Gate 3)

---

## 💡 STEP 1: THE OPPORTUNITY SCAN (SPARK & ATLAS)
**Agents:** `@beast-brainstormer`, `@beast-analyst`
1. **Analyst:** Scan the codebase/metrics for "Dead Zones" (unused features, drop-off points).
2. **Brainstormer:** Run `*scamper` on these zones to generate 3 divergent ideas.
3. **Analyst:** Check feasibility of each.
4. **Output:** "Top 3 Opportunities" List.

## 💎 STEP 2: VALUE VALIDATION (VALUE & PM)
**Agents:** `@beast-value`, `@beast-pm`
1. **Value:** Run "The Mom Test" simulation. Which idea solves a real pain?
2. **PM:** Run `*prioritize` (RICE Score).
3. **Selection:** Pick the WINNER.
4. **Artifact:** `discovery-brief.md`

## 🧠 STEP 3: THE STRATEGY GATE (USER APPROVAL)
**Agent:** `@beast-pm`
1. **Presentation:** Present the "Winner" to the User.
2. **Wait:** STOP and await `[GO / NO-GO]` confirmation.
3. **Action:** If GO, proceed to build.

## 🏛️ STEP 4: AUTONOMOUS SPEC (ARCH & UX)
**Agents:** `@beast-architect`, `@beast-ux`
1. **Architect:** Draft `spec.md` (Database & API).
2. **UX:** Create `wireframe.md` (ASCII Flow).
3. **Sync:** Ensure backend supports frontend.

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
