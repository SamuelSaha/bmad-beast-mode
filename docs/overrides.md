# ⚡ Beast Mode: Agent Overrides
**Customize without forking.**

You often need to tweak an agent (e.g., "Always use Tailwind" for the `ux` agent) without changing the core module files. This prevents merge conflicts when you update Beast Mode.

## The "Override Kit" Protocol

### 1. Locate the Agent
Find the agent you want to customize in `agents/`.
Example: `agents/core/ux-designer.md`

### 2. Create the Override File
In your project (NOT in the module directory), create an override file.
The best practice is to mirror the structure in `_bmad/_overrides/`.

```bash
mkdir -p _bmad/_overrides/agents/core/
cp _bmad/modules/beast-mode/agents/core/ux-designer.md _bmad/_overrides/agents/core/ux-designer.md
```

### 3. Modify the Agent
Edit your local copy (`_bmad/_overrides/agents/core/ux-designer.md`).

**Example Modification:**
```markdown
# ... existing content ...

## 🎨 Style Guidelines (OVERRIDE)
- MUST use Tailwind CSS v3.
- MUST use "Inter" font family.
- NO custom CSS classes.
```

### 4. Build/Register
If you are using the standard BMAD Method toolchain, run:
```bash
npx bmad-method build
```
This merges overrides into the active configuration.

If you are using raw Beast Mode (symlinked), simply point your `config/squads.yaml` to your local file instead of the module file.

**Update `config/squads.yaml`:**
```yaml
      - id: ux
        # Point to your local override
        file: ../../../_bmad/_overrides/agents/core/ux-designer.md 
        triggers: ["*define-ux"]
```

## Best Practices
1.  **Tag Overrides:** Add `(OVERRIDE)` to headers you change so you can easily diff later.
2.  **Keep it Minimal:** Only change what you need.
3.  **Check Upstream:** When updating Beast Mode, compare your override with the new default agent to see if you missed improvements.
