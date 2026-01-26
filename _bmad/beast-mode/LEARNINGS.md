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

### 🔒 RULE: Mandatory Workflow Usage
- **Date:** 2026-01-22
- **Incident:** Workflows like `/standard-feature`, `/quick-fix` not used despite being defined.
- **Correction:** **ALWAYS invoke the appropriate workflow for each task type.**
- **Enforcement:**
  ```
  TASK TYPE ROUTING:
    Bug report / Error fix → /quick-fix
    Single feature (< 1 day) → /standard-feature
    Feature with skills → /skill-feature
    Multi-day feature → /epic-feature
    Refactoring → /smart-refactor
    
  NEVER start coding without explicitly stating:
    "Using /[workflow-name] for this task"
  ```

### 🔒 RULE: User Journey Verification
- **Date:** 2026-01-22
- **Incident:** Implemented Results Page but missed broken navigation (sidebar missing).
- **Correction:** **ALWAYS verify the full user journey after implementing UI components.**
- **Enforcement:**
  ```
  AFTER implementing ANY UI component:
    1. Identify the user's entry point (homepage, deeplink, etc.)
    2. Trace the FULL navigation path to the new component
    3. Verify ALL intermediate layouts and sidebars render
    4. Only declare done after confirming E2E journey works
    
  CHECKLIST for Navigation-Adjacent Features:
    [ ] Does feature touch layout? → Verify parent layouts
    [ ] Does feature add routes? → Verify sidebar/nav links
    [ ] Does feature show data? → Verify data loads on navigation
  ```

### 🔒 RULE: ID Consistency Check
- **Date:** 2026-01-22
- **Incident:** `applyPivot` targeted IDs like `kyoto-stay`, but `templates.ts` used `stay2`.
- **Correction:** **ALWAYS cross-reference IDs between state logic and data sources.**
- **Enforcement:**
  ```
  BEFORE implementing ANY state logic that references IDs:
    1. grep_search for the ID in data files (templates, mocks, fixtures)
    2. Verify EXACT string match between:
       - State/store actions
       - Data source definitions
       - Component references
    3. If IDs don't exist in source → CREATE them or ASK for clarification
    
  PATTERN:
    Data Flow: API/Template → Store → Component
    ID Trace: Source of truth → Consumers → UI
  ```

### 🔒 RULE: Single Verification Pass
- **Date:** 2026-01-22
- **Incident:** Same feature verified 3+ times with browser subagent, wasting ~5 min each.
- **Correction:** **ONE comprehensive browser verification per feature, then move on.**
- **Enforcement:**
  ```
  VERIFICATION BUDGET:
    - 1 browser verification for initial implementation
    - 1 additional ONLY if fix was applied
    - MAX 2 per feature
    
  VERIFICATION STRUCTURE (single pass):
    1. Navigate to feature entry point
    2. Test happy path
    3. Test 1-2 edge cases
    4. Capture screenshot for evidence
    5. DONE - move to next task
    
  ANTI-PATTERN (DO NOT):
    - "Let me verify again just to be sure"
    - "Re-checking the pivot functionality"
    - Multiple subagent calls for same screen
  ```

### 🔒 RULE: Plane Issue Sync
- **Date:** 2026-01-22
- **Incident:** Listed Plane issues but never updated status after completing work.
- **Correction:** **UPDATE Plane issue state immediately after completing work.**
- **Enforcement:**
  ```
  AFTER completing work related to a Plane issue:
    1. Identify the Plane issue ID from task context
    2. Run: plane_client.py update_issue --state <completed_state_id>
    3. Add completion comment if significant
    
  LIFECYCLE:
    Start work → Mark issue "In Progress"
    Complete work → Mark issue "Done" 
    Blocked → Mark issue "Backlog" + comment reason
    
  NO ORPHAN WORK: Every deliverable traces to an issue
  ```

### 🔒 RULE: Concise Responses
- **Date:** 2026-01-22
- **Incident:** Explanations 2-3x longer than necessary. Completion messages 15 lines instead of 3.
- **Correction:** **Lead with outcome. Add detail only if asked.**
- **Enforcement:**
  ```
  RESPONSE TEMPLATE:
    ✅ [Feature/Fix] implemented.
    - [1 key change]
    - [1 verification result]
    - [Link/command to confirm]
    
  MAX LENGTHS:
    - Completion message: 100 words
    - Explanation: 200 words
    - Only expand if USER asks "why" or "explain"
    
  BANNED PHRASES:
    - "To summarize what we've done..."
    - "Here's a comprehensive overview..."
    - Repeating code that was just shown
  ```

### 🔒 RULE: Task Boundary Discipline
- **Date:** 2026-01-22
- **Incident:** 23+ tool calls without setting task boundaries.
- **Correction:** **Set task boundary BEFORE any sequence >3 tool calls.**
- **Enforcement:**
  ```
  RULE: If next work requires >3 tools → Set boundary FIRST
  
  BOUNDARY TRIGGERS:
    - Starting new feature implementation
    - Switching from planning to coding
    - Beginning verification phase
    - Changing to different file/component area
    
  PATTERN:
    1. task_boundary (set context)
    2. [work tools: view_file, grep, edit, etc.]
    3. task_boundary (update progress) every ~5 tools
  ```

### 🔒 RULE: Test Infrastructure Discovery
- **Date:** 2026-01-22
- **Incident:** Claimed "build passes" without checking if project has tests.
- **Correction:** **ALWAYS verify test infrastructure exists before claiming test status.**
- **Enforcement:**
  ```
  BEFORE claiming "Tests ✅":
    1. find_by_name for: jest.config.*, vitest.config.*, __tests__, *.test.*, *.spec.*
    2. Check package.json for test script
    3. If tests exist → Run them
    4. If NO tests → State "No test suite configured" (not "Tests ✅")
    
  NEVER assume tests pass if you haven't run them
  ```

### 🔒 RULE: Skill Injection Before Complex Work
- **Date:** 2026-01-22
- **Incident:** Had skills like `next15-patterns` but never loaded them. Missed layout patterns.
- **Correction:** **ALWAYS load relevant skill SKILL.md before complex domain work.**
- **Enforcement:**
  ```
  SKILL TRIGGER CONDITIONS:
    - Supabase/RLS → view_file skills/foundation/supabase-mastery/SKILL.md
    - Next.js patterns → view_file skills/foundation/next15-patterns/SKILL.md
    - Security → view_file skills/security/zero-trust/SKILL.md
    - French tax → view_file skills/growth/french-fiscal/SKILL.md
    
  PATTERN:
    1. Identify domain of task
    2. Check if matching skill exists
    3. view_file the SKILL.md BEFORE implementation
    4. Apply skill patterns during work
  ```

### 🔒 RULE: Spec Reference During Implementation
- **Date:** 2026-01-22
- **Incident:** Created RFC-002 and EPIC-BRIEF but never referenced them while coding.
- **Correction:** **RE-READ specs during implementation to verify alignment.**
- **Enforcement:**
  ```
  IF RFC, PRD, or EPIC-BRIEF exists for current work:
    1. view_file the spec at implementation START
    2. Cross-check deliverables against spec acceptance criteria
    3. Reference spec when making design decisions
    
  CHECKPOINT MOMENTS:
    - Before starting each major component
    - When uncertain about requirements
    - Before declaring feature complete
    
  ANTI-PATTERN: Writing spec → Forgetting spec → Shipping different thing
  ```

### 🔒 RULE: Context Window Efficiency
- **Date:** 2026-01-22
- **Incident:** Viewed full files multiple times instead of using view_code_item.
- **Correction:** **Use targeted tools to minimize context waste.**
- **Enforcement:**
  ```
  TOOL SELECTION HIERARCHY:
    - Need specific function/class → view_code_item (FIRST CHOICE)
    - Need file structure → view_file_outline
    - Need pattern search → grep_search
    - Need full file → view_file (LAST RESORT)
    
  ANTI-PATTERNS:
    - Viewing same file 3+ times in a session
    - view_file on 1000+ line files when you need one function
    - Re-reading imports you already saw
    
  RULE: If you've viewed a file once, use view_code_item for subsequent reads
  ```

### 🔒 RULE: Work Rollup on Completion
- **Date:** 2026-01-22
- **Incident:** No structured summary of shipped work for stakeholders/changelog.
- **Correction:** **Generate work rollup at session end or major milestone.**
- **Enforcement:**
  ```
  ROLLUP TRIGGERS:
    - Session end
    - Feature complete
    - Sprint boundary
    - User requests summary
    
  ROLLUP FORMAT:
    ## 📦 Work Shipped [DATE]
    
    ### Features
    - [Feature]: [1-line description]
    
    ### Fixes
    - [Fix]: [What was broken → Now works]
    
    ### Files Changed
    - [path/to/file.ts]: [what changed]
    
  OUTPUT: Can be used for changelog, PR description, or stakeholder update
  ```

### 🔒 RULE: LEARNINGS Self-Update
- **Date:** 2026-01-22
- **Incident:** Made discoveries (ID mismatches, layout patterns) but didn't write to LEARNINGS.md.
- **Correction:** **WRITE new learnings to LEARNINGS.md when patterns are discovered.**
- **Enforcement:**
  ```
  LEARNING TRIGGERS:
    - Bug required unexpected fix
    - Pattern solved a repeated problem
    - Tool/approach worked better than expected
    - Mistake that should never recur
    
  PROCESS:
    1. Identify the learning
    2. Write to _bmad/beast-mode/LEARNINGS.md using template
    3. If critical → Also add to GEMINI.md COMMON MISTAKES
    
  RULE: Future sessions benefit only if learnings are written
  ```

### 🔒 RULE: Business Logic Isolation
- **Date:** 2026-01-22
- **Incident:** Hardcoded pivot rules (if 'quieter' -> subtract $120) directly in UI store.
- **Correction:** **NEVER put business logic in view/store layer. Use services.**
- **Enforcement:**
  ```
  SEPARATION PATTERN:
    UI Layer (components/) → Display & interaction only
    Store Layer (stores/)  → State management only
    Service Layer (services/) → Business logic lives HERE
    
  EXAMPLES OF BUSINESS LOGIC:
    - Price calculations
    - Validation rules
    - State transitions
    - Data transformations
    
  EVEN FOR MOCKS:
    Create services/[feature]-engine.ts
    Export pure functions
    Import into store/component
    
  RATIONALE: Prepares for API migration, enables unit testing
  ```

### 🔒 RULE: Money as Strict Type
- **Date:** 2026-01-22
- **Incident:** Implemented costs as simple strings ("$3,330"). Protocol requires French fiscal logic.
- **Correction:** **Treat money as a strict type. Never use plain strings/numbers.**
- **Enforcement:**
  ```
  MONEY REPRESENTATION:
    - Store as cents (integer) or Decimal type
    - NEVER store as float (precision loss)
    - NEVER store as formatted string ("$3,330")
    
  TYPE DEFINITION:
    type Money = {
      amount: number;      // In cents
      currency: 'EUR' | 'USD';
    };
    
  FORMATTING:
    - Format ONLY at display layer
    - Use Intl.NumberFormat for locale-aware display
    
  BEAST MODE REMINDER:
    "French (FR) for Finance logic. Math > Emotion."
  ```

### 🔒 RULE: Accessibility for Visual States
- **Date:** 2026-01-22
- **Incident:** Ghost Node relies on visual cues only (opacity, dashed lines). No aria-labels.
- **Correction:** **ALL visual states must have semantic accessibility.**
- **Enforcement:**
  ```
  VISUAL STATE CHECKLIST:
    [ ] Opacity changes → aria-hidden or aria-label explaining state
    [ ] Color-only indicators → Add text or icon alternative
    [ ] Animations → Respect prefers-reduced-motion
    [ ] Interactive elements → role + aria-label
    
  GHOST NODE EXAMPLE:
    <div 
      role="region"
      aria-label="Alternative option: Kanazawa Boutique, saves $120"
      aria-live="polite"
    >
    
  SKILL INJECTION: Load accessibility-wcag SKILL.md for complex UI
  ```

### 🔒 RULE: Agent Persona Switching
- **Date:** 2026-01-22
- **Incident:** Stayed in @beast-dev mode. Never switched to @beast-qa or @beast-sec.
- **Correction:** **SWITCH personas for comprehensive coverage.**
- **Enforcement:**
  ```
  MANDATORY PERSONA SWITCHES:
    
    After implementation → @beast-qa
      - Try breaking the feature (rapid clicks, edge inputs)
      - Test unhappy paths
      
    Before shipping → @beast-sec
      - Check for XSS in reflected inputs
      - Validate URL parameters are sanitized
      - Review auth/RLS implications
      
  EXAMPLE QA CHECKS:
    - Click "Apply" twice rapidly → Does it break?
    - Submit empty form → Graceful error?
    - URL param injection → Escaped properly?
    
  PATTERN: Dev → QA → Sec → Ship
  ```

### 🔒 RULE: Tech Debt Tagging
- **Date:** 2026-01-22
- **Incident:** Added setTimeout delays for "reliability theater" without TODO or cleanup task.
- **Correction:** **ALL intentional shortcuts must be tagged and tracked.**
- **Enforcement:**
  ```
  TECH DEBT MARKERS:
    // TODO(cleanup): [description] - Remove before production
    // HACK: [description] - Workaround for [issue]
    // MOCK: [description] - Replace with real API
    
  TRACKING:
    1. Add inline comment with marker
    2. Create cleanup task in Plane (or backlog)
    3. Link task ID in comment if significant
    
  EXAMPLES:
    // TODO(cleanup): Remove artificial delay - PLAN-123
    await new Promise(r => setTimeout(r, 1500));
    
  INVISIBLE DEBT = IGNORED DEBT
  ```

### 🔒 RULE: Input Sanitization Audit
- **Date:** 2026-01-22
- **Incident:** searchQuery reflected in URL without sanitization check.
- **Correction:** **AUDIT all user inputs reflected in URLs, HTML, or storage.**
- **Enforcement:**
  ```
  REFLECTION POINTS:
    - URL parameters → encodeURIComponent
    - HTML output → Escape or use framework's auto-escape
    - LocalStorage → Validate on read
    - Database → Parameterized queries only
    
  SECURITY CHECKLIST (before shipping):
    [ ] User input in URL? → Encoded
    [ ] User input in DOM? → Escaped
    [ ] User input in query? → Parameterized
    
  @beast-sec ACTIVATION:
    Run this check on ANY feature that accepts user input
  ```

### 🔒 RULE: Page Ambiguity Resolution
- **Date:** 2026-01-22
- **Incident:** Investigated `start.html` when bug was in React `/planner` page.
- **Correction:** **ALWAYS confirm the exact page/URL before investigating UI bugs.**
- **Enforcement:**
  ```
  BEFORE investigating ANY "not working" bug:
    1. Ask: "Which exact URL shows this issue?"
    2. If static (.html) AND React route exist for similar content:
       - CONFIRM which one user means
       - Never assume
    3. grep_search for UI text to find all matching files
    4. If multiple candidates: LIST them and ask for clarification
    
  LOCALIZATION PROTOCOL:
    - Static pages → public/*.html
    - React pages → app/**/*.tsx or pages/**/*.tsx
    - Component → grep for unique text/class
    
  GATE: Location confirmed before investigation starts
  ```

### 🔒 RULE: Security-by-Design
- **Date:** 2026-01-22
- **Incident:** Security considerations often added as afterthought.
- **Correction:** **Security is the THINKING BACKBONE for all output.**
- **Enforcement:**
  ```
  BEFORE outputting code, specs, or recommendations:
    [ ] INPUT VALIDATION   → All user inputs sanitized
    [ ] OUTPUT ENCODING    → XSS/injection prevention
    [ ] AUTHORIZATION      → Least privilege enforced
    [ ] DATA PROTECTION    → PII masked, encrypted
    [ ] ERROR HANDLING     → No sensitive data in errors
    
  EVERY code deliverable MUST include:
    ## 🔐 Security Considerations
    - Input Validation: [how]
    - Authorization: [who can access]
    - Data Handling: [PII treatment]
    - Audit Trail: [what's logged]
    
  TRIGGER AREAS (heightened review):
    - Auth/Login, User Input, API Endpoints
    - File Upload, Data Display, External APIs
    - Database Queries, AI/LLM prompts
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

### 🔒 RULE: Scope Lock Protocol
- **Date:** 2026-01-26
- **Incident:** Scope churn mid-flight (Trips → Demo → Beta → ...) invalidated ongoing work.
- **Correction:** **Freeze ONE goal per sprint-sized block. Reject mid-stream changes.**
- **Enforcement:**
  ```
  BEFORE starting work:
    1. Define specific ACCEPTANCE CRITERIA (routes, behaviors, screenshots)
    2. Lock the scope: "We are doing X. We are NOT doing Y until X is verified."
  
  IF user adds scope mid-stream:
    1. PUSH BACK: "That invalidates current verification."
    2. Add to BACKLOG or ABORT current task to restart.
  ```

### 🔒 RULE: Atomic Verification Loop
- **Date:** 2026-01-26
- **Incident:** Interrupted turns led to partial state; verification was skipped.
- **Correction:** **Reproduce → Isolate → Fix → Verify → Proof. No skipping.**
- **Enforcement:**
  ```
  FOR EVERY FIX:
    1. Reproduce: Confirm bug exist.
    2. Isolate: Disable extensions/cache (incognito).
    3. Fix: Apply surgical diff.
    4. Build: npm run build must pass.
    5. Proof: Screenshot or log output confirming fix.
  ```

### 🔒 RULE: Single Design Source of Truth
- **Date:** 2026-01-26
- **Incident:** Mixed tokens (bg-[#FDFCF9]) vs variables (--background) broke theming.
- **Correction:** **Use CSS variables/tokens ONLY. No hardcoded hex values.**
- **Enforcement:**
  ```
  BANNED:
    - bg-[#hex], text-[#hex]
    - style="background-color: #hex"
  
  MANDATORY:
    - bg-primary, text-foreground
    - var(--background)
    
  AUDIT: grep_search for '#' in utility classes.
  ```

### 🔒 RULE: Icon System Unification
- **Date:** 2026-01-26
- **Incident:** Mixed icon fonts ("light_mode" text) and SVGs caused rendering noise.
- **Correction:** **Standardize on ONE system (SVG Components). Strict Ban on Icon Fonts.**
- **Enforcement:**
  ```
  IF icon needed:
    USE: lucide-react or heroicons (SVG components)
    BAN: Material Icons (ligatures), FontAwesome (fonts)
    
  REASON: Font loading race conditions cause layout shifts/text rendering.
  ```

### 🔒 RULE: Single Source of Truth for MVP
- **Date:** 2026-01-26
- **Incident:** Conflicting "truth" from walkthroughs vs lists caused re-litigation.
- **Correction:** **MAINTAIN 1 LIVING SPEC FILE (e.g., `MVP_SPEC.md`).**
- **Enforcement:**
  ```
  IF "MVP" or "Spec" mentioned:
    1. Check if `MVP_SPEC.md` exists. If not, create it.
    2. ALL decisions (routes, GTM, copy) must be written there.
    3. Treat `MVP_SPEC.md` as the ONLY truth. Ignore chat history if it conflicts.
  ```

### 🔒 RULE: Explicit Sign-Off for UI/IA
- **Date:** 2026-01-26
- **Incident:** Agent made implicit choices on nav/routes without approval.
- **Correction:** **DO NOT INFER routes/copy. GET EXPLICIT SIGN-OFF.**
- **Enforcement:**
  ```
  BEFORE implementing Nav or Routes:
    1. Output: "Proposed Nav Structure:"
    2. Output: "Proposed Route List:"
    3. STOP. Wait for user: "Approved."
  ```

### 🔒 RULE: Beast Mode With Constraints
- **Date:** 2026-01-26
- **Incident:** "Beast Mode" interpreted as "Change Everything".
- **Correction:** **Beast Mode = High Determinism, NOT High Churn.**
- **Enforcement:**
  ```
  WHEN "Beast Mode" or "10x" requested:
    1. Focus on DETERMINISTIC fixes (Types, Lints, Build).
    2. REJECT "Refactor everything" unless Architecture Review passes.
    3. "Tighten" > "Rewrite".
  ```

### 🔒 RULE: Micro-Commits (Save Points)
- **Date:** 2026-01-26
- **Incident:** Hard to rollback when refactor made things worse.
- **Correction:** **COMMIT before AND after every atomic step.**
- **Enforcement:**
  ```
  BEFORE refactor: `git commit -am "save: pre-refactor state"`
  AFTER step 1: `git commit -am "feat: step 1 done"`
  IF regression: `git checkout .` (easier rollback)
  ```

### 🔒 RULE: DOM Evidence for Debugging
- **Date:** 2026-01-26
- **Incident:** Debugged theme bugs via screenshots only.
- **Correction:** **CAPTURE COMPUTED STYLES & DOM CLASSNAMES.**
- **Enforcement:**
  ```
  DEBUGGING UI/THEME:
    1. `document.documentElement.className`
    2. `window.getComputedStyle(el).color`
    3. CHECK `data-theme` attributes.
    4. SCREENSHOT is secondary. DOM IS TRUTH.
  ```

### 🔒 RULE: Plane Ops Discipline
- **Date:** 2026-01-26
- **Incident:** Updates failed due to wrong directory; phantom updates reported.
- **Correction:** **Run Plane CLI from repo root. Paste JSON output.**
- **Enforcement:**
  ```
  PLANE UPDATES:
    1. cd [REPO_ROOT]
    2. Run command
    3. CAPTURE output
    4. IF error → Stop and report. Do not fake success.
  ```

---

## 🔄 AUTO-READ PROTOCOL

At the start of every session, Beast Mode agents MUST:
1. Check if this file exists
2. Read all `🔒 RULE` blocks
3. Apply them as **highest priority constraints**
4. If a user request would violate a rule, **VETO** and explain
