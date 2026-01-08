# 🎉 Beast Mode: Party Protocol
**Structured multi-agent escalation for deadlock resolution.**

## When to use Party Mode?
Use Party Mode when single-agent workflows get stuck or when a decision requires cross-domain expertise.

**Triggers:**
- "I need to check with Security..."
- "This might affect performance..."
- "I'm not sure if we should build A or B..."
- "The architecture contradicts the PRD..."

## The Protocol
Beast Mode defines 5 specialized parties in `config/party-protocol.yaml`:

### 1. Technical Party (Architect + Dev + QA)
**Topic:** Implementation details, stack choices, refactoring risks.
**Facilitator:** PM

### 2. Product Party (PM + UX + Data)
**Topic:** Scope, user flows, prioritization, metrics.
**Facilitator:** Analyst

### 3. Security Party (SecOps + DPO + Pentester)
**Topic:** Sensitive data, auth flows, compliance.
**Facilitator:** Architect

### 4. Ops Party (DevOps + SRE + DBA)
**Topic:** Deployment, scaling, database schema.
**Facilitator:** Architect

### 5. AI Party (PromptEng + AISafety + AICost)
**Topic:** LLM integration, prompt design, safety checks.
**Facilitator:** AI Architect

## How to Run a Party
A Party is a **structured debate**, not a free-for-all.

### 1. Invoke
```bash
*party topic: "Should we use NextAuth or Clerk?"
```

### 2. Protocol Steps (Automated by Facilitator)
1.  **Frame:** Facilitator states the decision.
2.  **Diverge:** Each agent gives their perspective (concurrently).
3.  **Debate:** Agents challenge each other (max 2 rounds).
4.  **Converge:** Facilitator synthesizes the Trade-offs.
5.  **Decide:** A decision is recorded in `docs/bmad/{slug}/party-{topic}.md`.

## The "One Driver" Rule
Even in Party Mode, **only ONE agent** (the Facilitator) speaks to the user.
Other agents provide "internal monologue" or "consultation notes" that the Facilitator summarizes.

**Example Output:**
> **Facilitator (PM):** "I've consulted with the Technical Party.
> - **Architect** warns about vendor lock-in with Clerk.
> - **Dev** estimates NextAuth will take 3x longer to implement.
> - **QA** notes Clerk has better built-in testing tools.
>
> **Decision:** We will use Clerk for MVP to save time, but wrap it in an Adapter to mitigate lock-in."
