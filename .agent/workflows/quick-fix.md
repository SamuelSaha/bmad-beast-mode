---
description: "Rapid Bug Fix Protocol (The 'Triage Unit')"
---

# 🚑 QUICK FIX PROTOCOL

> **TRIGGER:** `/quick-fix`
> **GOAL:** Fix a bug in <30 minutes without breaking anything else.
> **SQUAD:** Director → Analyst → SRE → Dev → QA → DevOps
> **MODE:** Fast Track (minimal planning, maximum precision)

---

## 🚨 INCIDENT CLASSIFICATION

Before starting, classify:

| Severity | Symptoms | Response |
|----------|----------|----------|
| 🔴 CRITICAL | Production down, data loss | Skip planning, deploy ZERO + TITAN |
| 🟠 HIGH | Feature broken, users impacted | Fast track this protocol |
| 🟡 NORMAL | Bug, workaround exists | Standard protocol |
| 🟢 LOW | Cosmetic, minor annoyance | Backlog it |

---

## 🔍 STEP 1: FORENSICS (5 min)
**Agent:** `@beast-analyst`

**The Sherlock Protocol:**
1. **5 Whys** — Trace the chain of causality
   - Why did it break? →
   - Why [cause 1]? →
   - Why [cause 2]? →
   - Why [cause 3]? →
   - **ROOT CAUSE:** [answer]

2. **Evidence Demand:**
   - Request Logs, Network Tab, Reproduction Steps
   - If missing: "I have a hypothesis, but I need logs to confirm."

3. **Side Effect Scan:**
   - "If we change this, what else breaks?"

**GATE:** Analyst outputs `ROOT CAUSE: [specific statement]`
- If unclear → Request more evidence
- If clear → Proceed

// turbo
```bash
# Check recent changes that might have caused the bug
git log --oneline -10
```

---

## 🛡️ STEP 2: IMPACT RADIUS (3 min)
**Agent:** `@beast-sre`

1. **Blast Radius:** What else could this affect?
2. **Error Budgets:** Are we within SLO tolerance?
3. **Recent Deploys:** Did a recent change cause this?

**CONSTRAINT:** "Do NOT touch the database schema for a quick fix."

**Output:** `## Impact Assessment` (3 bullets max)

---

## 🔨 STEP 3: THE PATCH (15 min)
**Agent:** `@beast-dev`

**MANDATORY PRE-CHECKS:**
// turbo
```bash
# Load anti-patterns
cat _bmad/beast-mode/LEARNINGS.md | grep -A 5 "🔒 RULE"
```

**TDD Protocol:**
1. **Write regression test that FAILS** (proves bug exists)
2. **Apply MINIMAL change** (smallest possible fix)
3. **Run test to see it PASS**
4. **Run full test suite** (no regressions)

**HARD RULES:**
- READ lines 1-30 before editing any file
- Imports at TOP only
- NO `any` types
- If fixing dates: use `T00:00:00` suffix

// turbo
```bash
npm run test
```

**Output:** Diff + Test Results

---

## 🧪 STEP 4: REGRESSION CHECK (5 min)
**Agent:** `@beast-qa`

**Adjacent Feature Scan:**
1. Test the fixed feature works
2. Test 2-3 related features still work
3. Quick mobile check

**Critical Question:** "Did we break the login while fixing the footer?"

// turbo
```bash
npm run test:e2e -- --grep "critical-path"
```

**GATE:** QA outputs `[PASS / FAIL]`
- If `FAIL` → Back to Dev with specific failure
- If `PASS` → Proceed

---

## 🎯 STEP 5: ZERO-DEFECT VERIFICATION (MANDATORY)
**Agent:** `@beast-dev`

**No exceptions. The fix is not done until verified.**

// turbo
```bash
npm run build && npm run lint && npm run test
```

**Output required:**
```markdown
## ✅ VERIFICATION REPORT
**Build:** ✅ Passed
**Lint:** ✅ Passed  
**Tests:** ✅ Passed (regression test added)
**Bug Fixed:** [Verified: reproduction steps no longer trigger bug]
```

**GATE:** ALL checks must pass.

---

## 🏁 STEP 6: DEPLOY & MONITOR
**Agent:** `@beast-devops`

1. **Deploy:** Ship the patch
2. **Monitor:** Watch error rate for 15 minutes
3. **Rollback Ready:** Know the revert command

// turbo
```bash
git log -1 --oneline
```

**Output:** `🚑 FIXED: [Bug] - Deployed at [time]`

---

## 📊 EXIT CRITERIA

| Check | Required |
|-------|----------|
| Root cause identified | ✅ |
| Regression test added | ✅ |
| Fix is minimal | ✅ |
| No new regressions | ✅ |
| Error rate stable post-deploy | ✅ |

---

## ⏱️ TIME BUDGET

| Step | Target |
|------|--------|
| Forensics | 5 min |
| Impact | 3 min |
| Patch | 15 min |
| Regression | 5 min |
| Deploy | 2 min |
| **TOTAL** | **30 min** |

---

## 🔥 HOTFIX VARIANT

If `CRITICAL` severity:
1. Skip Steps 1-2 (go straight to patch)
2. Apply fix
3. Deploy immediately
4. Do forensics POST-DEPLOY
5. Add regression test after
