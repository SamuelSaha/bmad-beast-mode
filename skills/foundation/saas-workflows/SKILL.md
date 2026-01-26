---
name: SaaS Workflow Mastery
description: Complete SaaS product lifecycle from problem to post-launch learning
version: 1.0.0
primary_agents: [beast-task, beast-pm, beast-architect, beast-dev, beast-qa, beast-plane]
---

# 🏗️ SaaS Workflow Mastery Skill

> **ACTIVATION:** Think in layers of certainty. Skip a layer, pay later.

---

## 🎯 Core Philosophy

```
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║   THE GOLDEN CHAIN                                              ║
║                                                                  ║
║   problem-framing                                               ║
║        ↓                                                        ║
║   wedge-definition                                              ║
║        ↓                                                        ║
║   solution-design                                               ║
║        ↓                                                        ║
║   tech-contract                                                 ║
║        ↓                                                        ║
║   standard-feature / skill-feature                              ║
║        ↓                                                        ║
║   smart-refactor (if needed)                                    ║
║        ↓                                                        ║
║   launch-readiness                                              ║
║        ↓                                                        ║
║   progressive-rollout                                           ║
║        ↓                                                        ║
║   feedback-ingestion                                            ║
║                                                                  ║
║   SKIP A STEP = PAY LATER                                       ║
║   Skip wedge → overbuild                                        ║
║   Skip contract → refactor hell                                 ║
║   Skip rollout → incidents                                      ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
```

---

## 📊 Certainty Layers

| Layer | Focus | Certainty Type | Key Question |
|-------|-------|----------------|--------------|
| **A** | Problem & Scope | Problem certainty | Are we solving the right thing? |
| **B** | Solution Design | Solution certainty | Are we designing it correctly? |
| **C** | Build & Change | Implementation certainty | Is it built right? |
| **D** | Validation & Launch | Operational certainty | Will it survive reality? |
| **E** | Post-Launch | Learning certainty | What did we learn? |

---

## 🔷 LAYER A — Problem & Scope

### Workflows

| Workflow | Purpose | Gate |
|----------|---------|------|
| `/problem-framing` | Turn vague ideas into buildable problems | "Can this be expressed as an interface or API?" |
| `/wedge-definition` | Define minimum differentiated solution | "Can this ship in ≤1 sprint with clean rollback?" |

### Problem Framing Protocol

```markdown
## Problem Statement Template

**Who:** [user segment]
**Experiences:** [pain/friction]
**When:** [trigger/context]
**Because:** [root cause]
**Impact:** [quantified cost]

## Required Outputs
1. Pain statement (1-2 sentences)
2. Environment brief
3. Non-goals list (minimum 3)
4. Success signals table
5. Feasibility gate
```

### Wedge Definition Protocol

```markdown
## MVP Scope Template

### MUST Have (Critical Path) — Max 5 items
- [Feature that proves the wedge]

### WON'T Have (Explicit Cuts)
- [Feature deferred to v2]

### MIGHT Have (If time permits)
- [Low-risk enhancement]

## Required Outputs
1. Wedge statement (1 sentence)
2. Sprint fit confirmation
3. Rollback strategy
4. Validation plan with metrics
```

---

## 🔷 LAYER B — Solution Design

### Workflows

| Workflow | Purpose | Gate |
|----------|---------|------|
| `/discovery-protocol` | Translate product intent into system shape | Every flow maps to a component or API |
| `/tech-contract` | Freeze interfaces before coding | Contract testable without implementation |

### Solution Design Protocol

```markdown
## Solution Design Template

### User Flows
- [Flow 1]: trigger → states → outcome
- [Flow 2]: trigger → states → outcome

### System Responsibilities
| Component | Responsibility | Owns |
|-----------|----------------|------|
| ... | ... | [data/behavior] |

### Data Ownership
| Entity | Owner | Consumers |
|--------|-------|-----------|
| ... | ... | ... |

### Failure Modes
| Failure | Detection | Recovery |
|---------|-----------|----------|
| ... | ... | ... |

### Boundaries & Invariants
- [Invariant 1]
- [Boundary rule]
```

### Tech Contract Protocol

```markdown
## Tech Contract Template

### API Contracts
```typescript
// Endpoint: POST /api/auth/login
interface LoginRequest {
  email: string;
  password: string;
}

interface LoginResponse {
  token: string;
  expiresAt: string;
}

// Errors: 400 (invalid), 401 (unauthorized), 429 (rate limited)
```

### Schemas
```sql
-- New table or changes
ALTER TABLE users ADD COLUMN last_login_at TIMESTAMP;
```

### Events
```typescript
// Event: user.logged_in
interface UserLoggedInEvent {
  userId: string;
  timestamp: string;
  ipAddress: string;
}
```

### Contract Validation
- [ ] Types compile without implementation
- [ ] Error cases enumerated
- [ ] Migrations reversible
```

---

## 🔷 LAYER C — Build & Change

### Workflows

| Workflow | Purpose | Gate |
|----------|---------|------|
| `/standard-feature` | Default feature execution | AC + tests pass |
| `/skill-feature` | Complex/high-risk features | Failure modes enumerated |
| `/epic-feature` | Multi-sprint initiatives | Each phase independently shippable |
| `/smart-refactor` | Structure change, no behavior | Behavior parity proven |

### Standard Feature Decomposition

```markdown
## Task Breakdown

1. **Implementation Task**
   - Type: implementation
   - Scope: [files/modules]
   - AC: [testable criteria]

2. **Test Task**
   - Type: test
   - Scope: [test files]
   - Coverage: [target %]

3. **Documentation Task**
   - Type: documentation
   - Scope: [doc files]
   - Updates: [specific sections]
```

### Skill Feature Additional Requirements

```markdown
## Additional for Skill Features

4. **Design Review Task**
   - Type: design
   - Output: Architecture decision record

5. **Risk Assessment Task**
   - Type: decision
   - Output: Failure modes + mitigations
```

### Smart Refactor Rules

```markdown
## Refactor Constraints

**MANDATORY:**
- "What is NOT changing" section required
- Behavior parity verification plan
- Refactor log for documentation

**VERIFICATION:**
- All existing tests pass
- No new behavior introduced
- Performance baseline maintained
```

---

## 🔷 LAYER D — Validation & Launch

### Workflows

| Workflow | Purpose | Gate |
|----------|---------|------|
| `/launch-protocol` | Launch readiness check | Kill switch exists |
| `/progressive-rollout` | Controlled exposure | Metrics stable |

### Launch Readiness Checklist

```markdown
## Launch Readiness

### Feature Safety
- [ ] Feature flag configured
- [ ] Rollback documented and tested
- [ ] Kill switch available

### Monitoring
- [ ] Error alerting configured
- [ ] Key metrics dashboarded
- [ ] Log verbosity appropriate

### Documentation
- [ ] User-facing docs updated
- [ ] Internal runbook exists
- [ ] Support team briefed

### Communication
- [ ] Changelog prepared
- [ ] Stakeholders notified
- [ ] Support escalation path clear
```

### Progressive Rollout Protocol

```markdown
## Rollout Stages

### Stage 1: Internal (0.5%)
- Duration: 24h
- Metrics: Error rate, latency
- Gate: <0.1% error rate

### Stage 2: Canary (5%)
- Duration: 48h
- Metrics: + user engagement
- Gate: No degradation

### Stage 3: Beta (25%)
- Duration: 1 week
- Metrics: + business metrics
- Gate: Positive signal

### Stage 4: GA (100%)
- Monitoring: 2 weeks post-launch
- Rollback: Feature flag ready

## Abort Criteria
- Error rate >1%
- P99 latency >2x baseline
- User complaints spike
```

---

## 🔷 LAYER E — Post-Launch Learning

### Workflows

| Workflow | Purpose | Gate |
|----------|---------|------|
| `/feedback-ingestion` | Turn runtime behavior into backlog | Issues map to code locations |
| behavior-correction | Small tweaks, no redesign | No contract changes |

### Feedback Ingestion Protocol

```markdown
## Feedback Sources

### Automated
- Error logs → Bug issues
- Performance anomalies → Optimization issues
- Feature flag metrics → Enhancement issues

### Manual
- Support tickets → UX issues
- User interviews → Feature requests
- Analytics → Behavior insights

## Issue Creation Rules

Each feedback item becomes:
1. **Categorized issue** in Plane
2. **Linked to source** (log, ticket, metric)
3. **Mapped to code** (file/module reference)
4. **Prioritized** by impact
```

### Behavior Correction Rules

```markdown
## Correction Constraints

**ALLOWED:**
- Copy/text changes
- UI tweaks (colors, spacing)
- Logic adjustments within existing contracts

**NOT ALLOWED:**
- New API endpoints
- Schema changes
- New dependencies

**GATE:** If contract changes needed → new feature workflow
```

---

## 📋 CANONICAL TASK TEMPLATE

Every task in the system uses this format:

```markdown
## Summary
One-sentence description of the change.

## Context
Why this change exists. Link to decision/design wiki if applicable.

## Change Scope
**What is changing**
- Explicit list of files, modules, APIs, or behaviors that WILL change

**What is NOT changing**
- Explicit exclusions to prevent accidental scope creep

## Impact Analysis
**Direct impact**
- Systems, users, or APIs directly affected

**Indirect impact**
- Potential side effects, migrations, compatibility notes

## Implementation Notes
- Constraints, patterns to follow, or rules to respect
- "Do / Don't" bullets if relevant

## Documentation Updates Required
- Files or wiki pages that MUST be updated
- New documentation that must be created (if any)

## Acceptance Criteria
- Bullet-point, testable outcomes
- No vague language

## Verification
How the executor should verify correctness
(e.g. tests to run, endpoints to hit, behaviors to confirm)
```

---

## 🎯 TASK TYPES

| Type | Purpose | Layer |
|------|---------|-------|
| `decision` | Locks scope or direction | A, B |
| `design` | Produces diagrams/specs | B |
| `implementation` | Code changes | C |
| `refactor` | Structure change, no behavior | C |
| `test` | Validation only | C, D |
| `documentation` | Docs-only updates | All |
| `release` | Deployment & safety | D |

---

## 🔌 PLANE INTEGRATION

### Label Mapping

| Task Type | Plane Label | Color |
|-----------|-------------|-------|
| decision | Decision | `#9b59b6` |
| design | Design | `#3498db` |
| implementation | Implementation | `#2ecc71` |
| refactor | Refactor | `#f39c12` |
| test | Test | `#1abc9c` |
| documentation | Documentation | `#95a5a6` |
| release | Release | `#e74c3c` |

### Module Mapping

| Workflow Layer | Plane Module |
|----------------|--------------|
| Layer A (Problem) | "Discovery" |
| Layer B (Solution) | "Design" |
| Layer C (Build) | "Sprint [N]" |
| Layer D (Launch) | "Release" |
| Layer E (Learn) | "Feedback" |

---

## 📊 QUALITY GATES

### Task Quality (6 Questions)

Every task must answer:

1. ✅ What is changing?
2. ✅ Why is it changing?
3. ✅ What is NOT changing?
4. ✅ What is impacted?
5. ✅ What must be documented?
6. ✅ How do we know it's done?

### Workflow Transitions

| From | To | Gate |
|------|----|------|
| problem-framing | wedge-definition | Problem expressible as interface |
| wedge-definition | solution-design | Fits in 1 sprint |
| solution-design | tech-contract | All flows map to components |
| tech-contract | standard-feature | Contracts testable |
| standard-feature | launch-readiness | AC + tests pass |
| launch-readiness | progressive-rollout | Kill switch exists |
| progressive-rollout | feedback-ingestion | Metrics stable |

---

## 🔒 EXECUTION CONTRACT

Execution agents receiving tasks MUST:

```python
def execute_task(task):
    # 1. Read fully
    assert all_six_questions_answered(task)
    
    # 2. Execute only scope
    changes = implement(task.change_scope)
    assert no_out_of_scope_changes(changes, task)
    
    # 3. Update only listed docs
    update_docs(task.documentation_updates)
    
    # 4. Report
    return ExecutionReport(
        what_was_done=changes,
        deviations=any_deviations,
        verification_results=run_verification(task)
    )
    
    # 5. Stop on ambiguity
    if ambiguity_detected:
        escalate_to_task_creator()
```

---

## 🔒 SKILL VERSION

```
Skill: SaaS Workflow Mastery
Version: 1.0.0
Last Updated: 2026-01-21
Compatible Agents: beast-task, beast-pm, beast-architect, beast-dev, beast-qa, beast-plane
```
