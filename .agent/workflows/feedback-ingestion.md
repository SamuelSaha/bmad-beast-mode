---
description: Feedback Ingestion - Turn runtime behavior into actionable backlog (Layer E)
---

# 📊 Feedback Ingestion Workflow

> **Purpose:** Turn runtime behavior into actionable backlog items. Every signal maps to code.

---

## 🚦 Pre-Flight Check

- [ ] Feature is live (post-rollout)
- [ ] Monitoring active
- [ ] Support channels monitored

**Required Input:** Live feature with observability

---

## 📋 Workflow Steps

### Step 1: Collect Automated Signals
**Agent:** `@beast-o11y` (SCOPE)

Gather from automated sources:

| Source | Signal Type | Example |
|--------|-------------|---------|
| Error logs | Bugs | `TypeError: Cannot read property 'x'` |
| Performance metrics | Optimization | P99 > baseline |
| Feature flags | Enhancement | Low adoption rate |
| Analytics | Behavior | Drop-off at step 3 |

**Skill:** `observability`

**Output:** Signal inventory

### Step 2: Collect Manual Signals
**Agent:** `@beast-support` (RESOLVE)

Gather from human sources:

| Source | Signal Type | Example |
|--------|-------------|---------|
| Support tickets | UX issues | "Can't find button" |
| User interviews | Feature requests | "Would be nice if..." |
| Sales feedback | Blockers | "Lost deal because..." |
| Social/reviews | Sentiment | "This sucks" |

**Output:** Feedback inventory

### Step 3: Categorize & Prioritize
**Agent:** `@beast-pm` (VANTAGE)

Categorize each signal:

| Category | Priority Rule | Action |
|----------|---------------|--------|
| **Bug** (P0) | Users blocked | Immediate fix |
| **Bug** (P1) | Workaround exists | Next sprint |
| **UX Issue** | Friction, not broken | Backlog |
| **Enhancement** | Nice to have | Evaluate |
| **Feature Request** | New scope | Discovery |

**Skill:** `saas-workflows` (problem-framing for new features)

### Step 4: Map to Code
**Agent:** `@beast-analyst` (ATLAS)

Every issue must map to code:

```markdown
## Issue: [Title]

**Signal Source:** [log/ticket/analytics]
**Code Location:** [file:line or module]
**Root Cause:** [analysis]
**Fix Complexity:** [S/M/L]
```

**Gate:** If no code mapping possible → needs investigation task

### Step 5: Create Plane Issues
**Agent:** `@beast-plane` (ORBIT)

Create properly formatted issues:

```bash
python3 plane_client.py -w samsam create_issue \
  -p PROJECT \
  -t "Bug: [Signal summary]" \
  -d "## Source
[Where this came from]

## Code Location
\`file.ts:123\`

## Root Cause
[Analysis]

## Acceptance Criteria
- [ ] [Specific fix]

## Verification
[How to confirm fixed]" \
  --priority 2 \
  --state "Backlog" \
  --labels "Bug"
```

**Skill:** `plane-management`, `task-creation`

### Step 6: Close the Loop
**Agent:** `@beast-support` (RESOLVE)

Notify stakeholders:
- Support: "Issue logged as PROJ-123"
- Users: "Thanks for feedback, we're on it"
- Sales: "Blocker addressed in roadmap"

---

## 📊 Signal Quality Metrics

Track feedback system health:

| Metric | Target | Why |
|--------|--------|-----|
| Signal → Issue time | <24h | Fast response |
| Code mapping rate | >90% | Actionable signals |
| Issue close rate | >80%/sprint | Throughput |
| Repeat signals | <10% | Actually fixing |

---

## 📤 Deliverable

```markdown
# Feedback Report: [Feature Name] — Week [N]

## Signal Summary

| Type | Count | Converted to Issues |
|------|-------|---------------------|
| Errors | 12 | 3 (grouped) |
| Support tickets | 8 | 5 |
| Analytics anomalies | 2 | 2 |

## Issues Created

| ID | Title | Priority | Source |
|----|-------|----------|--------|
| PROJ-45 | Login timeout on slow networks | P1 | Error logs |
| PROJ-46 | Confusing button label | P3 | Support |
| PROJ-47 | Mobile layout broken | P2 | Support |

## Trends

- **Recurring:** Login issues (3rd week)
- **New:** Mobile layout (first reports)
- **Resolved:** Signup flow (no new tickets)

## Recommendations

1. Prioritize login reliability → skill-feature
2. Mobile audit needed → design task
3. Close out signup backlog → documentation
```

---

## 🔄 Behavior Correction Path

For minor tweaks that don't need full workflow:

### Allowed (behavior-correction)
- Copy/text changes
- UI tweaks (colors, spacing, labels)
- Logic adjustments within existing contracts

### Not Allowed
- New API endpoints → `/standard-feature`
- Schema changes → `/skill-feature`
- New dependencies → `/skill-feature`

**Gate:** If contract changes needed, escalate to proper workflow

---

## 🚪 Exit Gate

**Feedback cycle complete when:**
- [ ] All signals categorized
- [ ] Issues created with code mapping
- [ ] Stakeholders notified
- [ ] Trends documented

**Next:** Loop back to `/problem-framing` for new features or `/standard-feature` for fixes
