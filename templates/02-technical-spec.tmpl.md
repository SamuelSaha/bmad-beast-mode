# Technical Specification Template
# File: docs/bmad/{slug}/02-technical-spec.md

---
slug: "{slug}"
type: technical-spec
status: draft | approved
created: "{date}"
architect: Beast Mode Architect
source: "docs/bmad/{slug}/01-analysis.md"
---

# 🏗️ Technical Spec: {Feature/Bug Title}

## 1. Overview
<!-- One paragraph summary of the technical approach -->

## 2. Scope Boundaries

### ✅ IN SCOPE
<!-- What files/components/modules will be changed -->
| File | Change Type | Description |
|------|-------------|-------------|
| `src/...` | Modify | ... |

### ⛔ OUT OF SCOPE
<!-- What will NOT be touched -->
- No changes to: ...
- No refactoring of: ...

## 3. Constraints

### Hard Constraints
- ⛔ **ZERO** new `package.json` dependencies
- ⛔ **NO** changes outside listed files
- ⛔ **NO** breaking API changes

### Soft Constraints
- Prefer existing patterns over new abstractions
- Minimize test changes

## 4. Technical Design

### Data Structures
```typescript
// New or modified types
interface Example {
  field: string;
}
```

### API Changes
```
// If API endpoints affected
[METHOD] /api/path
Request: { ... }
Response: { ... }
```

### State Management
<!-- How state flows, if applicable -->

### Database Changes
<!-- Schema changes, migrations -->
```sql
-- Migration up
-- Migration down
```

## 5. Implementation Checklist
<!-- Ordered steps for the Developer -->
- [ ] Step 1: ...
- [ ] Step 2: ...
- [ ] Step 3: ...

## 6. Test Requirements
<!-- What must be tested? -->
- [ ] Unit tests for: ...
- [ ] Integration tests for: ...
- [ ] Edge cases: ...

## 7. Rollback Plan
<!-- How to undo if things go wrong -->

---
**Gate Check:** [ ] No new deps [ ] Scope limited [ ] Tests defined [ ] Rollback documented
