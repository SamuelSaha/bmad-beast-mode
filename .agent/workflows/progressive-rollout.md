---
description: Progressive Rollout - Controlled feature exposure with metrics gates (Layer D)
---

# 🚀 Progressive Rollout Workflow

> **Purpose:** Controlled exposure to users with metrics-based gates. Never ship to 100% on day one.

---

## 🚦 Pre-Flight Check

- [ ] Launch readiness confirmed
- [ ] Feature flag configured
- [ ] Monitoring dashboards ready
- [ ] Rollback tested

**Required Input:** `/launch-protocol` completion

---

## 📋 Workflow Steps

### Step 1: Rollout Configuration
**Agent:** `@beast-devops` (FLOW)

Configure feature flag:

```typescript
// Feature flag configuration
const rolloutConfig = {
  flagName: 'feature-xyz',
  stages: [
    { name: 'internal', percentage: 0.5, duration: '24h' },
    { name: 'canary', percentage: 5, duration: '48h' },
    { name: 'beta', percentage: 25, duration: '1w' },
    { name: 'ga', percentage: 100, duration: 'permanent' }
  ],
  abortCriteria: {
    errorRate: 0.01,      // >1% = abort
    p99Latency: 2.0,      // >2x baseline = abort
    userComplaints: 10    // >10 in 24h = abort
  },
  // AI-SPECIFIC: Kill Switch
  killSwitch: {
    flag: 'ai-feature-xyz-killswitch',
    autoTrip: true,
    tripConditions: {
      errorRate: 0.05,           // 5% errors = auto-kill
      hallucinationRate: 0.15,   // 15% hallucinations = auto-kill
      costPerQuery: 0.50         // $0.50/query = auto-kill
    }
  }
};
```

**Skill:** `cicd-pipelines`, `ai-development`

### Step 2: Baseline Metrics
**Agent:** `@beast-o11y` (SCOPE)

Capture baseline before rollout:

| Metric | Baseline | Alert Threshold |
|--------|----------|-----------------|
| Error rate | X% | >X + 1% |
| P99 latency | Yms | >2Y ms |
| Throughput | Z rps | <0.8Z rps |

**AI-Specific Metrics:**

| Metric | Baseline | Alert Threshold |
|--------|----------|-----------------|
| **Hallucination rate** | X% | >X + 5% |
| **Faithfulness score** | 0.9+ | <0.85 |
| **Cost per query** | $X | >$X × 1.5 |
| **Token consumption** | Xk | >Xk × 2 |
| **Time-to-First-Token** | Xs | >2s |

**Skill:** `observability`, `ai-development`

**Output:** Baseline snapshot

### Step 3: Stage 1 — Internal (0.5%)
**Agent:** `@beast-devops` (FLOW)

Deploy to internal users only:
- Duration: 24 hours minimum
- Audience: Team members, dogfooding

**Monitoring:**
- [ ] Error rate stable
- [ ] No critical bugs
- [ ] Internal feedback positive

**Gate:** ✅ Proceed OR 🚫 Fix issues

### Step 4: Stage 2 — Canary (5%)
**Agent:** `@beast-devops` (FLOW)

Expand to canary population:
- Duration: 48 hours minimum
- Audience: Random 5% of users

**Monitoring:**
- [ ] Error rate < baseline + 0.5%
- [ ] Latency < 1.5x baseline
- [ ] No support ticket spike

**Gate:** ✅ Proceed OR 🔄 Hold OR 🚫 Rollback

### Step 5: Stage 3 — Beta (25%)
**Agent:** `@beast-devops` (FLOW)

Expand to beta population:
- Duration: 1 week
- Audience: 25% of users

**Monitoring:**
- [ ] All canary metrics stable
- [ ] Business metrics positive or neutral
- [ ] User engagement maintained

**Gate:** ✅ Proceed to GA OR 🔄 Extend beta

### Step 6: Stage 4 — General Availability (100%)
**Agent:** `@beast-devops` (FLOW)

Full rollout:
- Remove feature flag (optional)
- Monitor for 2 weeks post-launch

**Post-GA Monitoring:**
- [ ] 2-week stability confirmed
- [ ] No regression in key metrics
- [ ] Feature flag cleanup scheduled

---

## 🚨 Abort Protocol

If any abort criteria triggered:

```
1. IMMEDIATE: Set flag to 0%
2. NOTIFY: Alert on-call + stakeholders
3. TRIAGE: @beast-analyst investigates
4. DOCUMENT: Incident report
5. FIX: Address root cause
6. RETRY: Restart from Stage 1
```

**Skill:** `observability` for detection

---

## 📤 Deliverable

```markdown
# Rollout Report: [Feature Name]

## Configuration
- Flag: `feature-xyz`
- Start: 2026-01-21
- Current Stage: [Stage]

## Stage History

| Stage | Start | End | Result |
|-------|-------|-----|--------|
| Internal | Jan 21 | Jan 22 | ✅ Passed |
| Canary | Jan 22 | Jan 24 | ✅ Passed |
| Beta | Jan 24 | Jan 31 | 🔄 In Progress |

## Metrics

### Error Rate
| Stage | Baseline | Observed | Status |
|-------|----------|----------|--------|
| Internal | 0.1% | 0.1% | ✅ |
| Canary | 0.1% | 0.15% | ✅ |

### Latency (P99)
| Stage | Baseline | Observed | Status |
|-------|----------|----------|--------|
| Internal | 200ms | 210ms | ✅ |
| Canary | 200ms | 220ms | ✅ |

## Issues Discovered
- [Issue 1]: Fixed in canary
- [Issue 2]: Monitoring

## Decision
[ ] Proceed to next stage
[ ] Hold at current stage
[ ] Rollback
```

---

## 🔌 Plane Integration

Create tracking issues:

```bash
# Rollout tracking issue
python3 plane_client.py -w samsam create_issue \
  -p PROJECT \
  -t "Release: Feature XYZ Progressive Rollout" \
  -d "Tracking rollout stages..." \
  --priority 2 \
  --state "In Progress" \
  --labels "release"
```

**Skill:** `plane-management`

---

## 🚪 Exit Gate

**Rollout complete when:**
- [ ] 100% reached
- [ ] 2 weeks stable at GA
- [ ] No abort criteria triggered
- [ ] Documentation updated

**Next:** `/feedback-ingestion`
