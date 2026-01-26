---
description: "Skill-Enhanced Feature Implementation (The '10x Sprint')"
---

# 🚀 SKILL-ENHANCED STANDARD FEATURE

> **TRIGGER:** `/skill-feature`
> **EVOLUTION:** Standard Feature + Skill Injection
> **GOAL:** Ship with 10x precision by leveraging domain-specific skills.
> **MODE:** Sequential with Skill Loading

---

## 🧬 SKILL INJECTION PROTOCOL

Before starting any feature, identify which skills apply:

| Feature Type | Required Skills |
|--------------|-----------------|
| Auth/Security | `zero-trust`, `supabase-mastery` |
| Database work | `supabase-mastery`, `typescript-precision` |
| UI/A11y | `accessibility-wcag`, `next15-patterns` |
| API/Backend | `typescript-precision`, `observability` |
| French Finance | `french-fiscal`, `typescript-precision` |
| AI/LLM | `prompt-engineering`, `zero-trust` |
| Deploy/CI | `cicd-pipelines`, `observability` |

---

## 🚨 PRE-FLIGHT (Enhanced)

// turbo
```bash
# Load anti-patterns
cat _bmad/beast-mode/LEARNINGS.md | head -50

# Verify skills directory exists
ls skills/
```

Before starting, verify:
- [ ] Feature request is clear and specific
- [ ] No active incidents on the codebase
- [ ] `LEARNINGS.md` loaded (anti-patterns)
- [ ] **Relevant skills identified** (see table above)

---

## 🧭 STEP 1: SCOPE LOCK + SKILL SELECTION (5 min)
**Agent:** `@beast-pm`

1. Define User Story: `As a [user], I want [action], so that [outcome]`
2. Write 3-5 Acceptance Criteria (testable)
3. **Identify Domain Skills Required:**
   - Primary Skill: `[skill-name]`
   - Secondary Skills: `[skill-1, skill-2]`

**Output:**
```markdown
## Scope Lock: [Feature Name]

**User Story:** As a [user], I want [action], so that [outcome]

**Acceptance Criteria:**
1. [Criterion 1]
2. [Criterion 2]
3. [Criterion 3]

**Skills Required:**
- Primary: `supabase-mastery` (for RLS policies)
- Secondary: `typescript-precision` (for type safety)

**GO/NO-GO:** [GO]
```

---

## 🎨 STEP 2: PIXEL PERFECT + A11Y SKILL (10 min)
**Agent:** `@beast-ux`
**Skill:** `accessibility-wcag`

1. **Load Skill:**
   ```
   Use the accessibility-wcag skill to verify compliance.
   ```

2. Define component specs with WCAG compliance:
   - Color contrast ≥4.5:1 verified
   - Focus indicators defined
   - Keyboard navigation planned
   - ARIA labels specified

**Output:** Component Specs + A11Y Verification

---

## 🏗️ STEP 3: BLUEPRINT + STACK SKILLS (5 min)
**Agent:** `@beast-architect`
**Skills:** `next15-patterns`, `supabase-mastery`, `typescript-precision`

1. **Load Stack Skills:**
   - View `next15-patterns` for App Router patterns
   - View `supabase-mastery` for database patterns
   - View `typescript-precision` for type patterns

2. Design with skill-informed patterns:
   - Server Actions (not API routes)
   - RLS policies (not app-level auth)
   - Branded types (not string IDs)

**Output:** Technical Approach with skill references

---

## 🔨 STEP 4: SURGICAL BUILD + SKILL PATTERNS (30 min)
**Agent:** `@beast-dev`
**Skills:** As identified in Step 1

**SKILL-ENHANCED DEVELOPMENT:**

1. **Before coding, load primary skill:**
   ```
   View the [primary-skill] SKILL.md for patterns.
   ```

2. **Use skill patterns directly:**
   - Copy RLS templates from `supabase-mastery`
   - Use Server Action patterns from `next15-patterns`
   - Apply branded types from `typescript-precision`

3. **Code with skill-informed patterns (not from scratch)**

**HARD RULES (from LEARNINGS.md + Skills):**
- `<input type="date">` (NO react-day-picker)
- Imports at TOP only
- NO `any` types (use `typescript-precision` patterns)
- RLS on all user tables (from `supabase-mastery`)
- Server Actions for mutations (from `next15-patterns`)

// turbo
```bash
npm run lint && npm run build
```

---

## 🛡️ STEP 5: SECURITY SKILL AUDIT (5 min)
**Agent:** `@beast-sec`
**Skill:** `zero-trust`

**NEW STEP: Security Verification**

1. Load `zero-trust` skill
2. Verify:
   - [ ] getUser() used (not getSession())
   - [ ] Inputs validated with Zod
   - [ ] RLS enabled on affected tables
   - [ ] No secrets in client code
   - [ ] Rate limiting if applicable

**Output:** Security Checklist Pass/Fail

---

## 🧪 STEP 6: DESTRUCTIVE QA + A11Y (15 min)
**Agent:** `@beast-qa`
**Skill:** `accessibility-wcag`

**Standard QA + A11Y Testing:**

1. Edge Cases: null, undefined, "", 10000 chars, emoji
2. Stress: Click button 10x rapidly
3. Mobile: Test on 320px width

**A11Y Skill Verification:**
- [ ] Run axe-core audit
- [ ] Keyboard navigation works
- [ ] Focus indicators visible
- [ ] Color contrast passes
- [ ] Screen reader labels present

// turbo
```bash
npm run test
```

---

## 🎯 STEP 7: ZERO-DEFECT VERIFICATION (MANDATORY)
**Agent:** `@beast-dev`

// turbo
```bash
npm run build && npm run lint && npm run test
```

**Skill-Enhanced Verification:**
```markdown
## ✅ VERIFICATION REPORT

**Build:** ✅ Passed
**Lint:** ✅ Passed
**Tests:** ✅ Passed

**Skill Compliance:**
- [ ] `supabase-mastery`: RLS policies verified
- [ ] `next15-patterns`: Server Actions used correctly
- [ ] `typescript-precision`: No `any` types
- [ ] `zero-trust`: Security audit passed
- [ ] `accessibility-wcag`: A11Y audit passed

**How to Confirm:**
```bash
npm run dev
# Then go to [URL] and [action] to see [result]
```
```

---

## 🏁 STEP 8: SHIP + OBSERVABILITY (5 min)
**Agent:** `@beast-devops`
**Skill:** `observability`, `cicd-pipelines`

1. Janitor Protocol: Remove unused imports, console.logs
2. Verify CI pipeline passes
3. Deploy with observability hooks
4. Monitor error rate for 15 minutes

**Output:** `🚀 SHIPPED: [Feature Name] - Version [X.X.X]`

---

## 📊 SKILL-ENHANCED EXIT CRITERIA

| Check | Standard | Skill-Enhanced |
|-------|----------|----------------|
| Acceptance Criteria met | ✅ | ✅ |
| Build passes | ✅ | ✅ |
| Tests pass | ✅ | ✅ |
| No lint errors | ✅ | ✅ |
| Mobile responsive | ✅ | ✅ |
| LEARNINGS.md respected | ✅ | ✅ |
| **Skill patterns applied** | — | ✅ |
| **Security audit passed** | — | ✅ |
| **A11Y audit passed** | — | ✅ |
| **Type safety verified** | — | ✅ |

---

## 📈 10X IMPROVEMENT

| Metric | Standard | Skill-Enhanced |
|--------|----------|----------------|
| Security bugs | Common | Rare (Zero-Trust skill) |
| A11Y violations | Found in QA | Prevented by design |
| Type errors | Runtime | Compile-time |
| Code patterns | Ad-hoc | Standardized |
| Rework rate | 20% | <5% |
