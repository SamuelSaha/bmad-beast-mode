---
description: Tech Contract - Freeze interfaces before coding (Layer B)
---

# 📜 Tech Contract Workflow

> **Purpose:** Freeze interfaces before coding. Contracts are testable without implementation.

---

## 🚦 Pre-Flight Check

- [ ] Solution design complete
- [ ] User flows mapped to components
- [ ] Data ownership defined

**Required Input:** `/discovery-protocol` (solution-design) output

---

## 📋 Workflow Steps

### Step 1: Load Solution Context
**Agent:** `@beast-architect` (MATRIX)

Review the solution design:
- User flows
- System responsibilities
- Data ownership
- Failure modes

**Skill:** `saas-workflows`

### Step 2: API Contract Definition
**Agent:** `@beast-architect` (MATRIX)

Define all API contracts:

```typescript
// Template for each endpoint
interface EndpointContract {
  method: 'GET' | 'POST' | 'PUT' | 'PATCH' | 'DELETE';
  path: string;
  request: TypeDefinition;
  response: TypeDefinition;
  errors: ErrorCode[];
  auth: 'none' | 'required' | 'optional';
}
```

**Output:** TypeScript interfaces for all endpoints

### Step 3: Schema Definition
**Agent:** `@beast-architect` (MATRIX)

Define database changes:

```sql
-- For each new table or change
-- Include: CREATE, ALTER, constraints, indexes
-- Document: migration strategy, reversibility
```

**Skill:** `supabase-mastery` (if Supabase)

**Output:** Migration SQL with rollback scripts

### Step 4: Event Definition
**Agent:** `@beast-architect` (MATRIX)

Define system events:

```typescript
interface EventContract {
  name: string;           // e.g., 'user.logged_in'
  payload: TypeDefinition;
  producer: string;       // Component that emits
  consumers: string[];    // Components that listen
  idempotency: boolean;   // Can be safely replayed?
}
```

**Output:** Event catalog

### Step 5: Product Validation
**Agent:** `@beast-pm` (VANTAGE)

Product team validates:
- Do contracts support all user flows?
- Are error states user-friendly?
- Is the data model understandable?

**Gate:** Product sign-off

### Step 6: Contract Testability
**Agent:** `@beast-qa` (HUNTER)

Verify contracts are testable:
- Types compile without implementation
- Error cases are enumerated
- Migrations are reversible

**Skill:** `typescript-precision`

**Gate:** ✅ Contract compiles and validates OR 🚫 Revision needed

---

## 📤 Deliverable

```markdown
# Tech Contract: [Feature Name]

## Solution Reference
[Link to solution-design]

## API Contracts

### Endpoint: POST /api/[resource]

**Request:**
```typescript
interface CreateResourceRequest {
  field: string;
}
```

**Response:**
```typescript
interface CreateResourceResponse {
  id: string;
  createdAt: string;
}
```

**Errors:**
| Code | Meaning |
|------|---------|
| 400 | Validation failed |
| 401 | Unauthorized |
| 409 | Conflict |

---

## Schema Changes

```sql
-- Migration: 20260121_add_resource_table.sql
CREATE TABLE resources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Rollback
-- DROP TABLE resources;
```

---

## Events

| Event | Payload | Producer | Consumers |
|-------|---------|----------|-----------|
| resource.created | `{id, name}` | api | analytics, notifications |

---

## Validation

- [ ] Types compile: `tsc --noEmit`
- [ ] Migrations reversible: rollback tested
- [ ] Error codes documented
- [ ] Product sign-off: ✅
```

---

## 🚪 Exit Gate

**Ready for implementation when:**
- [ ] All endpoints typed
- [ ] All schemas defined with rollback
- [ ] Events documented
- [ ] Product signed off
- [ ] Types compile cleanly

**Next:** `/standard-feature` or `/skill-feature`
