---
description: Problem Framing - Turn vague ideas into buildable problems (Layer A)
---

# 🎯 Problem Framing Workflow

> **Purpose:** Turn vague ideas into buildable problems with clear constraints.

---

## 🚦 Pre-Flight Check

- [ ] User pain or opportunity is articulated
- [ ] Some constraints are known (time, budget, tech)
- [ ] Stakeholder available for clarification

---

## 📋 Workflow Steps

### Step 1: Pain Extraction
**Agent:** `@beast-pm` (VANTAGE)

Identify the core user pain:
- What is the user struggling with?
- What triggers the pain?
- What is the cost of not solving?

**Output:** Pain statement (1-2 sentences)

### Step 2: Environment Mapping
**Agent:** `@beast-analyst` (ATLAS)

Map the problem environment:
- What systems are involved?
- What constraints exist (technical/legal/business)?
- What has been tried before?

**Output:** Environment brief

### Step 3: Problem Statement
**Agent:** `@beast-pm` (VANTAGE)

Write the formal problem statement:

```markdown
## Problem Statement

**Who:** [user segment]
**Experiences:** [pain/friction]
**When:** [trigger/context]
**Because:** [root cause]
**Impact:** [quantified cost]
```

### Step 4: Non-Goals Definition
**Agent:** `@beast-pm` (VANTAGE)

Explicitly state what we are NOT solving:
- Adjacent problems we're ignoring
- Scope boundaries
- Future considerations (not now)

**Output:** Non-goals list (minimum 3)

### Step 5: Success Signals
**Agent:** `@beast-data` (ORACLE)

Define measurable success:
- Leading indicators
- Lagging indicators
- Minimum viable metrics

**Output:** Success signals table

### Step 6: Feasibility Gate
**Agent:** `@beast-architect` (MATRIX)

Technical feasibility check:
- Can this be expressed as an interface or API?
- Are there blocking dependencies?
- Rough complexity estimate (T-shirt size)

**Gate:** ✅ Feasibility confirmed OR 🚫 Blocked with reason

---

## 🤖 AI-NATIVE FEATURES: Additional Steps

*If the solution involves AI/LLM capabilities, complete these additional steps.*

### Step 7: AI Utility Analysis
**Agent:** `@beast-architect` (MATRIX)

**Skill:** `ai-development`

Determine if AI is the right solution:

| Criterion | Score (1-5) |
|-----------|-------------|
| **Non-Deterministic Complexity**: Does it involve unstructured data? | __ |
| **Blank Page Problem**: Does user need help starting? | __ |
| **Cognitive Load**: Is user acting as "human router"? | __ |

**Rule:** Total < 9 → Consider non-AI solution first

### Step 8: Fake Door Validation
**Agent:** `@beast-pm` (VANTAGE)

**Before building AI features, validate demand:**

1. Create CTA: "✨ [AI Feature Name]" button in UI
2. On click: Show "Early Access - Coming Soon" modal
3. Collect: Email + "What did you hope this would do?"
4. Measure: Click-through rate

| Result | Action |
|--------|--------|
| >20% CTR | ✅ Proceed to build |
| 10-20% CTR | 🔄 Refine value prop |
| <10% CTR | 🚫 Pivot or abandon |

**Output:** Fake Door test results

### Step 9: Stochastic Floor Definition
**Agent:** `@beast-architect` (MATRIX)

Define minimum acceptable accuracy:

```markdown
## Stochastic Floor

**Risk Level:** [High/Medium/Low]
**Required Accuracy:** [99%/90%/70%]
**Fallback Strategy:** [Human review/Rule-based/User edits]
```

---

## 📤 Deliverable

```markdown
# Problem Framing: [Title]

## Pain Statement
[1-2 sentences]

## Problem Statement
- Who:
- Experiences:
- When:
- Because:
- Impact:

## Environment
- Systems involved:
- Constraints:
- Prior attempts:

## Non-Goals
1. [Explicit exclusion]
2. [Explicit exclusion]
3. [Explicit exclusion]

## Success Signals
| Signal | Type | Target |
|--------|------|--------|
| ... | Leading | ... |
| ... | Lagging | ... |

## Feasibility
- Expressible as interface: ✅/🚫
- Blocking deps: None / [list]
- Complexity: S/M/L/XL

## AI Validation (if applicable)
- AI Utility Score: __/15
- Fake Door CTR: __%
- Stochastic Floor: __%
- Fallback: [strategy]
```

---

## 🚪 Exit Gate

**Ready for wedge-definition when:**
- [ ] Problem statement is concrete
- [ ] Non-goals are explicit
- [ ] Success signals are measurable
- [ ] Feasibility is confirmed
- [ ] (AI) Fake Door validated (if applicable)
- [ ] (AI) Stochastic Floor defined (if applicable)

**Next:** `/wedge-definition`

