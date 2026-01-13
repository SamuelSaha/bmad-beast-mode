---
description: "Feature Optimization & Multiplication (The '10x' Protocol)"
---

# 🚀 10X FEATURE PROTOCOL (Beast Mode v2)

> **TRIGGER:** `/10x <feature_name>`  
> **OUTPUT CONTRACT:** One “10x bet” shipped + measured, or killed fast with evidence.  
> **GOLDEN RULE:** 10x comes from **one main lever**, not 8 mediocre upgrades.

---

## Decision ✅
- **Default path:** Turn this into a **real agent protocol**: measurable, gated, fast loops, explicit outputs per step.  
- **Switch rule:** If you **can’t name the metric + baseline** in 60 seconds, start with **Instrumentation Sprint** first.

## Win Conditions 🎯
- **10x outcome metric** achieved (or falsified) within **7 days** on one chosen KPI (conversion, retention, time-to-value, or latency).  
- **Time-to-ship:** first 10x candidate shipped to production in **48 hours** (even if ugly).  
- **Proof:** dashboard + experiment log + before/after diffs exist.

---

## 0) SCOPE LOCK (DIRECTOR) 🧭
**Agent:** `@beast-director`
- **Choose 1 KPI only:** `{Activation | Conversion | Retention | ARPA | Time-to-Value | Latency}`
- **Define “10x” precisely:** `KPI_target = KPI_baseline * 10` (or “10x faster” for time metrics)
- **Define user segment:** who exactly gets the benefit (ICP slice)
- **Output:** `10x Brief (1 page)` with KPI, segment, constraint, deadline
- **Check:** brief contains a **numbered baseline** and a **hard deadline**

---

## 1) BASELINE + INSTRUMENTATION (ANALYST) 📉
**Agent:** `@beast-analyst`
- **Measure baseline:** current KPI, funnel step, latency percentiles (p50/p95)
- **Map the constraint:** **1 bottleneck** only (where value dies)
- **Add missing tracking:** events, timing spans, cohorts, error taxonomy
- **Output:** `Baseline Report` + `Metric Tree` + `Top 3 drop-off points`
- **Check:** you can answer “what changed?” within 2 minutes from logs

---

## 2) ROOT CAUSE (DIAGNOSTIC) 🪓
**Agent:** `@beast-diagnostic`
- **Run 5 Whys** on the #1 bottleneck (no brainstorming yet)
- **Classify failure mode:** `{Friction | Confusion | Mistrust | Missing capability | Slow | Cost}`
- **Quantify loss:** users/time/revenue lost at that point
- **Output:** `Root Cause Statement` (single sentence) + “loss math”
- **Check:** root cause is **testable** and points to a **single lever**

---

## 3) 10X BETS (BRAINSTORMER) 🧠
**Agent:** `@beast-brainstormer`
- **Generate 10 bets**, but **only across 3 levers**:
  - **Remove work** (automation, defaults, deletion)
  - **Collapse steps** (fewer decisions, fewer screens)
  - **Increase certainty** (proof, previews, guarantees, verification)
- **Force structure per bet:**
  - `Bet:` what changes
  - `Mechanism:` why it should move KPI
  - `Risk:` what could fail
  - `Test:` smallest proof
- **Output:** `10 Bets Backlog`
- **Check:** at least **3 bets** are “remove entire workflow” level, not polish

---

## 4) AI LAYER (ORACLE) 🤖
**Agent:** `@beast-oracle`
- **Only propose AI if it removes user effort or uncertainty** (no “AI because AI”)
- **Choose AI role:** `{Autofill | Recommend | Predict | Generate | Verify | Guardrail}`
- **Define eval:** offline set + success threshold + failure handling
- **Output:** `AI Spec` (inputs, outputs, guardrails, eval metric, fallback)
- **Check:** you have a **kill threshold** for model errors (ex: hallucination rate)

---

## 5) PRIORITIZATION (ARBITER) ⚖️
**Agent:** `@beast-arbiter`
- **Score each bet** on: `Expected lift`, `Time-to-ship`, `Reversibility`, `Risk`
- **Pick 1 primary bet + 1 backup bet**
- **Set kill criteria before building**
- **Output:** `Chosen Bet` + `Kill Criteria`
- **Check:** primary bet is shippable in **48h** with a rollback plan

---

## 6) BUILD FAST (FORGE) 🔨
**Agent:** `@beast-forge`
- **Ship the smallest version that hits the mechanism**
- **Add flags:** feature flag, gradual rollout, logging hooks
- **No polish unless it affects KPI**
- **Output:** `Release` + `Experiment Config`
- **Check:** you can turn it off in **30 seconds**

---

## 7) SPEED + RELIABILITY (NITRO) 🏎️
**Agent:** `@beast-nitro`
- **Only optimize what blocks the KPI** (p95, TTI, failure rate)
- **Targets:**
  - Interaction response: `<100ms perceived` (optimistic UI)
  - Backend p95: set a number tied to feature critical path
- **Output:** `Perf Budget` + `Top 3 fixes`
- **Check:** perf improved at the **bottleneck step**, not globally

---

## 8) UX AS A WEAPON (MUSE) 🎨
**Agent:** `@beast-muse`
- **Remove 50% of decisions** via defaults and guided paths
- **Replace uncertainty with previews** (before user commits)
- **Micro-interactions only if they reduce drop-off**
- **Output:** `New Critical Path` (steps count) + `Before/After click count`
- **Check:** critical path steps decreased measurably

---

## 9) GROWTH LOOP (GROWTH) 📈
**Agent:** `@beast-growth`
- **Add 1 loop max:**
  - Sharing loop (export, link, embed)
  - Habit loop (daily/weekly trigger, reminders)
  - Monetization gate (paywall only if value proven)
- **Output:** `Loop Spec` + `Trigger → Action → Reward` mapping
- **Check:** loop has a measurable activation event

---

## 10) IMPACT CHECK + ITERATION (ANALYST) 🏁
**Agent:** `@beast-analyst`
- **Run experiment:** A/B or phased rollout with cohort comparison
- **Decision:** `{Scale | Iterate | Kill}` based on thresholds
- **Output:** `Impact Report` (delta, confidence, notes, next bet)
- **Check:** decision is evidence-based, not vibes

---

## Branches 🌿
- **If baseline missing:** do `Instrumentation Sprint (4h)` then restart at Step 1.
- **If KPI is lagging (retention/ARR):** use **proxy KPI** (time-to-value, activation) for the 48h build, then re-measure lagging KPI later.
- **If AI adds risk:** ship a **rules-based version first**, then add AI behind a flag with eval gates.
- **If “10x” is unrealistic:** redefine to “10x on a sub-metric” (ex: step latency, time-to-first-output) but keep the same user outcome.

---

## Kill List 🔥
- **Failure:** “Improved everything” but moved nothing  
  - Workaround: force **1 KPI + 1 bottleneck + 1 bet**  
  - Prevention: Step 0 scope lock + Step 5 arbiter
- **Failure:** AI ships without eval and causes trust loss  
  - Workaround: fallback to deterministic mode + add “verify” UI  
  - Prevention: Step 4 requires thresholds + kill criteria
- **Failure:** Perf work burns time with no KPI linkage  
  - Workaround: optimize only the **critical path span**  
  - Prevention: perf budget tied to bottleneck step only

---

## Control Loop 🔁
- **Smallest test:** ship the primary bet to **10%** of target segment
- **Metric:** chosen KPI + one guardrail (error rate, churn, refunds)
- **Threshold:** scale only if `KPI lift ≥ X` and `guardrail not worse than Y`
- **Iterate/stop rule:** 2 iterations max, then kill or switch to backup bet

---

## Next Move ⚡
- Fill this:
  - **`/10x Feature: ____ | KPI: ____ | Baseline: ____ | Segment: ____ | Bottleneck: ____ | Ship deadline: ____`**
- **Done when:** you have a **number baseline** and a **single bottleneck statement**.
