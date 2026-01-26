# Adding New Agents to Beast Mode

This guide explains exactly how to create and register new agents in your Beast Mode custom module.

---

## 📁 Agent File Location

All agents live in the `agents/` folder, organized by squad:

```
agents/
├── orchestrator.md      # Main router (special)
├── meta/
│   └── enforcer.md      # Protocol Enforcer
├── core/                # Essential workflow agents
├── security/            # Security & privacy
├── growth/              # Product & monetization
├── ops/                 # Infrastructure & reliability
├── polish/              # Quality & documentation
└── ai-eco/              # AI/ML features
```

---

## 🛠️ Step-by-Step: Creating a New Agent

### Step 1: Create the File

```bash
cd /Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode

# Choose the right squad folder
touch agents/core/my-agent.md
# or: agents/security/my-agent.md
# or: agents/ops/my-agent.md
# etc.
```

### Step 2: Write the Agent Definition

Use this template:

```markdown
# BMAD-AGENT: Agent Name

activation-notice: |
  ACTIVATE [AGENT NAME].
  Your goal: [One sentence describing purpose].
  Output: [What artifacts this agent creates].

agent:
  name: AgentName
  role: Short role description
  when_to_use: When this agent should be activated.

  persona:
    style: "How this agent communicates"
    tone: Professional, Direct, Friendly, etc.
    principles:
      - "First principle this agent follows"
      - "Second principle"
      - "Third principle"

  # ============================================================================
  # TECHNIQUES
  # ============================================================================
  techniques:
    technique_one:
      description: "What this technique does"
      when_to_use: "Scenario for using this technique"
      steps:
        1. First step
        2. Second step
        3. Third step
      example: |
        Input: [example input]
        Output: [example output]

  # ============================================================================
  # COMMANDS
  # ============================================================================
  commands:
    my-command:
      description: "What this command does"
      usage: "*my-command context: '{details}'"
      steps:
        1. Parse the input
        2. Apply techniques
        3. Generate output
      output: "Describe what gets created"
      time_limit: "5-15 minutes"

    another-command:
      description: "Another command"
      usage: "*another-command"
      steps:
        1. Step one
        2. Step two

  # ============================================================================
  # QUALITY GATES
  # ============================================================================
  quality_gates:
    - "Gate 1: Must do X before proceeding"
    - "Gate 2: Must verify Y"
    - "Gate 3: Must produce Z"

  # ============================================================================
  # ANTI-PATTERNS
  # ============================================================================
  anti_patterns:
    - "❌ DO NOT do this thing"
    - "❌ DO NOT skip that step"
    - "❌ DO NOT assume without evidence"

  # ============================================================================
  # OUTPUT TEMPLATE
  # ============================================================================
  output_template: |
    # [Title]

    ## Section 1
    [Content]

    ## Section 2
    [Content]

    ## Next Steps
    - [ ] Action 1
    - [ ] Action 2
```

### Step 3: Register in module.yaml

Open `module.yaml` and add your agent to the `exports.agents` section:

```yaml
exports:
  agents:
    # ... existing agents ...
    
    # Add your new agent
    my-agent: agents/core/my-agent.md
    
    # If you want an alias (V4 compatibility)
    my-alias: agents/core/my-agent.md
```

### Step 4: Sync to Global Library

```bash
# Copy changes to the global library
cp -r /Users/samuelsaha/Desktop/BMAD-METHOD-SAMSAM/bmad-beast-mode/* /Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode/
```

### Step 5: Install to Your Project

```bash
cd ~/Desktop/your-project

# Option A: Full reinstall
npx bmad-method@alpha install

# Option B: Manual copy (faster)
cp -R /Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode/agents/ _bmad/beast-mode/agents/
cp /Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode/module.yaml _bmad/beast-mode/
```

### Step 6: Test Your Agent

```bash
npx bmad session

> /load my-agent
> *my-command context: 'test input'
```

---

## 📋 Agent Quality Checklist

Before adding an agent, verify:

- [ ] **Single Responsibility:** Agent does ONE thing well
- [ ] **Clear Activation:** When to use this agent is obvious
- [ ] **Defined Commands:** Every command has steps and output
- [ ] **Quality Gates:** Agent knows when to stop
- [ ] **Anti-Patterns:** Common mistakes are documented
- [ ] **Output Template:** Artifact structure is defined
- [ ] **Registered:** Added to module.yaml exports

---

## 🎯 Agent Design Principles

### 1. Narrow the Lane
Each agent should have a specific focus. Don't create a "does everything" agent.

**Bad:** "General Developer Agent"  
**Good:** "Frontend Component Developer" or "API Endpoint Developer"

### 2. Define Clear Handoffs
Each agent should know:
- What input it expects (from previous agent)
- What output it produces (for next agent)

### 3. Include Time Limits
Every command should have a time limit to prevent scope creep.

```yaml
commands:
  analyze:
    time_limit: "15 minutes max"
```

### 4. Provide Concrete Examples
Abstract instructions lead to hallucination. Include examples.

```yaml
techniques:
  five_whys:
    example: |
      Problem: Button doesn't work
      Why 1: onClick not firing → Why?
      Why 2: Event listener missing → Why?
      ...
```

---

## 🔧 Modifying Existing Agents

### Don't Edit Inside `_bmad/`

```bash
# ❌ WRONG - Changes lost on update
vim ~/Desktop/my-project/_bmad/beast-mode/agents/core/analyst.md

# ✅ CORRECT - Edit source, then reinstall
vim /Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode/agents/core/analyst.md
# Then reinstall
```

### Extending an Agent

To add a new command to an existing agent:

1. Open the source file:
   ```bash
   vim /Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode/agents/core/analyst.md
   ```

2. Add your command in the `commands:` section:
   ```yaml
   commands:
     # ... existing commands ...
     
     my-new-command:
       description: "What it does"
       steps:
         1. Step one
         2. Step two
   ```

3. Reinstall to project.

---

## 📊 Agent Reference Card

| Component | Purpose | Required |
|-----------|---------|----------|
| `activation-notice` | First message when loaded | Yes |
| `name` | Agent identifier | Yes |
| `role` | One-line description | Yes |
| `when_to_use` | Activation trigger | Yes |
| `persona` | Communication style | Recommended |
| `techniques` | Methods the agent applies | Recommended |
| `commands` | Actionable triggers | Yes |
| `quality_gates` | Exit criteria | Recommended |
| `anti_patterns` | What NOT to do | Recommended |
| `output_template` | Artifact structure | Recommended |

---

## 🆘 Troubleshooting

### Agent not appearing after install
1. Check file exists: `ls /Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode/agents/core/my-agent.md`
2. Check module.yaml has the export
3. Reinstall: `npx bmad-method@alpha install`

### Agent commands not recognized
1. Check command is in `commands:` section with correct indentation
2. Verify YAML syntax (use a YAML linter)

### Agent gives wrong outputs
1. Review the `output_template` section
2. Add more specific examples in techniques
3. Tighten the `anti_patterns` section
