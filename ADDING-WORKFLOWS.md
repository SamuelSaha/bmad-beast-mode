# Adding New Workflows to Beast Mode

This guide explains exactly how to create and register new workflows in your Beast Mode custom module.

---

## 📁 Workflow File Location

All workflows live in the `workflows/` folder:

```
workflows/
├── quick-fix.yaml           # 15-min bug fixes
├── micro-fix.yaml           # 30-min small changes
├── standard-feature.yaml    # Normal features
├── enterprise-feature.yaml  # Large features
├── ai-feature.yaml          # AI/LLM features
├── brainstorm.yaml          # Divergent ideation
└── brownfield-discovery.yaml # Legacy codebase mapping
```

---

## 🛠️ Step-by-Step: Creating a New Workflow

### Step 1: Create the File

```bash
cd ~/Library/BMAD/modules/bmad-beast-mode
touch workflows/my-workflow.yaml
```

### Step 2: Write the Workflow Definition

Use this template:

```yaml
# Workflow: My Workflow
# Purpose: Brief description of what this workflow accomplishes

name: my-workflow
description: "One sentence describing this workflow's purpose"
version: "1.0.0"

# When to use this workflow
triggers:
  - "User says: 'I need to...'"
  - "Ticket type: specific type"
  - "Context includes: keyword"

# Time estimate
estimated_duration: "30-60 minutes"

# ============================================================================
# PHASES
# ============================================================================
phases:
  # Phase 1: Analysis
  - name: analysis
    description: "Understand the problem"
    agent: analyst
    command: "*analyze-problem"
    inputs:
      - "Context Fuel from user"
    outputs:
      - path: "_bmad-output/planning-artifacts/01-analysis.md"
        description: "Root cause analysis"
    gate:
      - "Root cause identified"
      - "Reproduction steps documented"
    
  # Phase 2: Design (optional)
  - name: design
    description: "Plan the solution"
    agent: architect
    command: "*define-contract"
    inputs:
      - "_bmad-output/planning-artifacts/01-analysis.md"
    outputs:
      - path: "_bmad-output/planning-artifacts/02-technical-spec.md"
        description: "Technical specification"
    gate:
      - "Interfaces defined"
      - "No new dependencies without approval"
    condition: "skip_if: quick_fix == true"
    
  # Phase 3: Implementation
  - name: implementation
    description: "Write the code"
    agent: dev
    command: "*implement-fix"
    inputs:
      - "_bmad-output/planning-artifacts/02-technical-spec.md"
    outputs:
      - path: "_bmad-output/implementation-artifacts/03-implementation.md"
        description: "Implementation notes"
    gate:
      - "Tests passing"
      - "Self-review complete"
    
  # Phase 4: Review
  - name: review
    description: "Validate the work"
    agent: qa
    command: "*review-feature"
    inputs:
      - "_bmad-output/implementation-artifacts/03-implementation.md"
    outputs:
      - path: "_bmad-output/implementation-artifacts/04-qa-report.md"
        description: "QA validation report"
    gate:
      - "All acceptance criteria met"
      - "No regressions"

# ============================================================================
# OPTIONAL PHASES (conditional)
# ============================================================================
optional_phases:
  security:
    description: "Security review if high-risk"
    condition: "risk_level >= high"
    phases:
      - name: threat-model
        agent: sec-ops
        command: "*threat-model"
        outputs:
          - path: "_bmad-output/planning-artifacts/sec-01-threat-model.md"
      
      - name: pentest
        agent: pentester
        command: "*pentest-plan"
        outputs:
          - path: "_bmad-output/planning-artifacts/sec-02-pentest-plan.md"

# ============================================================================
# EXIT CRITERIA
# ============================================================================
success_criteria:
  - "All gate checks passed"
  - "All outputs created"
  - "No blocking issues"

# ============================================================================
# ROLLBACK
# ============================================================================
rollback:
  on_failure: "Return to previous phase"
  escalation: "After 2 failures, escalate to Party Mode"
```

### Step 3: Register in module.yaml

Open `module.yaml` and add your workflow to the `exports.workflows` section:

```yaml
exports:
  workflows:
    # ... existing workflows ...
    
    # Add your new workflow
    my-workflow: workflows/my-workflow.yaml
```

### Step 4: Sync to Global Library

```bash
cp -r ~/Desktop/BMAD-METHOD-SAMSAM/bmad-beast-mode/* ~/Library/BMAD/modules/bmad-beast-mode/
```

### Step 5: Install to Your Project

```bash
cd ~/Desktop/your-project

# Option A: Full reinstall
npx bmad-method@alpha install

# Option B: Manual copy
cp ~/Library/BMAD/modules/bmad-beast-mode/workflows/* _bmad/beast-mode/workflows/
cp ~/Library/BMAD/modules/bmad-beast-mode/module.yaml _bmad/beast-mode/
```

### Step 6: Run Your Workflow

```bash
npx bmad session

# Check available workflows
> *menu

# Run your workflow
> *my-workflow
```

---

## 📋 Workflow Types

### Linear Workflow
Phases execute in strict order.

```yaml
phases:
  - name: step1
    agent: analyst
  - name: step2
    agent: architect
  - name: step3
    agent: dev
```

### Conditional Workflow
Some phases only run if conditions are met.

```yaml
phases:
  - name: analysis
    agent: analyst
    
  - name: security-review
    agent: sec-ops
    condition: "security_critical == true"
    
  - name: implementation
    agent: dev
```

### Parallel Workflow
Multiple agents work simultaneously (requires Party Mode).

```yaml
phases:
  - name: parallel-review
    parallel: true
    agents:
      - sec-ops: "*threat-model"
      - a11y: "*accessibility-audit"
      - perf: "*performance-review"
```

---

## 🎯 Workflow Design Principles

### 1. Define Clear Gates
Every phase should have exit criteria.

```yaml
- name: analysis
  gate:
    - "Root cause identified"
    - "Evidence documented"
    - "Approved by lead"
```

### 2. Specify Inputs and Outputs
Each phase knows what it needs and what it produces.

```yaml
- name: implementation
  inputs:
    - "_bmad-output/planning-artifacts/02-technical-spec.md"
  outputs:
    - path: "_bmad-output/implementation-artifacts/03-implementation.md"
```

### 3. Include Fallbacks
What happens if a phase fails?

```yaml
rollback:
  on_failure: "Return to previous phase with feedback"
  max_retries: 2
  escalation: "Party Mode for multi-agent discussion"
```

### 4. Time-Box Phases
Prevent scope creep with time limits.

```yaml
- name: analysis
  time_limit: "15 minutes"
  
- name: implementation
  time_limit: "2 hours"
```

---

## 📊 Example Workflows

### Minimal: Quick Fix

```yaml
name: quick-fix
description: "15-minute bug fix"
estimated_duration: "15 minutes"

phases:
  - name: diagnose
    agent: analyst
    command: "*quick-diagnose"
    time_limit: "5 minutes"
    
  - name: fix
    agent: dev
    command: "*quick-fix"
    time_limit: "10 minutes"
```

### Standard: Feature Development

```yaml
name: standard-feature
description: "Normal feature with full process"
estimated_duration: "2-4 hours"

phases:
  - name: analysis
    agent: analyst
    command: "*analyze-problem"
    
  - name: prd
    agent: pm
    command: "*create-prd"
    
  - name: architecture
    agent: architect
    command: "*define-contract"
    
  - name: ux
    agent: ux-designer
    command: "*define-ux"
    condition: "has_ui == true"
    
  - name: implementation
    agent: dev
    command: "*implement-fix"
    
  - name: review
    agent: qa
    command: "*review-feature"
```

### Complex: Enterprise Feature

```yaml
name: enterprise-feature
description: "Large feature with security and compliance"
estimated_duration: "1-2 days"

phases:
  - name: brainstorm
    agent: brainstormer
    command: "*brainstorm"
    
  - name: analysis
    agent: analyst
    command: "*analyze-problem"
    
  - name: prd
    agent: pm
    command: "*create-prd"
    
  - name: architecture
    agent: architect
    command: "*define-contract"
    
  - name: security
    agent: sec-ops
    command: "*threat-model"
    
  - name: privacy
    agent: dpo
    command: "*privacy-impact"
    condition: "has_pii == true"
    
  - name: implementation
    agent: dev
    command: "*implement-fix"
    
  - name: security-test
    agent: pentester
    command: "*security-scan"
    
  - name: review
    agent: qa
    command: "*review-feature"
```

---

## 🔄 Modifying Existing Workflows

### Don't Edit Inside `_bmad/`

```bash
# ❌ WRONG
vim ~/Desktop/my-project/_bmad/beast-mode/workflows/quick-fix.yaml

# ✅ CORRECT
vim ~/Library/BMAD/modules/bmad-beast-mode/workflows/quick-fix.yaml
# Then reinstall
```

### Adding a Phase to Existing Workflow

1. Open the source file
2. Add your phase in the `phases` list
3. Reinstall to project

---

## 📋 Workflow Quality Checklist

Before adding a workflow:

- [ ] **Clear Purpose:** One sentence describes the use case
- [ ] **Defined Triggers:** When to use this workflow
- [ ] **All Phases Have Gates:** Exit criteria for each phase
- [ ] **Inputs/Outputs Specified:** File paths are explicit
- [ ] **Time Estimates:** Each phase has a time limit
- [ ] **Registered:** Added to module.yaml exports
- [ ] **Tested:** Run once to verify flow

---

## 🆘 Troubleshooting

### Workflow not appearing in menu
1. Check file exists: `ls ~/Library/BMAD/modules/bmad-beast-mode/workflows/my-workflow.yaml`
2. Check module.yaml has the export
3. Reinstall: `npx bmad-method@alpha install`

### "Missing input file" error
The previous phase didn't create the expected output.
1. Check the `outputs.path` of the previous phase
2. Verify the file was actually created
3. Manually create stub file if needed

### Workflow gets stuck
1. Check the `gate` conditions
2. Verify the agent completed its work
3. Use `*workflow-status` to see current state
