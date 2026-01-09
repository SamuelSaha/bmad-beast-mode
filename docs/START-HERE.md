# 🚦 START HERE: Beast Mode Speed Dial
**One Command to Rule Them All.**

Don't read the whole manual. Just pick a button below.

## 1. Start a New Task
Copy and paste this into your agent window:

```bash
*start
```

Then choose your path:

### 🩹 Micro-Fix (Bug/Tweak)
*For small changes < 30 mins.*
```bash
*workflow-init context: "Fix [bug description]. Evidence: [paste logs]" workflow: micro-fix
```

### ✨ Standard Feature
*For new features ~1-3 days.*
```bash
*workflow-init context: "Add [feature name]. User story: As a [persona], I want [action]..."
```

### 🧠 Brainstorming
*When you don't know what to build.*
```bash
*brainstorm topic: "[Just 3 words]"
```

---

## 2. The "God File" Rule
**STOP REPEATING YOURSELF.**
Create a `PROJECT_CONTEXT.md` in your project root.
[Copy the Template](../templates/00-project-context.tmpl.md)

Then tell the agent:
> "Read PROJECT_CONTEXT.md before answering."

---

## 3. Automation (Makefile)
If you hate typing, add this `Makefile` to your project root:

```makefile
plan:
	opencode -c "/analyst"
code:
	opencode -c "/dev"
update:
	cd _bmad/modules/beast-mode && git pull
```
