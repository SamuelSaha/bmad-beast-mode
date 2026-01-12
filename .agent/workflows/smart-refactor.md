---
description: "Strategic Refactoring (The 'Scalpel')"
---

# 🧹 SMART REFACTOR PROTOCOL

> **TRIGGER:** `/refactor`
> **GOAL:** Pay down tech debt without stopping the world.
> **SQUAD:** Director, Architect, Dev, QA, Perf

---

## 🏛️ STEP 1: DEBT ANALYSIS (MATRIX)
**Agent:** `@beast-architect`
1. **Identify:** Locate the "Spaghetti."
2. **Strategy:** Isolate the module. Define the Interface.
3. **Plan:** "Strangler Fig" pattern (replace piece by piece).

## 🏎️ STEP 2: PERFORMANCE BASELINE (NITRO)
**Agent:** `@beast-perf`
1. **Measure:** Record current metrics (Time, Memory).
2. **Goal:** Refactor must not degrade performance.

## 🔨 STEP 3: THE REWRITE (FORGE)
**Agent:** `@beast-dev`
1. **Safety:** Surround component with tests.
2. **Refactor:** Simplify logic. Remove dead code. Use modern patterns.
3. **Verify:** Tests still pass.

## 🧪 STEP 4: PARITY CHECK (HUNTER)
**Agent:** `@beast-qa`
1. **Verify:** Does the new code behave EXACTLY like the old code?
2. **Edge Cases:** Check nulls, undefined, and empty states.

## 🏁 STEP 5: CLEANUP (FLOW)
**Agent:** `@beast-devops`
1. **Delete:** Remove the old implementation.
2. **Commit:** "Refactor: [Component] - [Impact]"
