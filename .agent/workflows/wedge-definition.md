---
description: Wedge Definition - Define the minimum differentiated solution (Layer A)
---

# 🔪 Wedge Definition Workflow

> **Purpose:** Define the minimum differentiated solution that can ship fast and validate fast.

---

## 🚦 Pre-Flight Check

- [ ] Problem framing complete
- [ ] Non-goals are explicit
- [ ] Feasibility confirmed

**Required Input:** `/problem-framing` output

---

## 📋 Workflow Steps

### Step 1: Load Problem Context
**Agent:** `@beast-pm` (VANTAGE)

Review the problem framing:
- Pain statement
- Environment constraints
- Non-goals
- Success signals

**Verify:** Problem is still valid and prioritized

### Step 2: Competitive Wedge
**Agent:** `@beast-value` (COMPASS)

Identify the differentiation angle:
- What makes our solution different?
- What's the unfair advantage?
- Where do we NOT compete?

**Output:** Wedge statement (1 sentence)

### Step 3: MVP Boundary
**Agent:** `@beast-pm` (VANTAGE) + `@beast-architect` (MATRIX)

Define the sharp MVP boundary:

```markdown
## MVP Scope

### MUST Have (Critical Path)
- [Feature that proves the wedge]
- [Feature that proves the wedge]

### WON'T Have (Explicit Cuts)
- [Feature deferred to v2]
- [Feature deferred to v2]

### MIGHT Have (If time permits)
- [Low-risk enhancement]
```

**Rule:** MUST Have ≤ 5 items

### Step 4: Sprint Fit Check
**Agent:** `@beast-sm` (TEMPO)

Validate sprint feasibility:
- Can MUST Have ship in ≤1 sprint?
- Dependencies identified?
- Team capacity confirmed?

**Gate:** ✅ Fits in 1 sprint OR 🔄 Re-scope

### Step 5: Rollback Safety
**Agent:** `@beast-architect` (MATRIX)

Define rollback strategy:
- Feature flag approach
- Database migration reversibility
- API versioning (if needed)

**Gate:** Clean rollback path exists

### Step 6: Wedge Validation Plan
**Agent:** `@beast-data` (ORACLE)

How will we know the wedge works?
- What metric proves value?
- Minimum sample size
- Decision timeline

**Output:** Validation plan

---

## 📤 Deliverable

```markdown
# Wedge Definition: [Title]

## Problem Reference
[Link to problem-framing]

## Wedge Statement
[One sentence: "We win by doing X differently"]

## MVP Scope

### MUST Have
1. [ ] [Critical feature]
2. [ ] [Critical feature]

### WON'T Have (v1)
1. [Deferred]
2. [Deferred]

### MIGHT Have
1. [If time]

## Sprint Fit
- Estimated: [X] story points
- Sprint capacity: [Y] points
- Fit: ✅/🚫

## Rollback Strategy
- Feature flag: [name]
- DB reversible: ✅/🚫
- API versioned: ✅/N/A

## Validation Plan
| Metric | Target | Timeline |
|--------|--------|----------|
| ... | ... | 2 weeks |

## Exit Decision
After validation period:
- If [metric] > [target]: Continue to v2
- If [metric] < [target]: Pivot or kill
```

---

## 🚪 Exit Gate

**Ready for solution-design when:**
- [ ] MVP scope ≤ 5 MUST Have items
- [ ] Fits in 1 sprint
- [ ] Rollback path exists
- [ ] Validation plan defined

**Next:** `/discovery-protocol` (solution-design)
