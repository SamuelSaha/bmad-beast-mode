---
description: "High-Velocity Feature Implementation (The 'Sprint Killer')"
---

# ⚡ STANDARD FEATURE PROTOCOL

> **TRIGGER:** `/standard-feature`
> **GOAL:** Ship a routine feature with zero regression in <1 day.
> **SQUAD:** Director → PM → UX → Architect → Dev → QA → DevOps
> **MODE:** Sequential with Gates

---

## 🚨 PRE-FLIGHT CHECKS

Before starting, verify:
- [ ] Feature request is clear and specific
- [ ] No active incidents on the codebase
- [ ] You have `LEARNINGS.md` loaded (anti-patterns)

---

## 🧭 STEP 1: SCOPE LOCK (5 min)
**Agent:** `@beast-pm`

1. Run "The MVP Razor": *"If we delete this, does the product still work?"*
2. Define User Story: `As a [user], I want [action], so that [outcome]`
3. Write 3-5 Acceptance Criteria (testable)

**GATE:** PM outputs `[GO / NO-GO]`
- If `NO-GO` → STOP. Clarify with user.
- If `[GO]` → Proceed.

**Output:** `## Scope Lock: [Feature Name]` with User Story + AC

---

## 🎨 STEP 2: PIXEL PERFECT (10 min)
**Agent:** `@beast-ux`

1. Define Tailwind classes (NO raw hex codes)
2. Specify Mobile Breakpoints (320px first)
3. Verify WCAG Contrast (≥4.5:1)
4. Define all states: Default, Hover, Active, Disabled, Loading, Error

**GATE:** UX outputs `[SPEC COMPLETE]`

**Output:** ASCII Wireframe + Component Specs Table

// turbo
```bash
# Verify existing design system tokens
grep -r "bg-primary\|text-muted" src/
```

---

## 🏗️ STEP 3: BLUEPRINT (5 min)
**Agent:** `@beast-architect`

1. Check for existing patterns and reusable components
2. Define data flow and state management approach
3. Apply **Ockham Protocol**: "No new dependencies unless native is impossible"

**CONSTRAINT:** If solution requires >3 new files → REJECT and simplify.

**Output:** `## Technical Approach` (max 10 lines)

---

## 🔨 STEP 4: SURGICAL BUILD (30 min)
**Agent:** `@beast-dev`

**MANDATORY PRE-CHECKS:**
// turbo
```bash
# Read LEARNINGS.md for anti-patterns
cat _bmad/beast-mode/LEARNINGS.md | head -50
```

1. **READ FIRST:** View lines 1-30 of target files before editing
2. **TEST FIRST:** Write failing test (TDD)
3. **CODE:** Implement using "Surgical Diff" (only changed lines + 3 context)
4. **VERIFY:** Run build and lint

**HARD RULES:**
- `<input type="date">` for date pickers (NO react-day-picker)
- Imports at TOP of file only
- NO `any` types
- NO `console.log` in production

// turbo
```bash
npm run lint && npm run build
```

**Output:** Code changes + passing build verification

---

## 🧪 STEP 5: DESTRUCTIVE QA (15 min)
**Agent:** `@beast-qa`

**Murphy Protocol (Prove it breaks):**
1. **Edge Cases:** null, undefined, "", 10000 chars, emoji, special chars
2. **Stress:** Click button 10x rapidly
3. **Mobile:** Test on 320px width
4. **Security:** Try SQL injection, XSS in inputs

**Accessibility Check:**
- [ ] Touch targets ≥44px
- [ ] Keyboard navigable
- [ ] Screen reader labels

// turbo
```bash
npm run test
```

**GATE:** QA outputs `[PASS / WARN / FAIL]`
- If `FAIL` → Route back to `@beast-dev` with bug list
- If `PASS` → Proceed

---

## 🎯 STEP 6: ZERO-DEFECT VERIFICATION (MANDATORY)
**Agent:** `@beast-dev`

**This step is NON-NEGOTIABLE. No exceptions.**

// turbo
```bash
npm run build && npm run lint && npm run test
```

**If ANY command fails → FIX IT before proceeding.**

**Output required:**
```markdown
## ✅ VERIFICATION REPORT
**Build:** ✅ Passed
**Lint:** ✅ Passed
**Tests:** ✅ Passed
**Visual Check:** [What you verified in browser/app]

**How to Confirm:**
```bash
npm run dev
# Then go to [URL] and [action] to see [result]
```
```

**GATE:** ALL checks must pass before proceeding to Ship.

---

## 🏁 STEP 7: SHIP
**Agent:** `@beast-devops`

1. **Janitor Protocol:** Remove unused imports, console.logs, TODO comments
2. **Merge:** Squash and merge to main
3. **Monitor:** Watch error rate for 15 minutes post-deploy

// turbo
```bash
git status
```

**Output:** `🚀 SHIPPED: [Feature Name] - Version [X.X.X]`

---

## 📊 EXIT CRITERIA

| Check | Required |
|-------|----------|
| All Acceptance Criteria met | ✅ |
| Build passes | ✅ |
| Tests pass | ✅ |
| No lint errors | ✅ |
| Mobile responsive | ✅ |
| LEARNINGS.md rules respected | ✅ |

---

## ⏱️ TIME BUDGET

| Step | Target |
|------|--------|
| Scope Lock | 5 min |
| UX Spec | 10 min |
| Blueprint | 5 min |
| Build | 30 min |
| QA | 15 min |
| **Verification** | **5 min** |
| Ship | 5 min |
| **TOTAL** | **75 min** |
