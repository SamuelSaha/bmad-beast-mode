# QA Report Template
# File: docs/bmad/{slug}/04-qa-report.md

---
slug: "{slug}"
type: qa-report
status: draft | pass | fail
created: "{date}"
qa: Beast Mode QA
source: "docs/bmad/{slug}/02-technical-spec.md"
---

# ✅ QA Report: {Feature/Bug Title}

## 1. Test Summary

| Category | Total | Pass | Fail | Blocked |
|----------|-------|------|------|---------|
| Happy Path | ... | ... | ... | ... |
| Edge Cases | ... | ... | ... | ... |
| Regression | ... | ... | ... | ... |

**Overall Status:** 🟢 PASS / 🔴 FAIL / 🟡 BLOCKED

## 2. Test Scenarios

### Happy Path
| ID | Scenario | Expected | Actual | Status |
|----|----------|----------|--------|--------|
| HP-01 | ... | ... | ... | ✅/❌ |

### Edge Cases
| ID | Scenario | Expected | Actual | Status |
|----|----------|----------|--------|--------|
| EC-01 | ... | ... | ... | ✅/❌ |

### Regression
| ID | Related Feature | Status |
|----|-----------------|--------|
| RG-01 | ... | ✅/❌ |

## 3. Issues Found

### Critical (Blocker)
- 🔴 **[ISSUE-001]**: Description...

### Major
- 🟠 **[ISSUE-002]**: Description...

### Minor
- 🟡 **[ISSUE-003]**: Description...

## 4. Acceptance Criteria Verification
<!-- From the spec -->
| Criterion | Met? |
|-----------|------|
| ... | ✅/❌ |

## 5. Performance Check
| Metric | Target | Actual | Pass? |
|--------|--------|--------|-------|
| Load time | < 2s | ... | ✅/❌ |

## 6. Browser/Device Testing
| Environment | Status |
|-------------|--------|
| Chrome (Latest) | ✅/❌ |
| Firefox (Latest) | ✅/❌ |
| Safari (Latest) | ✅/❌ |
| Mobile iOS | ✅/❌ |
| Mobile Android | ✅/❌ |

## 7. Recommendation
<!-- Ship / Fix Required / Block -->

---
**Gate Check:** [ ] All P0 tests pass [ ] No critical issues [ ] Regression clear
