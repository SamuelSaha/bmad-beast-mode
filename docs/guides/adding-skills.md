# 🧬 ADDING SKILLS TO BEAST MODE

This guide explains how to create and use Skills in your Beast Mode setup.

---

## 🤔 What Are Skills?

**Skills** are the third layer of the Beast Mode capability stack:

```
┌─────────────────────────────────────────────────────────────────┐
│                      WORKFLOWS (The Rail)                       │
│   Orchestrate sequences of work with gates and checkpoints      │
├─────────────────────────────────────────────────────────────────┤
│                       AGENTS (The Who)                          │
│   Personas with expertise, commands, and quality gates          │
├─────────────────────────────────────────────────────────────────┤
│                       SKILLS (The Toolbox)                      │
│   Deep domain knowledge + scripts + templates                   │
└─────────────────────────────────────────────────────────────────┘
```

**Key Difference:**
- **Agents** know *how to think* about a problem
- **Skills** provide *what to do* with precision

---

## 📁 Skill File Location

All skills live in the `skills/` folder, organized by category:

```
skills/
├── README.md
├── foundation/          # Stack-specific mastery
│   ├── supabase-mastery/
│   ├── next15-patterns/
│   └── typescript-precision/
├── security/            # Security & compliance
│   └── zero-trust/
├── growth/              # Monetization & fiscal
│   └── french-fiscal/
├── ops/                 # Infrastructure & reliability
│   ├── cicd-pipelines/
│   └── observability/
├── polish/              # Quality & accessibility
│   └── accessibility-wcag/
└── ai/                  # AI/LLM patterns
    └── prompt-engineering/
```

---

## 🛠️ Step-by-Step: Creating a New Skill

### Step 1: Create the Directory

```bash
cd /Users/samuelsaha/Desktop/BMAD-METHOD-SAMSAM/bmad-beast-mode

# Create skill directory
mkdir -p skills/[category]/[skill-name]
```

### Step 2: Write the SKILL.md

Every skill MUST have a `SKILL.md` file with frontmatter:

```markdown
---
name: My Skill Name
description: What this skill provides
version: 1.0.0
primary_agents: [beast-dev, beast-architect]
---

# 🎯 My Skill Name

> **ACTIVATION:** One-line description of what happens when this skill is loaded.

---

## 🎯 Core Competencies

1. **Competency 1** — Description
2. **Competency 2** — Description

---

## 📐 PATTERNS

### Pattern Name
```typescript
// Code example
```

---

## ❌ ANTI-PATTERNS

- Never do X
- Avoid Y

---

## ✅ CHECKLIST

- [ ] Verification item 1
- [ ] Verification item 2
```

### Step 3: Add Scripts (Optional)

For automation capabilities:

```bash
mkdir skills/[category]/[skill-name]/scripts
```

```bash
# skills/ops/my-skill/scripts/audit.sh
#!/bin/bash
echo "Running audit..."
# Your automation here
```

### Step 4: Add Examples (Optional)

```bash
mkdir skills/[category]/[skill-name]/examples
```

```typescript
// skills/foundation/my-skill/examples/pattern.ts
export function examplePattern() {
  // Reference implementation
}
```

### Step 5: Register in module.yaml

```yaml
exports:
  skills:
    # ... existing skills ...
    my-skill: skills/[category]/[skill-name]/SKILL.md
```

---

## 🔧 How to Use Skills

### Method 1: Direct Loading (Recommended)

When working with an agent, instruct them to load the skill:

```
@beast-dev Use the supabase-mastery skill to implement RLS policies.
```

The agent will:
1. Read the SKILL.md
2. Apply the patterns
3. Follow the checklist

### Method 2: Workflow Integration

In `/skill-feature` workflow, skills are loaded automatically based on feature type:

| Feature Type | Auto-Loaded Skills |
|--------------|-------------------|
| Auth work | `zero-trust`, `supabase-mastery` |
| UI work | `accessibility-wcag`, `next15-patterns` |
| API work | `typescript-precision`, `observability` |

### Method 3: Explicit View

For manual reference:

```bash
# In chat
View the file skills/foundation/supabase-mastery/SKILL.md
```

---

## 📋 Skill Quality Checklist

Before adding a skill, verify:

- [ ] **SKILL.md exists** with proper frontmatter
- [ ] **Core competencies** clearly listed
- [ ] **Patterns** include working code examples
- [ ] **Anti-patterns** prevent common mistakes
- [ ] **Checklist** enables verification
- [ ] **Registered** in module.yaml exports
- [ ] **Primary agents** identified

---

## 🎯 Skill Design Principles

### 1. Precision Over Generality
Skills should provide **exact patterns**, not vague guidance.

**Bad:** "Use proper error handling"
**Good:** 
```typescript
try {
  const result = await operation()
  return { success: true, data: result }
} catch (error) {
  logger.error({ event: 'operation_failed', error })
  return { success: false, error: error.message }
}
```

### 2. Executable Over Theoretical
Include code that can be **directly copy-pasted**.

### 3. Specific Anti-Patterns
Document what NOT to do based on real mistakes.

### 4. Verification Checklists
Every skill should end with a testable checklist.

---

## 🔄 Skill vs Agent vs Workflow

| Aspect | Agent | Skill | Workflow |
|--------|-------|-------|----------|
| **Question** | Who does it? | What do they know? | In what order? |
| **Focus** | Persona & judgment | Domain expertise | Orchestration |
| **Example** | "Senior Dev" | "Supabase patterns" | "Feature pipeline" |
| **Unique to** | Role-based behavior | Reusable knowledge | Process sequence |

---

## 📊 Current Skills Registry

| Skill | Category | Primary Agents |
|-------|----------|----------------|
| `supabase-mastery` | foundation | dev, architect, sec |
| `next15-patterns` | foundation | dev, architect, perf |
| `typescript-precision` | foundation | dev, architect |
| `zero-trust` | security | sec, dev, architect |
| `french-fiscal` | growth | finance, dev |
| `cicd-pipelines` | ops | devops, sre |
| `observability` | ops | o11y, sre, devops |
| `accessibility-wcag` | polish | a11y, ux, dev |
| `prompt-engineering` | ai | eval, dev, architect |

---

## 🆘 Troubleshooting

### Skill not loading?
1. Verify SKILL.md exists at the path
2. Check frontmatter is valid YAML
3. Ensure registered in module.yaml

### Agent not using skill patterns?
1. Explicitly instruct: "Use the [skill] patterns"
2. Reference specific sections: "Follow the RLS Protocol from supabase-mastery"

### Skill outdated?
1. Update the SKILL.md with new patterns
2. Increment the version in frontmatter
