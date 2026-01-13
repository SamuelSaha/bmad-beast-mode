---
description: "Autonomous Feature Discovery & Implementation (The 'Skunkworks' Protocol)"
---

# 🛸 DISCOVERY PROTOCOL (AUTOPILOT MODE)

> **TRIGGER:** `/discovery-protocol`
> **GOAL:** Autonomously identify a high-value opportunity, validate it, and build the MVP.
> **SQUAD:** Brainstormer → Analyst → AI-Eval → Value → Pricing → PM → Architect → Dev → QA
> **MODE:** HIGH AUTONOMY (User approval only at Gate 3)

---

## 🚨 AUTONOMY RULES

This protocol operates with **minimal user intervention**:
- Steps 1-2: Fully autonomous (explore freely)
- Step 3: **HARD STOP for user approval**
- Steps 4-6: Autonomous execution if approved

---

## 💡 STEP 1: OPPORTUNITY SCAN (30 min)
**Agents:** `@beast-brainstormer` + `@beast-analyst` + `@beast-eval`

**Three Parallel Tracks:**

### Track A: Metric Dead Zones (Analyst)
- Scan analytics for drop-off points >20%
- Find features with low adoption (<10%)
- Identify user complaints/churn reasons

### Track B: AI Optimization Opportunities (Eval)
- Scan codebase for "Could AI make this 10x better?"
- Look for repetitive user actions (automate them)
- Find prediction opportunities (recommendations, defaults)

### Track C: Crazy Eights (Brainstormer)
- Generate 8 wild ideas in 8 minutes
- No filtering at this stage
- Quantity over quality

// turbo
```bash
# Look for TODO comments indicating pain points
grep -r "TODO\|FIXME\|HACK" src/ | head -20
```

**CONSTRAINT:** Must be 10x better, not 10% better.

**Output:** Top 3 opportunities ranked by potential impact

---

## 💎 STEP 2: VALUE & REVENUE VALIDATION (30 min)
**Agents:** `@beast-value` + `@beast-pricing`

**Value Validation:**
1. **The Mom Test:** Does this solve a real, burning pain?
2. **Frequency:** How often do users hit this problem?
3. **Alternatives:** What do they currently do instead?

**Revenue Validation:**
1. **Willingness to Pay:** Would users pay for this?
2. **Monetization Path:** Subscription? Upsell? Premium?
3. **Cost to Build:** Dev hours × rate = $X

**Kill Criteria:**
- If no clear path to money → **KILL IT**
- If < $1000/month potential → **KILL IT**
- If >40 hours to build MVP → **REDUCE SCOPE**

**Output:** `Value Score: [1-10]` + `Revenue Potential: $X/month`

---

## 🧠 STEP 3: STRATEGY GATE ⚠️ USER APPROVAL REQUIRED
**Agent:** `@beast-pm`

**The Pitch (present to user):**
```
╔══════════════════════════════════════════════════════════════════╗
║                     🛸 DISCOVERY BRIEFING                        ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  📊 OPPORTUNITY: [Name]                                          ║
║  💰 Revenue Potential: $[X]/month                                ║
║  ⏱️  Build Cost: [Y] hours                                       ║
║  📈 ROI: [Revenue / Cost]                                        ║
║                                                                  ║
║  ✅ WHY BUILD:                                                   ║
║     - [Reason 1]                                                 ║
║     - [Reason 2]                                                 ║
║                                                                  ║
║  ❌ RISKS:                                                       ║
║     - [Risk 1]                                                   ║
║     - [Risk 2]                                                   ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝

AWAITING: [GO / NO-GO]
```

**GATE:** Wait for explicit user confirmation
- If `NO-GO` → Return to Step 1 with different direction
- If `GO` → Proceed to autonomous build

---

## 🏛️ STEP 4: AUTONOMOUS SPEC (1 hour)
**Agents:** `@beast-architect` + `@beast-ux`

**Architect Output:**
- `spec.md` with "Scale-First" principles
- API contracts (if applicable)
- Data model

**UX Output:**
- `wireframe.md` with "Mobile Dictatorship" rules
- Critical path only (no polish)
- Error states

**Sanity Check:** Do we have the data/APIs to build this?

// turbo
```bash
# Create feature branch
git checkout -b feature/discovery-$(date +%Y%m%d)
```

---

## 🔨 STEP 5: PHANTOM BUILD (2-4 hours)
**Agent:** `@beast-dev`

**MVP Principles:**
1. **No Fluff:** Core value only
2. **Native First:** No new dependencies
3. **Ugly is OK:** Ship fast, polish later

**Implementation:**
1. Create feature branch: `feature/discovery-[name]`
2. Build minimum viable implementation
3. Write 1 E2E test to prove it works
4. No optimization (that's post-validation)

// turbo
```bash
npm run test && npm run build
```

**Output:** Working feature + 1 E2E test

---

## 🎯 STEP 5.5: ZERO-DEFECT VERIFICATION (MANDATORY)
**Agent:** `@beast-dev`

**MVP must work before demo.**

// turbo
```bash
npm run build && npm run lint && npm run test
```

**Output required:**
```markdown
## ✅ VERIFICATION REPORT
**Build:** ✅ Passed
**Lint:** ✅ Passed
**Tests:** ✅ Passed (at least 1 E2E test)
**Feature:** ✅ Core functionality works
```

**GATE:** ALL checks must pass.

---

## 🧪 STEP 6: VERIFICATION & DEMO
**Agent:** `@beast-qa`

**Validation Checks:**
1. Does it solve the original pain point?
2. Is it 10x better than current solution?
3. Are there obvious bugs?

**Demo Package:**
Create a "Usage Guide" for the user:
```markdown
## 🛸 Discovery Demo: [Feature Name]

### How to Test:
1. Go to [URL]
2. Click [Action]
3. Observe [Result]

### What to Look For:
- [Expected behavior 1]
- [Expected behavior 2]

### Known Limitations:
- [Limitation 1]
- [Limitation 2]
```

**Output:** `STATUS: READY FOR REVIEW`

---

## 📊 EXIT CRITERIA

| Check | Required |
|-------|----------|
| Opportunity validated with data | ✅ |
| User approved at Gate 3 | ✅ |
| MVP works end-to-end | ✅ |
| At least 1 E2E test | ✅ |
| Demo guide created | ✅ |

---

## ⏱️ TIME BUDGET

| Step | Target |
|------|--------|
| Opportunity Scan | 30 min |
| Value Validation | 30 min |
| Strategy Gate | 10 min |
| Spec | 1 hour |
| Build | 2-4 hours |
| Verification | 30 min |
| **TOTAL** | **5-7 hours** |

---

## 🔄 POST-DISCOVERY

After user reviews the demo:

**If APPROVED:**
- Merge to main behind feature flag
- Schedule polish sprint
- Add to product roadmap

**If REJECTED:**
- Document learnings in LEARNINGS.md
- Archive branch
- Return to Step 1 with new hypothesis
