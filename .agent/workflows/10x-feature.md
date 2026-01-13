---
description: "Feature Optimization & Multiplication (The '10x' Protocol)"
---

# 🚀 10X FEATURE PROTOCOL

> **TRIGGER:** `/10x-feature <feature_name>`
> **OUTPUT:** One "10x bet" shipped + measured, or killed fast with evidence.
> **GOLDEN RULE:** 10x comes from **ONE main lever**, not 8 mediocre upgrades.
> **MODE:** Hypothesis-Driven with Kill Gates

---

## 🚨 ENTRY CRITERIA

**You can start this protocol if you can answer:**
```
/10x Feature: ____
KPI: ____
Baseline: ____
Segment: ____
Bottleneck: ____
Ship deadline: ____
```

**If you CAN'T name metric + baseline in 60 seconds:**
→ Start with **Instrumentation Sprint** first (Step 1)

---

## 🎯 WIN CONDITIONS

| Condition | Target |
|-----------|--------|
| 10x outcome on chosen KPI | Within 7 days |
| Time-to-first-ship | Within 48 hours |
| Evidence exists | Dashboard + before/after diffs |

---

## 🧭 STEP 0: SCOPE LOCK (15 min)
**Agent:** `@beast-orch`

**Choose 1 KPI only:**
- Activation
- Conversion
- Retention
- ARPA (Average Revenue Per Account)
- Time-to-Value
- Latency

**Define "10x" precisely:**
```
KPI_target = KPI_baseline × 10
```
(For time metrics: 10x faster)

**Define user segment:** Who exactly benefits? (ICP slice)

// turbo
```bash
# Check existing analytics
grep -r "trackEvent\|analytics" src/ | head -10
```

**Output:** `10x Brief (1 page)` with:
- Single KPI
- Baseline number
- Target number
- User segment
- Hard deadline

---

## 📉 STEP 1: BASELINE + INSTRUMENTATION (30 min)
**Agent:** `@beast-analyst`

**Measure what exists:**
1. Current KPI value
2. Funnel step performance
3. Latency percentiles (p50, p95)

**Map the constraint:**
- Find THE ONE bottleneck (where value dies)
- Top 3 drop-off points

**Add missing tracking:**
- Events for user actions
- Timing spans for latency
- Cohort tags for segmentation

// turbo
```bash
# Check instrumentation coverage
grep -r "console.time\|performance.mark" src/ | wc -l
```

**Output:** `Baseline Report` + `Metric Tree` + Top 3 bottlenecks

**GATE:** Can you answer "what changed?" within 2 minutes from logs?
- If NO → Add more instrumentation
- If YES → Proceed

---

## 🪓 STEP 2: ROOT CAUSE DIAGNOSIS (20 min)
**Agent:** `@beast-analyst`

**5 Whys on the #1 bottleneck:**
1. Why do users drop here?
2. Why [cause 1]?
3. Why [cause 2]?
4. Why [cause 3]?
5. **ROOT CAUSE:** [single sentence]

**Classify failure mode:**
| Mode | Description |
|------|-------------|
| Friction | Too many steps |
| Confusion | UI unclear |
| Mistrust | Users don't believe us |
| Missing | Feature doesn't exist |
| Slow | Takes too long |
| Cost | Too expensive |

**Quantify the loss:**
- Users lost at this point: [X]
- Revenue lost: $[Y]/month
- Time wasted: [Z] hours/user

**Output:** Root Cause Statement (testable, single lever)

---

## 🧠 STEP 3: 10X BETS (30 min)
**Agent:** `@beast-brainstormer`

**Generate 10 bets across 3 levers ONLY:**

### Lever 1: Remove Work
- Automate manual steps
- Set smart defaults
- Delete unnecessary features

### Lever 2: Collapse Steps
- Fewer decisions
- Fewer screens
- Fewer form fields

### Lever 3: Increase Certainty
- Show previews before commit
- Add proof/validation
- Provide guarantees

**Bet Format:**
```
Bet: [What changes]
Mechanism: [Why it moves KPI]
Risk: [What could fail]
Test: [Smallest proof]
```

// turbo
```bash
# Find complexity hotspots
find src -name "*.tsx" -exec wc -l {} \; | sort -n -r | head -10
```

**Output:** 10 Bets Backlog

**CHECK:** At least 3 bets should be "remove entire workflow" level, not polish

---

## 🤖 STEP 4: AI LAYER (Optional - 20 min)
**Agent:** `@beast-eval`

**ONLY propose AI if it removes user effort or uncertainty.**
(No "AI because AI")

**Choose AI Role:**
- Autofill (pre-populate fields)
- Recommend (suggest next action)
- Predict (forecast outcomes)
- Generate (create content)
- Verify (check correctness)
- Guardrail (prevent errors)

**Define evaluation:**
- Offline test set
- Success threshold
- Failure handling (fallback)
- Kill threshold (max error rate)

**Output:** AI Spec (inputs, outputs, guardrails, fallback)

---

## ⚖️ STEP 5: PRIORITIZATION (15 min)
**Agent:** `@beast-pm`

**Score each bet:**
| Bet | Lift | Time | Reversible | Risk | Score |
|-----|------|------|------------|------|-------|
| A | [1-10] | [hours] | [Y/N] | [H/M/L] | [calc] |
| B | [1-10] | [hours] | [Y/N] | [H/M/L] | [calc] |

**Pick:**
- 1 Primary Bet (ship in 48h)
- 1 Backup Bet (if primary fails)

**Set Kill Criteria:**
```
IF KPI_lift < X% after 7 days → KILL this bet
```

**Output:** Chosen Bet + Kill Criteria + Rollback Plan

---

## 🔨 STEP 6: BUILD FAST (2-4 hours)
**Agent:** `@beast-dev`

**Ship smallest version that tests the mechanism:**
1. Feature flag ON
2. Gradual rollout ready
3. Logging instrumented
4. Rollback command documented

**NO polish unless it affects KPI.**

// turbo
```bash
# Verify feature flag
grep -r "featureFlag\|FEATURE_" src/ | head -5
```

// turbo
```bash
npm run build && npm run test
```

**Output:** Release + Experiment Config

**CHECK:** Can you turn it off in 30 seconds?

---

## 🎯 STEP 6.5: ZERO-DEFECT VERIFICATION (MANDATORY)
**Agent:** `@beast-dev`

**No experiment runs on broken code.**

// turbo
```bash
npm run build && npm run lint && npm run test
```

**Output required:**
```markdown
## ✅ VERIFICATION REPORT
**Build:** ✅ Passed
**Lint:** ✅ Passed
**Tests:** ✅ Passed
**Feature Flag:** ✅ Tested ON and OFF
**Rollback:** ✅ 30-second rollback verified
```

**GATE:** ALL checks must pass.

---

## 🏎️ STEP 7: SPEED OPTIMIZATION (30 min)
**Agent:** `@beast-perf`

**Only optimize what blocks the KPI:**

| Target | Threshold |
|--------|-----------|
| Perceived interaction | <100ms |
| Backend p95 | Defined per feature |
| First Contentful Paint | <1.5s |

// turbo
```bash
# Check bundle size
npm run build && du -sh .next/ 2>/dev/null || du -sh dist/
```

**Output:** Perf Budget + Top 3 Fixes

**CHECK:** Did perf improve at the bottleneck step, not globally?

---

## 🎨 STEP 8: UX OPTIMIZATION (30 min)
**Agent:** `@beast-ux`

**Apply the "Remove 50%" Rule:**
- Remove 50% of decisions (use defaults)
- Remove 50% of clicks (collapse steps)
- Remove 50% of uncertainty (add previews)

**Measure:**
- Steps before: [X]
- Steps after: [Y]
- Click count delta: [Z]

**Output:** New Critical Path (step count comparison)

---

## 📈 STEP 9: GROWTH LOOP (20 min)
**Agent:** `@beast-growth`

**Add ONE loop max:**

| Loop Type | Example |
|-----------|---------|
| Sharing | Export, link, embed |
| Habit | Daily trigger, reminder |
| Monetization | Paywall (only if value proven) |

**Define the loop:**
```
Trigger → Action → Reward → [Back to Trigger]
```

**Output:** Loop Spec + Activation Event

---

## 🏁 STEP 10: IMPACT CHECK (30 min)
**Agent:** `@beast-analyst`

**Run experiment:**
- A/B test OR phased rollout
- Cohort comparison
- 7-day measurement period

**Decision Framework:**
| Result | Action |
|--------|--------|
| KPI_lift ≥ target | SCALE to 100% |
| KPI_lift < target/2 | KILL the bet |
| Otherwise | ITERATE (2 max) |

**Output:** Impact Report
- Delta achieved
- Confidence level
- Notes
- Next bet recommendation

---

## 🌿 BRANCHES & EDGE CASES

| Situation | Action |
|-----------|--------|
| Baseline missing | Instrumentation Sprint (4h) → restart Step 1 |
| Lagging KPI (retention/ARR) | Use proxy KPI (time-to-value) for 48h build |
| AI adds risk | Ship rules-based first → add AI behind flag |
| "10x" unrealistic | Redefine to "10x on sub-metric" |

---

## 🔥 KILL LIST (Anti-Patterns)

| Failure | Prevention |
|---------|------------|
| "Improved everything, moved nothing" | Force 1 KPI + 1 bottleneck + 1 bet |
| AI ships without eval, causes trust loss | Step 4 requires thresholds + kill criteria |
| Perf work burns time, no KPI linkage | Optimize bottleneck step only |
| Scope creep | Hard deadline at Step 0 |

---

## 🔁 CONTROL LOOP

```
1. Ship primary bet to 10% of segment
2. Measure: KPI + guardrail (error rate, churn)
3. Threshold: Scale if KPI ≥ X AND guardrail ≤ Y
4. Rule: 2 iterations max, then kill or switch to backup
```

---

## 📊 EXIT CRITERIA

| Check | Required |
|-------|----------|
| Single KPI defined | ✅ |
| Baseline measured | ✅ |
| Primary bet shipped | ✅ |
| Experiment running | ✅ |
| Impact report generated | ✅ |
| Decision made (Scale/Kill/Iterate) | ✅ |

---

## ⏱️ TIME BUDGET

| Step | Target |
|------|--------|
| Scope Lock | 15 min |
| Baseline | 30 min |
| Root Cause | 20 min |
| 10x Bets | 30 min |
| AI Layer | 20 min (optional) |
| Prioritization | 15 min |
| Build | 2-4 hours |
| Speed | 30 min |
| UX | 30 min |
| Growth Loop | 20 min |
| Impact Check | 30 min |
| **TOTAL** | **6-8 hours** |
