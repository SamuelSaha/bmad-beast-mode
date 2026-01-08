# Analysis Report Template
# File: docs/bmad/{slug}/01-analysis.md

---
slug: "{slug}"
type: analysis
status: draft | approved
created: "{date}"
analyst: Beast Mode Analyst
---

# 🔍 Analysis: {Feature/Bug Title}

## 1. Problem Statement
<!-- What is broken or missing? -->

### Current Behavior
<!-- What happens now? Be specific. -->

### Expected Behavior
<!-- What should happen? -->

### Evidence
<!-- Console errors, screenshots, user reports -->
```
[Paste error logs here]
```

## 2. Root Cause Analysis

### Likely Component
- [ ] Frontend (UI/State)
- [ ] Backend (API/Logic)
- [ ] Database (Schema/Query)
- [ ] Infrastructure (Config/Deploy)
- [ ] Third-party (External service)

### Root Cause Hypothesis
<!-- What do you think is causing this? -->

### Code Anchors
<!-- Files and functions that are likely involved -->
| File | Function/Component | Relevance |
|------|-------------------|-----------|
| `src/...` | `functionName()` | Primary suspect |

## 3. Impact Assessment

### Affected Users
<!-- Who is impacted? All users? Specific segment? -->

### Severity
- [ ] 🔴 Critical (Production down, data loss)
- [ ] 🟠 High (Major feature broken)
- [ ] 🟡 Medium (Feature degraded)
- [ ] 🟢 Low (Minor inconvenience)

### Dependencies
<!-- What else might this affect? -->

## 4. Success Criteria
<!-- How do we know this is fixed? Binary, testable. -->
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## 5. Recommended Next Step
<!-- Which workflow? Quick Fix or Standard Feature? -->

---
**Gate Check:** [ ] All sections complete [ ] Evidence attached [ ] Root cause identified
