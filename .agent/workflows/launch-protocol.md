---
description: "Process for a Production Launch (The 'All-Hands' Protocol)"
---

# 🚀 LAUNCH PROTOCOL (TOTAL WAR MODE)

> **TRIGGER:** `/launch-protocol`
> **GOAL:** Zero-Defect Release to Production
> **SQUAD:** 9+ Agents (All hands on deck)
> **MODE:** Sequential Gates with Veto Power
> **STAKES:** High (Production = Real Users)

---

## 🚨 LAUNCH READINESS CHECK

Before starting this protocol:
- [ ] Feature is complete and merged to main
- [ ] No critical bugs in backlog
- [ ] Stakeholders notified of launch window
- [ ] Rollback plan documented

---

## 🛑 STEP 1: ARCHITECTURAL REVIEW (30 min)
**Agent:** `@beast-architect`

**The Foundation Check:**
1. Is the codebase structure sound?
2. Any circular dependencies?
3. Is it scalable? (Stateless, cacheable, horizontal)
4. Are there any "Spaghetti Code" areas?

// turbo
```bash
# Check for unused dependencies
npm ls --depth=0
```

**VETO POWER:** If architecture is fundamentally broken → **BLOCK LAUNCH**

**Output:** `[APPROVED / BLOCKED]` + Findings

---

## 🧪 STEP 2: DESTRUCTIVE TESTING (1 hour)
**Agent:** `@beast-qa`

**Murphy Protocol (Full Execution):**

### 2.1 Edge Case Gauntlet
| Test | Input | Expected |
|------|-------|----------|
| Empty required field | `""` | Error message |
| Max length | 10,000 chars | Truncate/error |
| Special characters | `<script>alert('XSS')</script>` | Escaped |
| Unicode/Emoji | `👋🏻🎉` | Handle gracefully |
| SQL Injection | `'; DROP TABLE users;--` | Escaped |
| Negative numbers | `-1` | Error/default |

### 2.2 Stress Testing
- Click submit 10x rapidly
- 100 concurrent users (k6/artillery)
- Network timeout simulation

### 2.3 Mobile Testing
- 320px viewport
- Touch targets ≥44px
- No horizontal scroll

// turbo
```bash
npm run test && npm run test:e2e
```

**VETO POWER:** If coverage <80% OR critical bugs exist → **BLOCK LAUNCH**

**Output:** Test Report + Coverage Percentage

---

## 🛡️ STEP 3: SECURITY HARDENING (30 min)
**Agent:** `@beast-sec`

**Iron Dome Checklist:**

### 3.1 Authentication
- [ ] JWT tokens have short expiry (15min)
- [ ] HttpOnly Secure cookies (no localStorage)
- [ ] Session invalidation works

### 3.2 Authorization
- [ ] RLS enabled on all tables
- [ ] RBAC middleware on admin routes
- [ ] No IDOR vulnerabilities

### 3.3 Input Validation
- [ ] Zod schemas on ALL endpoints
- [ ] No `any` types in security paths
- [ ] Rate limiting configured

// turbo
```bash
# Quick security scan
grep -r "any" src/ --include="*.ts" | wc -l
```

**VETO POWER:** If ANY endpoint is unprotected → **BLOCK LAUNCH**

**Output:** Security Audit Report

---

## ⛓️ STEP 4: INFRASTRUCTURE CAPACITY (20 min)
**Agent:** `@beast-sre`

**Reliability Check:**
1. Are error budgets healthy? (SLO compliance)
2. Is auto-scaling configured?
3. Is alerting set up? (PagerDuty/OpsGenie)
4. Is there a Single Point of Failure (SPOF)?

**Capacity Planning:**
| Resource | Current | Expected Load | Headroom |
|----------|---------|---------------|----------|
| CPU | 20% | 60% | ✅ Safe |
| Memory | 40% | 70% | ✅ Safe |
| Database | 30% | 50% | ✅ Safe |

**VETO POWER:** If SPOF exists → **BLOCK LAUNCH**

**Output:** Infrastructure Readiness Report

---

## 🎨 STEP 5: POLISH GAUNTLET (30 min)
**Agents:** `@beast-a11y` + `@beast-seo` + `@beast-copy`

### 5.1 Accessibility (ACCESS)
- [ ] WCAG 2.1 AA compliant
- [ ] Contrast ≥4.5:1
- [ ] All images have alt text
- [ ] Keyboard navigation works
- [ ] Screen reader tested

### 5.2 SEO (SIGNAL)
- [ ] Meta title + description on all pages
- [ ] Sitemap.xml up to date
- [ ] robots.txt configured
- [ ] Open Graph tags present

### 5.3 Copy (SCRIBE)
- [ ] No typos
- [ ] No passive voice in CTAs
- [ ] No placeholder text ("Lorem ipsum")
- [ ] Error messages are helpful

// turbo
```bash
# Check for placeholder text
grep -ri "lorem\|placeholder\|todo" src/ --include="*.tsx" | head -10
```

**VETO POWER:** If any "Red Flags" found → **BLOCK LAUNCH**

---

## 🎯 STEP 5.5: ZERO-DEFECT VERIFICATION (MANDATORY)
**Agent:** `@beast-dev`

**CRITICAL: No production deploy without verified clean build.**

// turbo
```bash
npm run build && npm run lint && npm run test && npm run test:e2e
```

**Output required:**
```markdown
## ✅ VERIFICATION REPORT
**Build:** ✅ Passed (production build)
**Lint:** ✅ 0 errors, 0 warnings
**Unit Tests:** ✅ All pass
**E2E Tests:** ✅ All pass
**Coverage:** ✅ >80%
**Bundle Size:** ✅ Within budget
```

**GATE:** ALL checks must pass. THIS IS PRODUCTION.

---

## ✅ STEP 6: FINAL CHECKLIST
**Agent:** `@beast-enforcer`

**Pre-Deploy Verification:**
| Check | Status |
|-------|--------|
| All previous steps approved | □ |
| Git history clean | □ |
| Environment variables set | □ |
| Database migrations run | □ |
| Feature flags configured | □ |
| Rollback command tested | □ |
| Team notified | □ |

**GATE:** ALL checks must pass before proceeding.

---

## 🚀 STEP 7: THE RELEASE
**Agent:** `@beast-dev` + `@beast-devops`

**Deployment Sequence:**
1. Await confirmation from ALL agents
2. Execute build: `npm run build`
3. Deploy to staging
4. Smoke test staging
5. Deploy to production
6. Verify production health

// turbo
```bash
npm run build
```

**Post-Deploy:**
```bash
# Health check
curl -s https://[domain]/health | jq
```

**Output:** 
```
🚀 RELEASE COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Version: [X.X.X]
Deployed: [timestamp]
Commit: [sha]
Status: HEALTHY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 📊 POST-LAUNCH MONITORING (15 min)
**Agent:** `@beast-sre`

**Watch Dashboard For:**
- Error rate (should remain flat)
- Latency (should not spike)
- Conversion rate (should not drop)
- User complaints (support channels)

**Alert Thresholds:**
| Metric | Yellow | Red |
|--------|--------|-----|
| Error rate | +50% | +100% |
| Latency p95 | +200ms | +500ms |
| 5xx errors | >1% | >5% |

**EMERGENCY ROLLBACK:**
```bash
# If things go wrong
git revert HEAD --no-edit && git push
```

---

## 📊 EXIT CRITERIA

| Check | Required |
|-------|----------|
| Architecture approved | ✅ |
| QA passed (>80% coverage) | ✅ |
| Security hardened | ✅ |
| Infrastructure ready | ✅ |
| A11y/SEO/Copy polished | ✅ |
| Production deployed | ✅ |
| Health check passing | ✅ |
| Monitoring active | ✅ |

---

## ⏱️ TIME BUDGET

| Step | Target |
|------|--------|
| Architecture | 30 min |
| QA | 1 hour |
| Security | 30 min |
| Infrastructure | 20 min |
| Polish | 30 min |
| Final Check | 10 min |
| Deploy | 15 min |
| Monitoring | 15 min |
| **TOTAL** | **~4 hours** |
