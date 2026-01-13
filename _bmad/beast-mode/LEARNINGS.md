# 🧬 LEARNINGS.MD — Beast Mode Evolution Log

> **PURPOSE:** This file captures corrections, anti-patterns, and lessons learned during sessions.
> **RULE:** If a rule exists here, it **OVERRIDES** all other training.
> **AUTO-READ:** All Beast Mode agents MUST read this file at session start.

---

## ❌ ANTI-PATTERNS (Things we learned NOT to do)

### 🔒 RULE: No react-day-picker
- **Date:** 2026-01-13
- **Incident:** Installed `react-day-picker` causing version conflicts and bundle bloat.
- **Correction:** **ALWAYS use `<input type="date">` for date selection.**
- **Enforcement:**
  ```
  IF request contains "date picker" OR "date filter":
    USE <input type="date"> 
    DO NOT install react-day-picker, react-datepicker, or similar
  ```

### 🔒 RULE: Imports at top only
- **Date:** 2026-01-13
- **Incident:** Pasted import statements in the middle of a file, breaking syntax.
- **Correction:** **ALWAYS read lines 1-20 before editing. Imports MUST go at the top.**
- **Enforcement:**
  ```
  BEFORE any file edit:
    1. view_file lines 1-30
    2. Identify existing import block
    3. Append new imports to END of import block
    NEVER insert imports inside function bodies
  ```

### 🔒 RULE: Explicit timezone handling
- **Date:** 2026-01-13
- **Incident:** `new Date("2026-01-13")` creates different times in different timezones.
- **Correction:** **ALWAYS append `T00:00:00` to date strings** or use `date-fns`.
- **Enforcement:**
  ```
  BAD:  new Date("2026-01-13")           // Timezone roulette
  GOOD: new Date("2026-01-13T00:00:00")  // Explicit midnight local
  GOOD: parseISO("2026-01-13")           // date-fns (if available)
  ```

### 🔒 RULE: Clean up removed code
- **Date:** 2026-01-13
- **Incident:** Removed a component but left its import, causing build warnings.
- **Correction:** **If you remove code, IMMEDIATELY remove its import.**
- **Enforcement:**
  ```
  AFTER removing component usage:
    1. grep_search for import statement
    2. Remove the import line
    3. Verify no other usages exist
  ```

### 🔒 RULE: No layout.tsx for transitions
- **Date:** 2024-01-10
- **Context:** Next.js 15 App Router
- **Correction:** Use `template.tsx` instead of `layout.tsx` for page transitions.

### 🔒 RULE: No pure black
- **Date:** 2024-01-11
- **Context:** Midnight Luxe theme
- **Correction:** Do not use pure black (#000000); use Obsidian (#020204).

### 🔒 RULE: Zero-Defect Verification
- **Date:** 2026-01-13
- **Incident:** Work delivered as "should work" but contained bugs user had to find.
- **Correction:** **ALL code must be verified BEFORE declaring complete.**
- **Enforcement:**
  ```
  BEFORE saying "done", "complete", or "shipped":
    1. Run: npm run build && npm run lint && npm run test
    2. ALL must exit 0 (pass)
    3. Output a Verification Report with results
    4. If ANY fails → FIX IT before declaring done
    
  NEVER say:
    - "This should work"
    - "Let me know if there are issues"
    - "You may need to..."
    
  ALWAYS say:
    - "Verified working. Build ✅ Lint ✅ Tests ✅"
    - "Here's how to confirm: [command]"
  ```

### 🔒 RULE: No partial delivery
- **Date:** 2026-01-13
- **Incident:** Features delivered incomplete, requiring follow-up to finish.
- **Correction:** **Deliver complete, working code or explicitly state what's blocking.**
- **Enforcement:**
  ```
  IF work cannot be completed:
    1. State EXPLICITLY what is blocking
    2. Do NOT pretend partial work is done
    3. Ask for clarification or additional context
    
  IF work CAN be completed:
    1. Complete it fully
    2. Verify it works
    3. Then declare done
  ```

---

## ✅ ESTABLISHED PATTERNS (Things that worked well)

| Pattern | Tool/Approach | Context |
|---------|---------------|---------|
| Client-side search | Fuse.js | Standard for all search implementations |
| Command Palette | Radix UI Dialog | Required for accessibility |
| Date parsing | `date-fns` with `parseISO` | When date logic is complex |
| Form validation | Zod schemas | All forms, no exceptions |
| Native date inputs | `<input type="date">` | Simple date selection UI |

---

## 📋 TEMPLATE FOR NEW ENTRIES

When adding a new learning, use this format:

```markdown
### 🔒 RULE: [Short descriptive name]
- **Date:** [YYYY-MM-DD]
- **Incident:** [What went wrong]
- **Correction:** [What should have happened]
- **Enforcement:**
  ```
  [Specific, actionable rule in pseudo-code]
  ```
```

---

## 🔄 AUTO-READ PROTOCOL

At the start of every session, Beast Mode agents MUST:
1. Check if this file exists
2. Read all `🔒 RULE` blocks
3. Apply them as **highest priority constraints**
4. If a user request would violate a rule, **VETO** and explain
