---
description: "Process for a Production Launch (The 'All-Hands' Protocol)"
---

# 🚀 LAUNCH DAY PROTOCOL ("TOTAL WAR")

> **TRIGGER:** `*blitz-launch`
> **GOAL:** Zero-Defect Release to Production.
> **SQUAD:** 9 Agents (Director, Architect, QA, Sec, SRE, SEO, A11y, Copy, Dev)

---

## 🛑 STEP 1: THE ARCHITECTURAL REVIEW (MATRIX)
**Agent:** `@beast-architect`
**Mandate:** Ensure the foundation is solid.
1. Review the entire codebase structure.
2. Check for circular dependencies.
3. Verify "Scalability First" principles (Statelessness, Caching).
4. **VETO:** If architecture is "Spaghetti Code".

## 🧪 STEP 2: DESTRUCTIVE TESTING (HUNTER)
**Agent:** `@beast-qa`
**Mandate:** Try to break it.
1. Run "The Murphy Protocol" (Edge Cases).
2. Execute Regression Suite.
3. **VETO:** If Coverage < 80% or Critical Bugs exist.

## 🛡️ STEP 3: SECURITY HARDENING (AEGIS)
**Agent:** `@beast-sec`
**Mandate:** "Zero Trust".
1. Audit Auth flows (JWT/Session).
2. Check RLS policies (Supabase).
3. Validate Input Sanitization (Zod).
4. **VETO:** If any endpoint is unprotected.

## ⛓️ STEP 4: INFRASTRUCTURE CAPACITY (TITAN)
**Agent:** `@beast-sre`
**Mandate:** "I hold the sky".
1. Check Error Budgets.
2. Verify Auto-Scaling Groups.
3. Review Alerting Policy.
4. **VETO:** If Single Point of Failure (SPOF) exists.

## 🎨 STEP 5: THE POLISH GAUNTLET (ACCESS, SIGNAL, SCRIBE)
**Agents:** `@beast-a11y`, `@beast-seo`, `@beast-copy`
**Mandate:** Perfection.
1. **ACCESS:** Check WCAG 2.1 AA (Contrast, Labels).
2. **SIGNAL:** Check Meta Tags, Sitemap, Robots.txt.
3. **SCRIBE:** Check for Passive Voice and Jargon.
4. **VETO:** If any "Red Flags" are found.

## 🏁 STEP 6: THE RELEASE (FORGE)
**Agent:** `@beast-dev`
**Mandate:** "Ship it."
1. Await confirmation from ALL agents.
2. Execute the build.
3. Verify the deployment.
4. **OUTPUT:** "🚀 RELEASE COMPLETE. VERSION [X.X.X] IS LIVE."
