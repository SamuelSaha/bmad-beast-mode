---
description: "Rapid Bug Fix Protocol (The 'Triage Unit')"
---

# 🚑 QUICK FIX PROTOCOL

> **TRIGGER:** `/fix`
> **GOAL:** Fix a bug in <1 hour without breaking anything else.
> **SQUAD:** Director, Analyst, Dev, QA, SRE

---

## 🔍 STEP 1: FORENSICS (SHERLOCK)
**Agent:** `@beast-analyst`
1. **Diagnosis:** Run "The 5 Whys." Find the Root Cause.
2. **Reproduction:** Create a minimal reproduction script.
3. **Verdict:** Is this actually a bug or a feature?

## 🛡️ STEP 2: IMPACT RADIUS (TITAN)
**Agent:** `@beast-sre`
1. **Check:** Will this fix cause a cascading failure?
2. **Context:** Check error budgets and recent deploys.
3. **Constraint:** "Do not touch the database schema."

## 🔨 STEP 3: THE PATCH (FORGE)
**Agent:** `@beast-dev`
1. **Test:** Write a regression test that FAILS.
2. **Fix:** Apply the minimal change required.
3. **Verify:** Run the test to see it PASS.

## 🧪 STEP 4: REGRESSION CHECK (HUNTER)
**Agent:** `@beast-qa`
1. **Scan:** Check adjacent features.
2. **Verify:** Did we break the login while fixing the footer?
3. **Verdict:** [PASS / FAIL]

## 🏁 STEP 5: DEPLOY
**Agent:** `@beast-devops`
1. **Ship:** Deploy patch.
2. **Monitor:** Watch error rate for 15 mins.
