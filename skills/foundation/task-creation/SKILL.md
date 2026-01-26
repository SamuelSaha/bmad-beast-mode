---
name: Task Creation Mastery
description: Transform intent into executable, auditable work items with the 6-question protocol
version: 1.0.0
primary_agents: [beast-task, beast-pm, beast-plane]
---

# 📋 Task Creation Mastery Skill

> **ACTIVATION:** Task creation is architecture. Task execution is mechanical.

---

## 🎯 The Golden Rule

```
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║   Task = mini-spec                                              ║
║   Spec = executable truth                                       ║
║   Agents execute truth, not ideas                               ║
║                                                                  ║
║   If your task creator is excellent,                            ║
║   execution becomes boring — and that's success.                ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
```

---

## ❓ The 6 Questions (Non-Negotiable)

Every task MUST answer these questions. If any is missing, the task is **invalid**.

| # | Question | Section |
|---|----------|---------|
| 1 | What is changing? | Change Scope |
| 2 | Why is it changing? | Context |
| 3 | What is NOT changing? | Change Scope (exclusions) |
| 4 | What is impacted? | Impact Analysis |
| 5 | What must be documented? | Documentation Updates |
| 6 | How do we know it's done? | Acceptance Criteria + Verification |

---

## 📝 Canonical Task Template

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
- [ ] Bullet-point, testable outcomes
- [ ] No vague language
- [ ] Each criterion is independently verifiable

## 🔐 Security Considerations
- **Input Validation:** [How are user inputs validated?]
- **Authorization:** [Who can access? Least privilege enforced?]
- **Data Handling:** [PII treatment? Encryption? Retention?]
- **Audit Trail:** [What security events are logged?]

## Verification
How the executor should verify correctness:
- Tests to run
- Endpoints to hit
- Behaviors to confirm
- Security smoke test (auth bypass, injection attempts)
```

---

## 🏷️ Task Types

Only these 8 types exist. Each task has **one type only**.

| Type | Purpose | Typical Layer |
|------|---------|---------------|
| `decision` | Locks scope or direction | A, B |
| `design` | Produces diagrams/specs | B |
| `implementation` | Code changes | C |
| `refactor` | Structure change, no behavior change | C |
| `test` | Validation only | C, D |
| `documentation` | Docs-only updates | All |
| `release` | Deployment & safety | D |
| `prompt` | AI prompt engineering (non-deterministic) | C |

---

## 🤖 AI-Specific Task Management

### Kanban > Scrum for AI Work

Traditional Scrum fails for AI development because work is **exploratory**:
- A 2-hour task may take 2 days if the model hallucinates
- Estimates are unreliable when behavior is probabilistic

**Use Kanban board stages:**
```
Backlog → Prompt Design → Evaluation → Integration → Done
```

**WIP Limits:** Max 1-2 AI tasks per engineer (cognitive intensity)

### The `prompt` Task Type

AI prompts require special handling:

```markdown
## Summary
Optimize summarization prompt for contract analysis.

## Change Scope
**What is changing**
- `prompts/contract_summarizer.md`: System prompt
- `config/models.yaml`: Temperature setting

**What is NOT changing**
- Retrieval pipeline
- Output format schema

## Acceptance Criteria
- [ ] Faithfulness > 0.90 on Golden Dataset
- [ ] Hallucination rate < 5%
- [ ] Avg tokens < 500 per response

## Verification
Run: `python evaluate.py --dataset golden_dataset/contracts/`
```

### Golden Dataset Requirement

Every AI feature MUST have a Golden Dataset before going live:
- Minimum 50 test cases
- Includes: happy path, edge cases, adversarial inputs
- Human-verified expected outputs

### Type Rules

```python
TASK_TYPE_RULES = {
    "decision": {
        "outputs": ["decision_record", "scope_confirmation"],
        "no_code_changes": True
    },
    "design": {
        "outputs": ["diagrams", "specs", "contracts"],
        "no_code_changes": True
    },
    "implementation": {
        "outputs": ["code", "tests"],
        "requires": ["acceptance_criteria"]
    },
    "refactor": {
        "outputs": ["code"],
        "requires": ["behavior_parity_proof", "what_not_changing"],
        "forbidden": ["new_behavior"]
    },
    "test": {
        "outputs": ["test_files", "coverage_report"],
        "no_production_changes": True
    },
    "documentation": {
        "outputs": ["doc_files"],
        "no_code_changes": True
    },
    "release": {
        "outputs": ["deployment", "rollback_confirmation"],
        "requires": ["launch_checklist"]
    }
}
```

---

## 🔄 Workflow → Task Decomposition

### `/standard-feature`

Emits exactly:
1. **Implementation task** (core change)
2. **Test task** (validation)
3. **Documentation task** (if public-facing)

### `/skill-feature` or `/10x-feature`

Emits:
1. **Design task** (if arch impact)
2. **Risk review task** (decision type)
3. **Implementation task(s)**
4. **Test task**
5. **Documentation task**

**Mandatory:** Impact Analysis section is detailed.

### `/smart-refactor`

Enforces:
- "What is NOT changing" is **mandatory and detailed**
- Verification includes **behavior parity check**
- **Refactor log** documentation required

### `/epic-feature`

Decomposes into phases:
1. Each phase independently shippable
2. Dependencies explicit
3. Rollback points defined per phase

---

## ❌ Anti-Patterns

| Bad Pattern | Why It Fails | Correct Approach |
|-------------|--------------|------------------|
| "Update docs accordingly" | Vague, unverifiable | "Update `auth.md` section 3.2 to reflect JWT expiry change from 60m → 15m" |
| "Fix the login bug" | No scope, no verification | Full template with root cause analysis |
| "Refactor for performance" | No behavior parity defined | Explicit "behavior unchanged" section with proof |
| "Implement auth" | Too broad | Decompose into 5-7 specific tasks |
| Missing exclusions | Scope creep guaranteed | Always include "What is NOT changing" |
| "Should work" | Unverifiable | Explicit verification steps |

---

## ✅ Task Quality Checklist

Before emitting any task:

```markdown
## Task Quality Gate

- [ ] **Completeness:** All 6 questions answered
- [ ] **Specificity:** No vague language ("accordingly", "as needed")
- [ ] **Atomicity:** Single responsibility, one type
- [ ] **Testability:** Every AC is independently verifiable
- [ ] **Documentation:** Doc updates are explicit with file paths
- [ ] **Scope:** "What is NOT changing" is present
- [ ] **Verification:** Concrete steps, not "verify it works"
```

---

## 📊 Task Sizing

| Size | Characteristics | Max Scope |
|------|-----------------|-----------|
| **XS** | Single file, no dependencies | 1 file, <50 lines |
| **S** | Single module, clear boundary | 2-3 files, <200 lines |
| **M** | Cross-module, defined interface | 4-6 files, <500 lines |
| **L** | System-level, multiple concerns | Should decompose further |
| **XL** | Epic-scale | MUST decompose into S/M tasks |

**Rule:** If a task is L or XL, decompose it.

---

## 🔌 Plane Integration

### Field Mapping

| Template Section | Plane Field |
|------------------|-------------|
| Summary | Title |
| Type | Label (decision/design/implementation/etc.) |
| Context + Change Scope + Impact | Description |
| Priority (derived) | Priority (1=urgent, 2=high, 3=medium, 4=low) |
| Acceptance Criteria | Description (checklist format) |
| Verification | Description (final section) |

### CLI Pattern

```bash
python3 plane_client.py -w samsam create_issue \
  -p PROJECT_NAME \
  -t "TASK_TYPE: Summary" \
  -d "FULL_TEMPLATE_AS_HTML" \
  --priority PRIORITY \
  --state "Todo" \
  --labels "TASK_TYPE"
```

### Description HTML Template

```html
<h2>Context</h2>
<p>{{context}}</p>

<h2>Change Scope</h2>
<h3>What is changing</h3>
<ul>
  <li>{{change_item}}</li>
</ul>
<h3>What is NOT changing</h3>
<ul>
  <li>{{exclusion_item}}</li>
</ul>

<h2>Impact Analysis</h2>
<p><strong>Direct:</strong> {{direct_impact}}</p>
<p><strong>Indirect:</strong> {{indirect_impact}}</p>

<h2>Documentation Updates</h2>
<ul>
  <li>{{doc_update}}</li>
</ul>

<h2>Acceptance Criteria</h2>
<ul>
  <li>[ ] {{criterion}}</li>
</ul>

<h2>Verification</h2>
<p>{{verification_steps}}</p>
```

---

## 🤝 Execution Contract

Agents receiving tasks MUST follow:

```
1. READ task fully before starting
2. EXECUTE only what's in Change Scope
3. UPDATE only listed documentation
4. REPORT:
   - What was done
   - Deviations (if any)
   - Verification results
5. STOP if ambiguity detected → escalate to task creator

NEVER reinterpret intent.
NEVER expand scope.
NEVER skip documentation.
```

---

## 📈 Task Creation Protocol

```
STEP 1: CONTEXT EXTRACTION
├── What is the user trying to achieve?
├── What constraints exist?
└── What decisions have already been made?

STEP 2: SCOPE BOUNDARY
├── Define what IS in scope (explicit files/modules)
├── Define what is NOT in scope (explicit exclusions)
└── Identify edge cases

STEP 3: IMPACT ANALYSIS
├── Direct: What systems are touched?
├── Indirect: What might break?
└── Dependencies: What must exist first?

STEP 4: DECOMPOSITION
├── Break into atomic tasks
├── Assign task types
└── Order by dependency

STEP 5: VERIFICATION DESIGN
├── How do we know each task is done?
├── What tests confirm behavior?
└── What must be manually verified?

STEP 6: DOCUMENTATION MAPPING
├── What docs must update?
├── What new docs are needed?
└── Who owns documentation?
```

---

## 🔒 SKILL VERSION

```
Skill: Task Creation Mastery
Version: 1.0.0
Last Updated: 2026-01-21
Compatible Agents: beast-task, beast-pm, beast-plane
```
