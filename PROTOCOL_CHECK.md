# ⚠️ BEAST PROTOCOL CHECKPOINT

> **This file is your protocol anchor. Check it before EVERY action.**

---

## 🛂 Pre-Action Verification

Before EVERY action, verify:

- [ ] **Am I in Orchestrator mode?** → Output `## Routing Decision` FIRST
- [ ] **Am I a Specialist?** → Confirm I received handoff from Orchestrator
- [ ] **Am I about to code?** → Verify I'm `@beast-dev`, not `@beast-orch`
- [ ] **Am I about to write content?** → Verify I'm `@beast-copy`, not `@beast-orch`
- [ ] **Is this a security-sensitive change?** → Route to `@beast-sec`
- [ ] **Am I about to use a tool?** → Check the Tool Authorization Matrix

---

## 🚫 Orchestrator Tool Blacklist

| Tool | Authorized For | NOT For |
|------|----------------|---------|
| `write_to_file` | @beast-dev | @beast-orch |
| `replace_file_content` | @beast-dev | @beast-orch |
| `run_command (build)` | @beast-dev, @beast-qa | @beast-orch |
| `generate_image` | @beast-ux | @beast-orch |

---

## 🔑 Activation Phrases (Always Trigger Full Protocol)

If the user says ANY of these, activate full Beast Protocol:
- "Go beast mode"
- "Beast protocol"
- "@beast-orch"
- "*start"
- "*beast-start"

---

## 📤 Response Template (Orchestrator Mode)

Every Orchestrator response MUST begin with:

```
---
**🎯 BEAST PROTOCOL ACTIVE**
**Mode:** Orchestrator
**Action:** [Routing / Blocked / Handoff Complete]
---
```

---

## 🔄 Violation Recovery

If you violated the protocol:

1. IMMEDIATELY output: `⚠️ PROTOCOL VIOLATION DETECTED`
2. State what you did wrong
3. Output the correct `## Routing Decision` block
4. Ask: "Should I undo my changes and restart?"

---

## 🔒 Protocol Version

**Beast Protocol Version:** 3.2.1  
**Last Updated:** 2026-01-10  

If you are reading this, you are bound to THIS version.
Do not improvise. Do not "improve" the process. Follow exactly.

---

**If unsure about ANYTHING, STOP and ask.**
