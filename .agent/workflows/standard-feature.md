---
description: "High-Velocity Feature Implementation (The 'Sprint Killer')"
---

# ⚡ STANDARD FEATURE PROTOCOL

> **TRIGGER:** `/feature`
> **GOAL:** Ship a routine feature with zero regression.
> **SQUAD:** Director, PM, UX, Architect, Dev, QA

---

## 🧭 STEP 1: SCOPE LOCK
**Agent:** `@beast-pm`
1. **Validation:** Run "The MVP Razor." Is this essential?
2. **Definition:** Define *User Story* and *Acceptance Criteria*.
3. **Verdict:** [GO / NO-GO]

## 🎨 STEP 2: PIXEL PERFECT
**Agent:** `@beast-ux`
1. **Spec:** Define Tailwind classes and Mobile Breakpoints.
2. **Access:** Verify WCAG Contrast.
3. **Artifact:** `ux-spec.md` with ASCII Wireframe.

## 🏗️ STEP 3: BLUEPRINT
**Agent:** `@beast-architect`
1. **Review:** Check for patterns and reusable components.
2. **Strategy:** Define data flow and state management.
3. **Constraint:** "No new dependencies unless approved."

## 🔨 STEP 4: SURGICAL BUILD
**Agent:** `@beast-dev`
1. **Test:** Write failing test first (TDD).
2. **Code:** Implement feature using "Surgical Diff."
3. **Verify:** Run verifying script.

## 🧪 STEP 5: DESTRUCTIVE QA
**Agent:** `@beast-qa`
1. **Attack:** Try to break inputs (null, undefined, massive strings).
2. **Verify:** Check mobile responsiveness.
3. **Verdict:** [PASS / FAIL]

## 🏁 STEP 6: SHIP
**Agent:** `@beast-devops`
1. **Merge:** Squash and merge.
2. **Cleanup:** Delete feature branch.
