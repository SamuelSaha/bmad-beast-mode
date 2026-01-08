# 📦 Workflow Vendoring
**Stabilize your process by pinning workflows.**

## The Problem
If you rely on the global Beast Mode module, changes to workflows (e.g., v2.0 -> v2.1) might break your team's habits or expectations.

## The Solution: Vendoring
"Vendoring" means copying the workflow definition into your project so it never changes until YOU update it.

### How to Vendor a Workflow

1.  **Create Local Directory**
    ```bash
    mkdir -p .bmad/workflows/
    ```

2.  **Copy the Workflow**
    ```bash
    cp _bmad/modules/beast-mode/workflows/standard-feature.yaml .bmad/workflows/my-standard-feature.yaml
    ```

3.  **Update Config**
    Edit `config/commands.yaml` (or your project's command override) to point to the new location.

    ```yaml
    - name: "*start-feature"
      # Points to local vendor copy
      workflow: "../.bmad/workflows/my-standard-feature.yaml"
    ```

## Inheritance (Advanced)
You can extend workflows without copying everything (if supported by your orchestrator).

**`my-feature.yaml`**
```yaml
extend: "beast-mode/workflows/standard-feature.yaml"

# Override specific phases
phases:
  - phase: "Custom Compliance Check"
    insert_after: "Analysis"
    agent: "compliance-officer"
    ...
```

*(Note: Full inheritance support requires BMAD Orchestrator v6.1+)*

## When to Vendor?
- **Vendor** if you have strict compliance requirements and cannot tolerate upstream changes.
- **Reference** (default) if you want the latest improvements from Beast Mode updates.
