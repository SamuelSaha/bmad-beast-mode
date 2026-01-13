---
description: "Strategic Refactoring (The 'Scalpel')"
---

# 🧹 SMART REFACTOR PROTOCOL

> **TRIGGER:** `/smart-refactor`
> **GOAL:** Pay down tech debt without stopping the world or introducing regressions.
> **SQUAD:** Director → Analyst → Architect → Perf → Dev → QA → DevOps
> **MODE:** Strangler Fig (piece by piece replacement)

---

## 🚨 PRE-FLIGHT CHECKS

Before refactoring:
- [ ] Is this refactor necessary? (Answer: "What breaks if we don't?")
- [ ] Is there test coverage? (If <50%, write tests FIRST)
- [ ] Is there a deadline? (Never refactor before a launch)

---

## 🏛️ STEP 1: DEBT ANALYSIS (10 min)
**Agent:** `@beast-analyst` + `@beast-architect`

1. **Locate the Spaghetti:** What specifically is wrong?
2. **Measure the Pain:** How often does this cause bugs/slowdowns?
3. **Define the Interface:** What should it look like post-refactor?

**The Strangler Fig Strategy:**
- Don't rewrite all at once
- Wrap old code in new interface
- Replace piece by piece
- Delete old code when 100% migrated

// turbo
```bash
# Find code complexity hotspots
wc -l src/**/*.ts | sort -n -r | head -20
```

**Output:** `## Refactor Target: [Component/Module]`

---

## 🏎️ STEP 2: PERFORMANCE BASELINE (5 min)
**Agent:** `@beast-perf`

**Measure BEFORE refactoring:**
1. Bundle size (if frontend)
2. API latency (if backend)
3. Memory usage (if applicable)
4. Test execution time

// turbo
```bash
npm run build && du -sh .next/ 2>/dev/null || du -sh dist/
```

**CONSTRAINT:** Refactor must NOT degrade performance.

**Output:** `## Baseline Metrics` table

---

## 🔨 STEP 3: THE REWRITE (Variable)
**Agent:** `@beast-dev`

**MANDATORY PRE-CHECKS:**
// turbo
```bash
# Ensure test coverage exists
npm run test -- --coverage 2>/dev/null || echo "Add coverage check"
```

**Safe Refactor Protocol:**
1. **Surround with tests** (if not already covered)
2. **Small commits** (one logical change per commit)
3. **Run tests after EVERY change**
4. **No behavior changes** (same inputs = same outputs)

**Refactor Patterns:**
| Pattern | When to Use |
|---------|-------------|
| Extract Function | Logic repeated 3+ times |
| Rename Variable | Name doesn't explain intent |
| Inline Function | Wrapper adds no value |
| Replace Conditional with Polymorphism | >3 if/else on same type |
| Move to Module | Function doesn't belong here |

**HARD RULES:**
- NO feature changes during refactor
- NO dependency upgrades during refactor
- Commit message: `refactor: [what changed]`

// turbo
```bash
npm run test && npm run lint
```

---

## 🧪 STEP 4: PARITY CHECK (10 min)
**Agent:** `@beast-qa`

**Behavioral Parity:**
1. Does new code behave EXACTLY like old code?
2. Same inputs → Same outputs?
3. Edge cases still handled?

**Regression Suite:**
- Run full test suite
- Manually test critical paths
- Check: nulls, undefined, empty states

// turbo
```bash
npm run test:e2e
```

**GATE:** QA outputs `[PASS / FAIL]`

---

## 📊 STEP 5: METRICS CHECK (5 min)
**Agent:** `@beast-perf`

**Compare to Baseline:**
| Metric | Before | After | Verdict |
|--------|--------|-------|---------|
| Bundle size | [X] | [Y] | ✅/❌ |
| Latency | [X] | [Y] | ✅/❌ |
| Test time | [X] | [Y] | ✅/❌ |

**CONSTRAINT:** If ANY metric is worse, explain why or revert.

---

## 🎯 STEP 6: ZERO-DEFECT VERIFICATION (MANDATORY)
**Agent:** `@beast-dev`

**Refactor is not done until behavior is proven identical.**

// turbo
```bash
npm run build && npm run lint && npm run test
```

**Output required:**
```markdown
## ✅ VERIFICATION REPORT
**Build:** ✅ Passed
**Lint:** ✅ Passed
**Tests:** ✅ All tests pass (same as before refactor)
**Behavior:** ✅ Identical (same inputs → same outputs)
**Performance:** ✅ Not degraded (see metrics table)
```

**GATE:** ALL checks must pass.

---

## 🏁 STEP 7: CLEANUP
**Agent:** `@beast-devops`

1. **Delete old implementation** (if strangler pattern complete)
2. **Remove dead code** (grep for unused exports)
3. **Update documentation** (if API changed)

// turbo
```bash
# Find potentially unused exports
grep -r "export" src/ | wc -l
```

**Commit:** `refactor: [Component] - [Impact Summary]`

---

## 📊 EXIT CRITERIA

| Check | Required |
|-------|----------|
| All tests pass | ✅ |
| Performance not degraded | ✅ |
| No behavior changes | ✅ |
| Dead code removed | ✅ |
| Commit messages follow convention | ✅ |

---

## ⏱️ TIME BUDGET

| Step | Target |
|------|--------|
| Analysis | 10 min |
| Baseline | 5 min |
| Rewrite | Variable (depends on scope) |
| Parity | 10 min |
| Metrics | 5 min |
| Cleanup | 5 min |

---

## 🚨 ABORT CONDITIONS

STOP refactoring immediately if:
- Test coverage drops
- Performance degrades unexpectedly
- Scope grows beyond original target
- You're fighting the framework

**Recovery:** `git stash && git checkout main`
