# BMAD Trigger Matrix

## Automatic Squad Activation

When these keywords are detected in a request, the corresponding squads are automatically activated.

---

## 🔴 Security Squad Triggers

| Keyword | Agents Activated | Priority |
|---------|------------------|----------|
| `auth` / `authentication` | SecOps, Pentester | Critical |
| `login` / `logout` / `session` | SecOps, Pentester | Critical |
| `password` / `reset` / `token` | SecOps, DPO | Critical |
| `payment` / `billing` / `stripe` | SecOps, DPO, Pentester | Critical |
| `pii` / `personal data` / `gdpr` | DPO, SecOps | Critical |
| `upload` / `file` / `attachment` | SecOps, Pentester | High |
| `secret` / `key` / `credential` | AppSecBot, SecOps | Critical |
| `encrypt` / `hash` / `crypto` | SecOps | High |
| `permission` / `role` / `access` | SecOps | High |
| `admin` / `sudo` / `superuser` | SecOps, Pentester | Critical |

---

## 🟢 Growth Squad Triggers

| Keyword | Agents Activated | Priority |
|---------|------------------|----------|
| `pricing` / `plan` / `tier` | Pricing, Entitlements | High |
| `subscription` / `recurring` | Pricing, Entitlements | High |
| `upgrade` / `downgrade` | Pricing, Entitlements | High |
| `trial` / `freemium` | Pricing, Growth | Medium |
| `quota` / `limit` / `usage` | Entitlements | Medium |
| `onboarding` / `first-time` | Growth, Retention | High |
| `churn` / `retention` / `cancel` | Retention | High |
| `referral` / `invite` | Growth | Medium |
| `experiment` / `a/b test` | Growth, Data | High |
| `support` / `help` / `faq` | Support | Medium |

---

## 🟣 Ops Squad Triggers

| Keyword | Agents Activated | Priority |
|---------|------------------|----------|
| `deploy` / `release` / `ship` | DevOps | High |
| `ci` / `cd` / `pipeline` | DevOps | Medium |
| `docker` / `container` / `k8s` | DevOps | Medium |
| `database` / `schema` / `migration` | DBA | High |
| `postgres` / `mysql` / `mongo` | DBA | Medium |
| `query` / `index` / `slow` | DBA, Perf | High |
| `performance` / `latency` / `slow` | Perf | High |
| `scale` / `load` / `traffic` | Perf, SRE | High |
| `slo` / `sli` / `error budget` | SRE | High |
| `alert` / `monitor` / `observability` | SRE | High |
| `incident` / `outage` / `downtime` | SRE | Critical |
| `rollback` / `revert` | DevOps | Critical |

---

## 🟡 Polish Squad Triggers

| Keyword | Agents Activated | Priority |
|---------|------------------|----------|
| `review` / `pr` / `code review` | Reviewer | Medium |
| `documentation` / `readme` / `docs` | TechWriter | Medium |
| `api docs` / `swagger` / `openapi` | TechWriter | Medium |
| `accessibility` / `a11y` / `wcag` | A11y | High |
| `screen reader` / `keyboard` | A11y | High |
| `i18n` / `translation` / `locale` | i18n | Medium |
| `l10n` / `rtl` / `language` | i18n | Medium |
| `refactor` / `cleanup` / `tech debt` | Refactor | Low |
| `dead code` / `unused` | Refactor | Low |

---

## 🤖 AI-Eco Squad Triggers

| Keyword | Agents Activated | Priority |
|---------|------------------|----------|
| `ai` / `llm` / `gpt` / `claude` | PromptEng, AIArch | High |
| `prompt` / `system prompt` | PromptEng | High |
| `chatbot` / `assistant` / `agent` | PromptEng, AISafety | High |
| `generation` / `generate` / `completion` | PromptEng | Medium |
| `embedding` / `vector` / `rag` | AIArch | Medium |
| `bias` / `fairness` / `ethics` | AISafety | Critical |
| `hallucination` / `accuracy` | AISafety, PromptEng | High |
| `token` / `cost` / `usage` | AICost | Medium |
| `rate limit` / `quota` | AICost | Medium |
| `streaming` / `real-time ai` | AIArch | Medium |

---

## 🔵 Core Squad (Always On)

The Core Squad is **always active** for any request:

| Agent | Purpose |
|-------|---------|
| Analyst | Root cause analysis |
| Architect | Technical design |
| PM | Requirements definition |
| UX | User experience design |
| SM | Story preparation |
| Dev | Implementation |
| QA | Verification |
| Data | Analytics tracking |

---

## Workflow Selection Matrix

| Request Type | Workflow | Time | Core | Security | Growth | Ops | Polish | AI |
|--------------|----------|------|------|----------|--------|-----|--------|-----|
| Bug fix | Quick Fix | < 2h | ✅ | ⚪ | ⚪ | ⚪ | ⚪ | ⚪ |
| Feature | Standard | 1d-1w | ✅ | ⚪ | ⚪ | ⚪ | ⚪ | ⚪ |
| Auth change | Enterprise | 1-4w | ✅ | ✅ | ⚪ | ⚪ | ✅ | ⚪ |
| Payment | Enterprise | 1-4w | ✅ | ✅ | ✅ | ⚪ | ✅ | ⚪ |
| AI feature | AI Feature | 1-2w | ✅ | ⚪ | ⚪ | ⚪ | ⚪ | ✅ |
| New service | Enterprise | 1-4w | ✅ | ✅ | ⚪ | ✅ | ✅ | ⚪ |

**Legend:** ✅ = Required | ⚪ = Optional/Triggered by keywords

---

## Emergency Triggers

These keywords trigger IMMEDIATE escalation:

| Keyword | Action |
|---------|--------|
| `security breach` | All Security + SRE |
| `data leak` | DPO + SecOps + Legal |
| `production down` | SRE + DevOps |
| `rollback now` | DevOps + SRE |
| `incident` | SRE |
