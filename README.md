# 🔥 Beast Mode v3.2 — Top 1% Industry Authority

> **34 Principal-Level AI Agents** for BMAD Method v6  
> Namespaced `beast-*` to avoid clash with standard BMAD. No fork. No drift. Pure power.

### 📍 Core Module Path
`Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode`

---

**Quick Setup:** See [`BMAD_BOOTSTRAP.md`](./BMAD_BOOTSTRAP.md) for <60 second install.

---

## 🚀 Super Simple Setup

### Option A: Start a New Project (The Cleanest Way)

1.  **Create your folder & initialize:**
    ```bash
    mkdir my-new-app
    cd my-new-app
    git init
    ```

2.  **Run the installer:**
    ```bash
    npx bmad-method@alpha install
    ```

3.  **Answer the prompts:**
    *   **Tools:** Select *Google Antigravity* & *OpenCode* (Spacebar to select).
    *   **Modules:** Select **BMM** (The core method) + **Beast Mode**.
    *   **Custom Module?** Type `y`.
    *   **Path:** Paste this exact path:
        `Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode`

---

### Option B: Add to Existing Project

1.  **Go to your project root:**
    ```bash
    cd my-existing-project
    ```

2.  **Run the installer:**
    ```bash
    npx bmad-method@alpha install
    ```

3.  **Choose "Modify BMAD Installation":**
    *   If BMAD is already there, it will ask to update/modify. Select **Update custom modules**.
    *   If BMAD is *not* there, follow the "New Project" steps above.

4.  **When asked for Custom Module:**
    *   Select `y`.
    *   Paste: `Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode`

**Done.** You now have access to 34+ specialized agents in your project.

---

## � Verify Your Installation

After installing, run these checks:

```bash
# Check Beast Mode agents exist
ls _bmad/beast-mode/agents/

# Expected output:
# ai-eco  core  growth  meta  ops  orchestrator.md  polish  security

# Check a specific agent
cat _bmad/beast-mode/agents/core/analyst.md | head -20
```

**If `_bmad/beast-mode/` doesn't exist**, the module wasn't installed correctly. See Troubleshooting below.

---

## 🔧 OpenCode Agent Setup

### Force Agent Refresh
OpenCode only reads agent configs when the window starts. After installing Beast Mode:

1. **Reload the Window**
   - Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows)
   - Type `Reload Window` and hit Enter

2. **Verify Agents Load**
   - Open the AI Chat panel
   - Type `@beast` (don't paste a path)
   - You should see: `@beast-analyst`, `@beast-dev`, `@beast-architect`, etc.

### ❌ Agents Not Appearing?

Check if OpenCode is reading the config file:

```bash
# The config file should exist at:
cat .opencode/config.yaml

# It should contain entries like:
agents:
  - name: beast-dev
    promptPath: _bmad/beast-mode/agents/core/dev.md
  - name: beast-analyst
    promptPath: _bmad/beast-mode/agents/core/analyst.md
```

**If the file is missing:** Reinstall BMAD with `npx bmad-method@alpha install`

**If the file exists:** Try the Window Reload again (`Cmd+Shift+P` → `Reload Window`)

---

## 🎮 How to Use Your Agents

### The Big Picture
Each agent is a specialized AI expert. Think of them as **your personal engineering team**:
- **Load an agent** → You're "calling them into the room"
- **Run a command** → You're asking them to do their job

---

### 🔤 Beast Mode Grammar (The 3 Symbols)

Before diving in, understand the **three symbols** that control everything:

#### **`@` = The WHO** (Select Agent)
> *"Walking over to a specific person's desk."*

| What It Does | Example | User Intent |
|--------------|---------|-------------|
| Selects which agent you're talking to | `@beast-dev` | "I want to talk to the Developer" |
| | `@beast-architect` | "I want to talk to the Architect" |

---

#### **`*` = The WHAT** (Run Workflow)
> *"Handing the employee a specific form to fill out."*

| What It Does | Example | User Intent |
|--------------|---------|-------------|
| Triggers a pre-defined, rigorous workflow | `*create-prd` | "Don't just chat, **make** the document" |
| Forces structured output, not conversation | `*analyze` | "Run the formal root cause protocol" |

**When to use:** When you need a **deliverable** (PRD, Code, Audit, Spec) — not a chat.

---

#### **`/` = The SYSTEM** (IDE Commands)
> *"Turning the lights on/off in the office."*

| What It Does | Example | User Intent |
|--------------|---------|-------------|
| Commands for the IDE/Chat itself | `/load` | Load a file or agent |
| | `/task` | "This is a coding task, not a chat" |
| | `/clear` | Wipe memory |

**When to use:** To control the tool, not the agent.

---

### 🧩 The Golden Sentence

The most powerful commands combine **WHO** + **WHAT**:

```
@beast-dev *implement-fix context: "The login button is broken."
```

| Part | Meaning |
|------|---------|
| `@beast-dev` | "Hey Developer..." |
| `*implement-fix` | "...run your standard Bug Fix Protocol..." |
| `context: "..."` | "...on this specific issue." |

---

### ⚡ Quick Cheat Sheet

| Symbol | Meaning | Example | User Intent |
|--------|---------|---------|-------------|
| `@` | Select Agent | `@beast-ux` | "I want to talk to the Designer" |
| `*` | Run Workflow | `*define-ux` | "Do the Wireframe job now" |
| `/` | System Cmd | `/help` | "How does this tool work?" |

---

### Step-by-Step: Your First Agent

**1. Load the agent you need**
```bash
/beast-analyst
```
This loads **ATLAS**, your root-cause analysis expert.

**2. The agent greets you with a menu**
```markdown
👋 Hello! I'm ATLAS, your Principal Problem Analyst.

🎛️ Quick Actions:
[AN] Analyze    - Deep-dive root cause analysis
[CH] Chat       - Freeform discussion
...
```

**3. Use a command or quick action**
```bash
*analyze-problem context: 'Users can't log in on mobile'
```
Or just type: `[AN]` (the quick action code)

**4. ATLAS investigates and reports**
```markdown
# 🔍 Root Cause Analysis

## The Real Problem
Auth token expires after 15min, but mobile app checks every 20min.

## Fix
Reduce token check interval to 10min OR extend token life to 30min.
```

---

### Two Ways to Work

#### **Method 1: Quick Fix Flow** (For small, urgent tasks)
You know what's broken. You need it fixed. Fast.

```bash
# Step 1: Diagnose
/beast-analyst
*analyze-problem context: 'Checkout button returns 500 error'

# Step 2: Fix
/beast-dev
*implement-fix
```

**When to use:** Bugs, small features, quick patches.

---

#### **Method 2: Structured Protocol** (For complex, high-risk tasks)
You're refactoring core systems. You need a checklist to ensure nothing breaks.

```bash
# Step 1: Get the protocol
/beast-enforcer
*enforce context: 'Migrate auth system from Firebase to Supabase'

# Step 2: Follow the checklist
# WARDEN will generate:
# 1. [ ] ATLAS analyzes current system
# 2. [ ] MATRIX designs new architecture  
# 3. [ ] FORGE implements migration
# 4. [ ] HUNTER tests rollback plan
# etc.
```

**When to use:** Migrations, refactors, new features, anything mission-critical.

---

#### **Method 3: Multi-Agent Collaboration** (Two Ways)

There are **two ways** to work with multiple agents at once. They serve different purposes.

---

##### **Option A: BMAD Party Mode** (Facilitated Discussion) 🎉

**What it is:** A **facilitator** intelligently selects 2-3 agents and manages a discussion.

**How to use:**
```bash
# Load any agent that supports party mode
/beast-pm

# Start party mode
*party-mode

# Present your topic
"Should we use microservices or a monolith for our new platform?"

# The facilitator:
# - Selects relevant agents (e.g., MATRIX, AEGIS, FORGE)
# - Lets them debate naturally
# - They reference each other's points
# - Cross-talk happens organically

# Exit when done
type "exit"
```

**When to use Party Mode:**
- ✅ **Strategic decisions** ("Which architecture?")
- ✅ **Brainstorming** ("How can we improve onboarding?")
- ✅ **Complex trade-offs** (multiple perspectives needed)
- ✅ **Exploring unknowns** (no clear answer yet)

**What makes it special:**
- **Intelligent agent selection** — Facilitator picks the right experts
- **Natural debate** — Agents disagree, build on ideas, challenge each other
- **No manual coordination** — You present the topic, they do the rest

---

##### **Option B: Manual @ Mention Workflows** (Sequential Execution)

**What it is:** You **manually chain agents** for structured, linear workflows.

**How to use:**
```bash
# Step 1: Analyst diagnoses
@beast-analyst Why is login failing on mobile?

[ATLAS responds with root cause]

# Step 2: Dev fixes
@beast-dev Fix the null pointer ATLAS found at login.ts:45

[FORGE implements the fix]

# Step 3: QA tests
@beast-qa Test the login fix

[HUNTER validates]
```

**When to use @ Mention Workflows:**
- ✅ **Linear execution** (diagnose → fix → test)
- ✅ **Bug fixes** (clear problem, clear solution)
- ✅ **Feature implementation** (PRD → design → build → test)
- ✅ **When you know the sequence** (no debate needed)

**What makes it different:**
- **You control the flow** — Explicitly tell each agent what to do
- **Sequential handoffs** — Agent A finishes, you call Agent B
- **More control, less exploration** — Good for execution, not ideation

---

##### **Quick Decision Guide:**

| Your Situation | Use This |
|----------------|----------|
| "Should we build this feature?" | **Party Mode** (debate pros/cons) |
| "Build this feature we agreed on" | **@ Mention Workflow** (PRD → design → build) |
| "Why is X broken?" | **@ Mention** (analyst → dev → qa) |
| "How do we improve X?" | **Party Mode** (brainstorm solutions) |
| "I need multiple perspectives" | **Party Mode** |
| "I need strict execution sequence" | **@ Mention Workflow** |

---

### Pro Tips

✅ **Load the right agent for the job**  
Don't ask ATLAS (Analyst) to write code. That's FORGE's (Developer) job.

✅ **Use `/bmad` to see all agents**  
Not sure who to call? This lists everyone.

✅ **Agents have memory within a session**  
ATLAS remembers what you told them 5 minutes ago. Use it.

✅ **Mix methods freely**  
Use Party Mode to decide what to build, then @ Mention workflows to build it.


---

## 📋 The 34 Agents (Meet Your Squad)

### 🛠️ Core Engineering (9 agents)

| Agent | Call Sign | What They Do | When to Use Them |
|-------|-----------|--------------|------------------|
| **Analyst** | **ATLAS** | Finds the *true* root cause, not just symptoms. Uses 5 Whys, logs, and evidence. | Bug investigation, incident postmortems |
| **Architect** | **MATRIX** | Designs system architecture that scales and doesn't collapse under load. | New features, refactors, tech decisions |
| **Developer** | **FORGE** | Writes clean, tested, production-ready code. Ships fast. | Implementing features, fixing bugs |
| **Product Manager** | **VANTAGE** | Defines *what* to build and *why*. Writes PRDs, prioritizes ruthlessly. | Planning new features, roadmapping |
| **QA Engineer** | **HUNTER** | Breaks your code before users do. Writes test plans, finds edge cases. | Pre-launch testing, quality gates |
| **Scrum Master** | **TEMPO** | Keeps the team moving. Removes blockers, splits stories, manages velocity. | Sprint planning, standups |
| **Brainstormer** | **SPARK** | Generates 100 ideas in 1 minute. Divergent thinking on demand. | Ideation, feature concepts, naming |
| **Data Analyst** | **ORACLE** | Defines metrics, builds dashboards, tracks what matters. | Analytics setup, A/B test design |
| **UX Designer** | **MUSE** | Designs interfaces humans love. User flows, wireframes, accessibility. | UI/UX work, user research |

**Quick Commands:** `*analyze`, `*arch`, `*fix`, `*prd`, `*test`, `*sprint`, `*rain`, `*metrics`, `*ux`

---

### 🔒 Security (3 agents)

| Agent | Call Sign | What They Do | When to Use Them |
|-------|-----------|--------------|------------------|
| **SecOps** | **AEGIS** | Builds defense-in-depth security. Threat models, zero-trust architecture. | Security reviews, compliance |
| **Pentester** | **BREAKER** | Attacks your system like a hacker would. Finds vulnerabilities before bad actors do. | Pre-launch security audits |
| **Privacy Officer** | **SENTINEL** | Ensures GDPR/CCPA compliance. Audits data handling, writes privacy policies. | Privacy impact assessments |

**Quick Commands:** `*threat-model`, `*scan`, `*audit`

---

### 📈 Growth (5 agents)

| Agent | Call Sign | What They Do | When to Use Them |
|-------|-----------|--------------|------------------|
| **Growth Lead** | **APEX** | Runs experiments to grow user base. A/B tests, funnels, acquisition. | Growth hacking, experiments |
| **Pricing Strategist** | **LEDGER** | Optimizes pricing to maximize LTV. Psychological pricing, value-based models. | Pricing changes, monetization |
| **Retention Expert** | **ANCHOR** | Plugs the leaky bucket. Reduces churn, builds habits. | Retention campaigns, onboarding |
| **Support Lead** | **RESOLVE** | Turns angry customers into advocates. Builds support workflows. | Customer support setup |
| **Value Analyst** | **COMPASS** | Maps user psychology to product value. Finds product-market fit. | User research, positioning |

**Quick Commands:** `*experiment`, `*pricing`, `*churn`, `*support`, `*value`

---

### ⚙️ Operations (6 agents)

| Agent | Call Sign | What They Do | When to Use Them |
|-------|-----------|--------------|------------------|
| **SRE** | **TITAN** | Ensures 99.9% uptime. Defines SLOs, builds reliable systems. | Reliability engineering |
| **DevOps** | **FLOW** | Automates CI/CD pipelines. IaC, deployments, developer experience. | Pipeline setup, automation |
| **Observability** | **SCOPE** | Monitors everything. Logs, metrics, traces. Knows what's happening. | Monitoring setup, debugging |
| **FinOps** | **VAULT** | Stops cloud bills from exploding. Optimizes AWS/GCP spend. | Cost optimization |
| **Performance** | **NITRO** | Makes things fast. Profiles, optimizes, removes bottlenecks. | Performance tuning |
| **Incident Commander** | **ZERO** | Leads during outages. Calm, structured, communicative. | SEV1 incidents, postmortems |

**Quick Commands:** `*slo`, `*pipeline`, `*logs`, `*cost`, `*profile`, `*sev1`

---

### ✨ Polish (5 agents)

| Agent | Call Sign | What They Do | When to Use Them |
|-------|-----------|--------------|------------------|
| **Copywriter** | **SCRIBE** | Writes UI text that converts. Microcopy, landing pages, error messages. | UX writing, marketing copy |
| **Accessibility** | **ACCESS** | Ensures WCAG compliance. Makes apps usable for everyone. | Accessibility audits |
| **Localization** | **TERRA** | Prepares apps for global markets. i18n, RTL, cultural context. | International expansion |
| **SEO Specialist** | **SIGNAL** | Gets you found on Google. Technical SEO, schema markup, speed. | SEO optimization |
| **Tech Writer** | **CODEX** | Writes documentation that developers actually read. | API docs, READMEs, guides |

**Quick Commands:** `*copy`, `*a11y`, `*localize`, `*rank`, `*docs`

---

### 🤖 AI Ecosystem (3 agents)

| Agent | Call Sign | What They Do | When to Use Them |
|-------|-----------|--------------|------------------|
| **AI Evaluator** | **JUDGE** | Tests LLM quality. Builds eval suites, measures accuracy. | LLM testing, prompt tuning |
| **AI Red Team** | **VIRUS** | Breaks AI safety guardrails. Finds prompt injection vulnerabilities. | AI security testing |
| **Integrations** | **NEXUS** | Connects to third-party APIs. OAuth, webhooks, middleware. | API integrations (Stripe, Twilio, etc.) |

**Quick Commands:** `*eval`, `*jailbreak`, `*connect`

---

### 🎯 Meta (3 special agents)

| Agent | Call Sign | What They Do | When to Use Them |
|-------|-----------|--------------|------------------|
| **Enforcer** | **WARDEN** | Generates structured protocols. Ensures you follow best practices. | Complex, high-risk tasks |
| **Orchestrator** | **DIRECTOR** | Routes you to the right agent. The "traffic cop". | When you're not sure who to call |
| **Base Protocol** | **APEX** | The cognitive DNA all agents inherit. Not directly callable. | — |

**Quick Commands:** `*enforce`, `*help`

---

## 📚 Complete Quick Reference

### 🛠️ Major Engineering Workflows

End-to-end processes for building software, usually involving multiple steps or agents.

| Workflow | Trigger Command | Goal |
|----------|-----------------|------|
| **Conduct Research** | `@beast-data` + `*define-metrics` | Validate problems with data/analytics before building |
| **Create PRD** | `/beast-pm` + `*create-prd` | Define requirements, success metrics, and scope |
| **Create Product Brief** | `/beast-pm` + `*create-brief` | Lightweight 1-page spec for small features |
| **Create Architecture** | `/beast-architect` + `*define-contract` | Design APIs, DB schemas, and system boundaries |
| **Create Epics & Stories** | `/beast-sm` + `*create-stories` | Break PRDs into shippable tickets with estimates |
| **Create UX Design** | `/beast-ux` + `*define-ux` | Create user flows, wireframes, and interaction patterns |
| **Create Tech Spec** | `@beast-architect` + `*define-spec` | Plan file-level implementation details |
| **Implement Story** | `/beast-dev` + `*implement-fix` | Write code based on specs and acceptance criteria |
| **Run Brainstorming** | `/beast-brainstormer` + `*brainstorm` | Generate 50+ divergent ideas for naming or solving problems |
| **Run Code Review** | `@beast-analyst` + `*code-review` | Analysis of PRs for bugs, security, and quality |
| **Implementation Readiness** | `/beast-enforcer` + `*enforce` | Pre-flight checklist before production deployment |
| **Sprint Planning** | `@beast-sm` + `*create-stories` | Plan the next 1-2 weeks of work and assign stories |
| **Test Design** | `/beast-qa` + `*review-feature` | Define Unit, Integration, and E2E testing strategies |
| **Setup Test Framework** | `@beast-dev` + `*implement-fix` | Install and configure Jest/Playwright/CI tools |

---

### ⚡ Agent Commands (The Tool Belt)

Specific actions you can trigger by loading a specific agent.

#### Core Squad
| Command | Agent | What It Does |
|---------|-------|--------------|
| `*analyze` | Analyst (ATLAS) | Root cause analysis with 5 Whys |
| `*define-contract` | Architect (MATRIX) | System design and API contracts |
| `*implement-fix` | Developer (FORGE) | Implement code fixes and features |
| `*create-prd` | PM (VANTAGE) | Write product requirements |
| `*review-feature` | QA (HUNTER) | Write test plans and find edge cases |
| `*create-stories` | Scrum Master (TEMPO) | Manage velocity and split stories |
| `*brainstorm` | Brainstormer (SPARK) | Ideation explosion |
| `*define-metrics` | Data Analyst (ORACLE) | Define tracking and KPIs |
| `*define-ux` | UX Designer (MUSE) | Wireframing and user flows |

#### Security Squad
| Command | Agent | What It Does |
|---------|-------|--------------|
| `*threat-model` | SecOps (AEGIS) | Security architecture review |
| `*scan` | Pentester (BREAKER) | Vulnerability simulation |
| `*audit` | Privacy (SENTINEL) | GDPR/Compliance check |

#### Growth Squad
| Command | Agent | What It Does |
|---------|-------|--------------|
| `*experiment` | Growth (APEX) | A/B test planning |
| `*pricing` | Pricing (LEDGER) | Monetization modeling |
| `*churn` | Retention (ANCHOR) | User retention analysis |
| `*support` | Support (RESOLVE) | Customer success workflows |
| `*value` | Value (COMPASS) | Value proposition mapping |

#### Ops Squad
| Command | Agent | What It Does |
|---------|-------|--------------|
| `*slo` | SRE (TITAN) | Reliability targets |
| `*pipeline` | DevOps (FLOW) | CI/CD automation |
| `*logs` | Observability (SCOPE) | Monitoring setup |
| `*cost` | FinOps (VAULT) | Cloud cost optimization |
| `*profile` | Performance (NITRO) | Speed/Latency tuning |
| `*sev1` | Incident (ZERO) | Outage management |

#### Polish Squad
| Command | Agent | What It Does |
|---------|-------|--------------|
| `*copy` | Copywriter (SCRIBE) | UX writing and marketing copy |
| `*a11y` | Accessibility (ACCESS) | WCAG compliance check |
| `*localize` | Localization (TERRA) | Translation and i18n prep |
| `*rank` | SEO (SIGNAL) | Search engine optimization |
| `*docs` | Tech Writer (CODEX) | Documentation generation |

#### AI Ecosystem
| Command | Agent | What It Does |
|---------|-------|--------------|
| `*eval` | AI Evaluator (JUDGE) | LLM quality testing |
| `*jailbreak` | Red Team (VIRUS) | AI safety and injection testing |
| `*connect` | Integrations (NEXUS) | API and third-party setup |

---

### 🤝 Collaboration Protocols

Modes of interaction when one agent isn't enough.

| Protocol | Command | Description | Best For |
|----------|---------|-------------|----------|
| **Party Mode** | `*party-mode` | **Simultaneous Debate.** A facilitator selects 2-3 agents to debate a topic and reach consensus. | Strategic decisions, architecture trade-offs |
| **Sequential Flow** | `@agent-a` then `@agent-b` | **Linear Handoff.** Manually chaining agents (PM → Architect → Dev). | Feature implementation, bug fixes |
| **Structured Protocol** | `/beast-enforcer` + `*enforce` | **Strict Checklist.** Generates a rigid step-by-step plan for high-risk tasks. | Migrations, audits, compliance |

---

### ⚙️ Setup & Maintenance Actions

| Action | Command / Method | Use Case |
|--------|------------------|----------|
| **Install (New Project)** | `npx bmad-method@alpha install` | Setting up a greenfield project |
| **Install (Existing)** | `npx bmad-method@alpha install` | Adding agents to an existing project |
| **Verify Install** | `ls _bmad/beast-mode/agents/` | Checking if agents are present |
| **Reload IDE** | `Cmd+Shift+P` → `Reload Window` | Forcing OpenCode/Antigravity to recognize new agents |
| **Update Agents** | Edit Source → `npx bmad... install` | Syncing changes from your library to your project |
| **Build Agent** | `npx bmad-method@alpha build <agent>` | Rebuild a customized agent |

---

## 🔄 Updating Your Agents

### How It Works
You have **two copies** of Beast Mode:
1.  **Source (The Master):** `Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode`
2.  **Installed (The Copy):** `your-project/_bmad/beast-mode/`

> ⚠️ **CRITICAL: The Golden Rule**  
> **ONLY edit the Source.** NEVER edit files in `your-project/_bmad/beast-mode/`.  
> Those changes will be **lost** when you update. Always work in the Source directory.

---

### Update Workflow

**1. Edit the source**
```bash
cd Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode
vim agents/core/analyst.md
```

**2. (Optional) Push to GitHub**
```bash
git add . && git commit -m "Improved ATLAS analysis flow"
git push origin main
```

**3. Sync to your project**

> ⚠️ **WARNING: This will overwrite your installed copy**  
> Any edits you made directly in `_bmad/beast-mode/` will be lost.  
> Make sure you've saved any important changes to the Source first.

**Option A: Clean reinstall** (Safest)
```bash
cd your-project
npx bmad-method@alpha install
# Select: Modify BMAD Installation → Update custom modules
```

**Option B: Manual copy** (Fastest)
```bash
cd your-project
cp -R Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode/* _bmad/beast-mode/
```

---

## 📚 Workflows & Guides

### 🌱 Greenfield vs 🏭 Brownfield — Know the Difference

| Type | What It Is | When You Use It | Key Challenge |
|------|------------|-----------------|---------------|
| **Greenfield** 🌱 | Starting from **zero**. Empty repo. No legacy code. | New app, new feature in a new codebase | Analysis paralysis. Too many choices. |
| **Brownfield** 🏭 | Working in **existing systems**. Legacy code. Technical debt. | Adding features to existing apps, refactoring | Understanding what's already there. Not breaking things. |

**The Rule:**
- **Greenfield:** Use the full BMAD method (Research → PRD → Architecture → Stories → Implementation)
- **Brownfield:** Skip to what you need. Already have architecture? Jump to Stories.

---

### ⚡ Common Workflows (Quick Reference)

| Workflow | What It Does | When to Use | Agent Squad |
|----------|--------------|-------------|-------------|
| **Research** | Validates the problem. Finds evidence users actually want this. | Before writing a PRD for a new feature | ORACLE, COMPASS, SPARK |
| **PRD Creation** | Defines *what* to build and *why*. Business case, requirements, success metrics. | Every new feature. Every refactor. Every major change. | VANTAGE, ORACLE |
| **Product Brief** | Lightweight PRD. 1-pager. For small features. | Quick experiments, minor features | VANTAGE |
| **UX Design** | Creates user flows, wireframes, interaction patterns. | When UI/UX changes significantly | MUSE, ACCESS |
| **Architecture** | Designs the technical system. APIs, databases, services, contracts. | New features, refactors, migrations | MATRIX, AEGIS |
| **Tech Spec** | Detailed implementation plan. File-level changes, algorithms, edge cases. | Before coding anything non-trivial | MATRIX, FORGE |
| **Epics & Stories** | Breaks work into shippable chunks. Defines acceptance criteria. | After PRD, before implementation | TEMPO, VANTAGE |
| **Brainstorming** | Generates 100 ideas. Divergent thinking. No bad ideas. | Naming, feature concepts, problem solving | SPARK |
| **Implementation** | Writes the code. Ships the feature. | After stories are defined | FORGE, HUNTER |
| **Code Review** | Catches bugs, tech debt, security issues before merge. | Before every PR merge | ATLAS, HUNTER, AEGIS |
| **Test Design** | Defines test strategy. Unit, integration, E2E. | Before or during implementation | HUNTER |
| **Test Framework** | Sets up testing infrastructure (Jest, Pytest, etc.) | Once per project, or when adding new test types | FORGE, HUNTER |
| **Sprint Planning** | Plans the next 1-2 weeks. Assigns stories, estimates effort. | Start of every sprint | TEMPO, VANTAGE |
| **Implementation Readiness** | Pre-flight checklist. Are we ready to ship? | Before deploying to production | WARDEN, HUNTER, AEGIS |
| **Party Mode** 🎉 | Multi-agent collaboration. Agents work together in real-time. | Complex tasks requiring multiple perspectives | All agents |

---

### 📖 Detailed Workflow Guides

---

#### 🔬 **How to Conduct Research**

**Goal:** Validate the problem before building the solution.

**When to use:**
- You have an idea but no proof users want it
- Stakeholders are divided on priorities
- You're entering a new market

**The Flow:**
```bash
# 1. Load the research squad
@beast-data-analyst @beast-user-value

# 2. Define the hypothesis
"We believe users will pay for dark mode because [reason]"

# 3. Gather evidence
- User interviews (talk to 5-10 users)
- Analytics data (current behavior patterns)
- Competitor analysis (what do others do?)

# 4. Oracle analyzes the data
*define-metrics context: 'Dark mode adoption and willingness to pay'

# 5. Compass maps to user value
*value-analysis context: 'How does dark mode fit our value prop?'
```

**Outputs:**
- Research summary (What did we learn?)
- Recommendation (Build it? Kill it? More research?)
- Success metrics (How will we measure it?)

---

#### 📝 **How to Create a PRD**

**Goal:** Define *what* to build, *why*, and *for who*.

**When to use:**
- Every significant feature
- Every refactor that impacts users
- Anytime someone says "we should build X"

**The Flow:**
```bash
# 1. Load Product Manager
/beast-pm

# 2. Create the PRD
*create-prd context: 'Feature name and high-level goal'

# 3. Vantage asks clarifying questions:
# - Who is this for?
# - What problem does it solve?
# - How do we measure success?
# - What's out of scope?

# 4. Review with stakeholders
# Get alignment before writing code
```

**PRD Structure (Enforced by VANTAGE):**
```markdown
## Problem Statement
What's broken? What's the pain?

## Solution
What are we building? (High-level only)

## Success Metrics
How do we know it worked?

## Out of Scope
What are we explicitly NOT doing?

## Risks
What could go wrong?
```

**Brownfield Note:** VANTAGE will scan your `docs/` folder to understand existing context.

---

#### 📄 **How to Create a Product Brief**

**Goal:** Lightweight PRD. One page. Fast decisions.

**When to use:**
- Small features
- Experiments
- Internal tools

**The Flow:**
```bash
/beast-pm
*create-brief context: 'Add CSV export to dashboard'
```

**Brief Structure:**
- **What:** 2 sentences
- **Why:** 2 sentences  
- **Success:** 1 metric
- **Scope:** Bullet list

**Rule:** If it takes >1 page, it's a PRD, not a brief.

---

#### 🏗️ **How to Create Architecture**

**Goal:** Design the system *before* writing code.

**When to use:**
- New features that touch multiple services
- Migrations (DB, auth, cloud provider)
- Performance optimizations
- Anytime you hear "this will be complex"

**The Flow:**
```bash
# 1. Load Architect (and Security if needed)
/beast-architect
# OR for secure systems:
@beast-architect @beast-sec-ops

# 2. Provide context
*define-contract context: '
Feature: Real-time notifications
Stack: Node.js, Postgres, Redis
Constraints: <100ms latency, 10k concurrent users
'

# 3. Matrix designs the system
# - Database schema
# - API contracts
# - Service boundaries
# - Data flow diagrams

# 4. Review with team
# Catch design flaws before coding
```

**Outputs:**
- Architecture diagrams
- API contracts (request/response schemas)
- Database schema
- Deployment architecture
- Risk assessment

**Brownfield Tip:** Run this first:
```bash
@beast-architect Scan the codebase and document current architecture
```
Then design your new feature to *fit* the existing system.

---

#### 📋 **How to Create Epics and Stories**

**Goal:** Break work into shippable chunks.

**When to use:**
- After PRD approval
- Before sprint planning
- Anytime work feels "too big to estimate"

**The Flow:**
```bash
# 1. Load Scrum Master
/beast-sm

# 2. Break down the PRD
*create-stories context: 'PRD: Dark Mode Feature'

# 3. Tempo creates a hierarchy:
Epic: Dark Mode
├── Story 1: API support for theme preference
├── Story 2: CSS dark mode styles  
├── Story 3: Toggle UI component
└── Story 4: Persist user preference

# 4. Each story gets:
- Title
- Description
- Acceptance Criteria (testable)
- Estimate (story points or hours)
```

**Story Quality Checklist:**
- [ ] Can be completed in < 1 week
- [ ] Has clear acceptance criteria
- [ ] Is testable
- [ ] Delivers user value (or enables future value)

---

#### 🎨 **How to Create UX Design**

**Goal:** Design the interface *before* building it.

**When to use:**
- New user-facing features
- Redesigns
- Complex user flows (onboarding, checkout, etc.)

**The Flow:**
```bash
# 1. Load UX Designer
/beast-ux

# 2. Define the flow
*define-ux context: '
Feature: Onboarding flow for new users
Goal: Get users to "aha moment" in <2 minutes
'

# 3. Muse creates:
- User flow diagram
- Wireframes (low-fidelity)
- Interaction patterns
- Accessibility notes

# 4. Optional: Get mockups
@beast-ux Create high-fidelity mockups for the login screen
```

**Skip UX if:**
- You're only changing backend logic
- The UI change is trivial (e.g., changing a button color)

---

#### 🔧 **How to Create a Tech Spec**

**Goal:** Plan implementation at the file/function level.

**When to use:**
- Before implementing complex stories
- Refactors
- Performance optimization
- Anytime you're not 100% sure how to build it

**The Flow:**
```bash
# 1. Load Architect + Dev
@beast-architect @beast-dev

# 2. Create spec
*define-spec context: 'Story: Add rate limiting to API'

# 3. They collaborate to define:
- Files to change
- New files to create
- Algorithm/logic
- Edge cases to handle
- Testing strategy
```

**Tech Spec Structure:**
```markdown
## Changes Required
### Modified Files
- `src/api/middleware.ts` - Add rate limit check
- `src/config.ts` - Add rate limit config

### New Files
- `src/middleware/rateLimiter.ts` - Core logic

## Implementation Steps
1. Install `express-rate-limit` package
2. Configure limits (100 req/min per IP)
3. Add middleware to Express app
4. Add tests

## Edge Cases
- What if Redis is down? (Graceful degrade)
- What if IP is behind proxy? (Use X-Forwarded-For)

## Rollout Plan
- Deploy behind feature flag
- Enable for 10% traffic
- Monitor error rates
```

---

#### 💻 **How to Implement a Story**

**Goal:** Ship the code.

**When to use:**
- After stories and tech specs are defined
- When you have clear acceptance criteria

**The Flow:**
```bash
# 1. Load Developer
/beast-dev

# 2. Implement
*implement-story context: 'Story: Add dark mode toggle'

# OR for bug fixes:
*implement-fix context: 'Bug: Login fails on mobile Safari'

# 3. Forge writes code following:
- Your coding standards
- The tech spec
- The acceptance criteria

# 4. Test locally
# 5. Create PR
```

**Quality Checks (FORGE enforces these):**
- [ ] Code runs without errors
- [ ] Acceptance criteria met
- [ ] Tests added/updated
- [ ] No security vulnerabilities

---

#### 💡 **How to Run a Brainstorming Session**

**Goal:** Generate 100 ideas. Find the one gem.

**When to use:**
- Naming things (products, features, variables)
- Stuck on a problem
- Need creative solutions

**The Flow:**
```bash
# 1. Load Creative
/beast-spark

# 2. Define the challenge
*brainstorm context: 'We need a name for our personal finance app'

# 3. Spark generates:
- 50+ name ideas
- Grouped by theme (trust, speed, simplicity, etc.)
- With reasoning for each

# 4. Pick your favorite, or...
@beast-spark Take the top 5 and create taglines for each
```

**Pro Tip:** Combine with UX
```bash
@beast-spark @beast-ux 
Generate 10 app name ideas, then create a logo concept for the best one
```

---

#### 🔍 **How to Run Code Review**

**Goal:** Catch bugs, security issues, and tech debt before merge.

**When to use:**
- Before every PR merge
- During pair programming
- Post-incident (reviewing the broken code)

**The Flow:**
```bash
# 1. Load Analyst + QA + Security
@beast-analyst @beast-qa @beast-sec-ops

# 2. Review the code
*review-code context: 'PR #123: Add OAuth login'

# 3. They check for:
- Bugs (ATLAS)
- Security vulnerabilities (AEGIS)  
- Test coverage (HUNTER)
- Code quality (ATLAS)

# 4. Get a report:
```

**Code Review Report Structure:**
```markdown
## 🐛 Bugs Found
- Line 45: Null pointer if user.email is undefined

## 🔒 Security Issues  
- Line 78: SQL injection risk (use parameterized query)

## ✅ Test Coverage
- Missing: Edge case when OAuth provider is down

## 💡 Suggestions
- Extract this 50-line function into smaller units
```

---

#### ✅ **How to Run Implementation Readiness**

**Goal:** Pre-flight checklist before production deploy.

**When to use:**
- Before every production deployment
- Before major releases
- After incident recovery (are we safe to redeploy?)

**The Flow:**
```bash
# 1. Load Enforcer
/beast-enforcer

# 2. Run readiness check
*implementation-readiness context: 'Deploying v2.0 to production'

# 3. Warden generates checklist:
```

**Readiness Checklist:**
```markdown
## ✅ Code Quality
- [ ] All tests passing?
- [ ] Code review approved?
- [ ] No critical bugs in backlog?

## ✅ Security
- [ ] Security scan clean?
- [ ] Secrets rotated?
- [ ] Auth working in staging?

## ✅ Infrastructure
- [ ] Database migrations tested?
- [ ] Rollback plan defined?
- [ ] Monitoring alerts configured?

## ✅ Team
- [ ] On-call engineer identified?
- [ ] Communication plan ready?
- [ ] Incident runbook updated?
```

---

#### 📅 **How to Run Sprint Planning**

**Goal:** Plan the next 1-2 weeks of work.

**When to use:**
- Start of every sprint (usually every 2 weeks)
- When priorities shift mid-sprint

**The Flow:**
```bash
# 1. Load Scrum Master + Product
@beast-sm @beast-pm

# 2. Plan the sprint
*sprint-plan context: '
Team: 3 engineers
Velocity: 20 story points/sprint
Priority: Ship dark mode v1
'

# 3. They collaborate to:
- Review backlog
- Prioritize stories
- Estimate effort
- Assign work
- Identify risks
```

**Sprint Plan Output:**
```markdown
## Sprint Goal
Ship Dark Mode MVP to 10% of users

## Stories in Sprint
1. [5pts] API: Theme preference endpoint
2. [3pts] UI: Dark mode toggle component
3. [8pts] CSS: Dark mode styles for all pages
4. [2pts] Testing: E2E tests for theme switching
5. [2pts] Docs: Update user guide

Total: 20 points (matches velocity)

## Risks
- CSS work might uncover edge cases (+3 pts)
- Mitigation: Keep styling simple, defer polish to Sprint 2
```

---

#### 🧪 **How to Run Test Design**

**Goal:** Define testing strategy before (or during) coding.

**When to use:**
- Before implementing complex features
- When test coverage is low
- After incidents (how do we prevent this?)

**The Flow:**
```bash
# 1. Load QA
/beast-qa

# 2. Design tests
*test-design context: 'Feature: OAuth login'

# 3. Hunter defines:
- Unit tests (what to test)
- Integration tests (how components interact)
- E2E tests (full user flows)
- Edge cases (what could go wrong)
```

**Test Design Output:**
```markdown
## Unit Tests
- `validateToken()` with valid/invalid/expired tokens
- `refreshToken()` with network failures

## Integration Tests  
- OAuth callback handler with real test OAuth server
- Session persistence across requests

## E2E Tests
- Complete login flow (click button → redirect → callback → authenticated)
- Security: CSRF protection works
- Security: Token is HTTPOnly cookie

## Edge Cases
- What if OAuth provider is down? (Show error, don't crash)
- What if user denies permission? (Redirect to login with message)
```

---

#### 🧪 **How to Set Up a Test Framework**

**Goal:** Install and configure testing tools.

**When to use:**
- New project setup
- Adding new test types (e.g., adding E2E to a project that only has unit tests)

**The Flow:**
```bash
# 1. Load Dev + QA
@beast-dev @beast-qa

# 2. Set up framework
*setup-testing context: '
Stack: React, Node.js
Tests needed: Unit, Integration, E2E
'

# 3. They install and configure:
- Jest (unit tests)
- React Testing Library (component tests)
- Playwright (E2E tests)
- Coverage reporting

# 4. They create:
- Sample tests
- CI/CD integration
- Documentation
```

**What Gets Installed:**
```bash
# Packages
npm install -D jest @testing-library/react playwright

# Config files
- jest.config.js
- playwright.config.js
- .github/workflows/test.yml (CI)

# Example tests
- src/__tests__/example.test.ts
- e2e/login.spec.ts

# Documentation
- docs/testing-guide.md
```

---

#### 🎉 **How to Set Up Party Mode**

**Goal:** Make multiple agents collaborate in real-time.

**What it is:**
Party Mode = Multiple agents working together on one task, like a pair programming session but with 3-5 specialists.

**When to use:**
- Complex problems requiring multiple perspectives
- Exploratory work (research + design + tech feasibility)
- High-stakes decisions (architecture + security + performance)

**The Flow:**

**Method 1: Explicit Party Mode**
```bash
# Load multiple agents at once
@beast-architect @beast-dev @beast-sec-ops @beast-qa

# Give them a shared goal
Design, implement, secure, and test a payment processing system
```

**Method 2: Sequential Handoff (Structured)**
```bash
# Step 1: Product defines it
@beast-pm Write a PRD for subscription billing

# Step 2: Architect designs it  
@beast-architect Review this PRD and design the system

# Step 3: Security reviews
@beast-sec-ops Review this architecture for vulnerabilities

# Step 4: Dev implements
@beast-dev Implement this architecture

# Step 5: QA tests
@beast-qa Create a test plan for this feature
```

**Method 3: Real-Time Collaboration (@mentions)**
```
@beast-pm @beast-ux @beast-architect 

I want to add a "refer a friend" feature. 
- PM: Validate if users want this
- UX: Design the flow
- Architect: Technical feasibility check

Work together and give me a go/no-go decision.
```

**Party Mode Output:**
Multiple agents contribute to a shared thread, each adding their expertise. The result is a **multi-perspective analysis** that catches blind spots.

**Example Output:**
```markdown
@beast-pm (VANTAGE):
✅ Strong signal: 40% of surveyed users would use referrals
✅ Comparable apps see 15-20% viral coefficient
My recommendation: Build it.

@beast-ux (MUSE):
✅ Flow: User clicks "Refer" → Copy link → Share on social
⚠️ Risk: Needs clear value prop (what does referrer get?)
My recommendation: Build, but incentivize referrer.

@beast-architect (MATRIX):
✅ Technically simple: Generate unique code, track signups
⚠️ Risk: Fraud (users referring themselves)
My recommendation: Build, add fraud detection.

CONSENSUS: ✅ GO. Build with referral rewards + fraud checks.
```

---

## 🆘 Common Issues & Fixes

### ❌ "Folder `_bmad/beast-mode/` doesn't exist"

**Why:** The module path wasn't correct during install.

**Fix:**
```bash
# 1. Verify source exists
ls Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode/module.yaml

# 2. Reinstall with exact path
npx bmad-method@alpha install
# When prompted: Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode
```

---

### ❌ "Agent not found"

**Why:** Your IDE doesn't know where agents are.

**Fix:**
```bash
# Check config
cat .antigravity/agents.json

# Verify agents exist
ls _bmad/beast-mode/agents/core/
# Should show: analyst.md, dev.md, architect.md, etc.
```

---

### ❌ "`*workflow-init` doesn't work"

**Why:** You didn't install the **BMM** module (the official BMAD workflows).

**Fix:**
```bash
npx bmad-method@alpha install
# Select: BMM: BMad Method Agile-AI Driven-Development
```

**Note:** Beast Mode gives you *agents*. BMM gives you *workflows*. You need both for full power.

---

## 🔗 Links & Resources

| Resource | Link |
|----------|------|
| **Beast Mode GitHub** | [github.com/SamuelSaha/bmad-beast-mode](https://github.com/SamuelSaha/bmad-beast-mode) |
| **Official BMAD** | [github.com/bmad-code-org/BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD) |
| **BMAD Docs** | [bmad-method.org](https://bmad-method.org) |

---

**v3.2 — "Apex Predator" Edition**  
For BMAD Method v6.0.0-alpha.22+  
Built with 🔥 by Beast Mode
