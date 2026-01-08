# 🏎️ Brownfield Fast Lane
**How to apply Beast Mode to an existing (messy) project.**

Applying rigorous agents to a "greenfield" (new) project is easy. Applying them to a "brownfield" (legacy) project is hard. This guide creates a "Fast Lane" to get value immediately without refactoring everything.

## The Strategy: "Map, Don't Fix"
Do NOT try to fix the legacy code immediately. Your goal is to **index** it so agents understand it / respect it.

### Step 1: Initialize Discovery
Run the **Brownfield Discovery Workflow**:

```bash
*scan-legacy
```

This generates `docs/bmad/discovery/` artifacts:
- `01-structure.md`: What files exist?
- `02-architecture.md`: How does data flow?
- `04-patterns.md`: How SHOULD we write code here?

### Step 2: Shard the Context
Legacy codebases are huge. Run sharding on the `src` directory immediately.

```bash
./scripts/shard.sh src/
```

### Step 3: The " Containment Field"
When you start a new task (e.g., "Add Feature X"), create a boundary.
- **Do not** touch old code unless necessary.
- **Do** create new modules following Beast Mode standards.
- **Do** create an "Interface Layer" (Adapter pattern) if you must interact with messy legacy code.

### Step 4: The Workflow
Use the **Standard Feature Flow**, but with one extra step:

1.  **Analyst:** Include `docs/bmad/discovery/` in the context.
2.  **Architect:** Explicitly define the boundary between New and Legacy code.
3.  **Dev:** Use `*shard` references for legacy files.

## Example Session

```
User: "Fix the checkout bug on the old payment page."

# 1. Map the terrain
*scan-legacy

# 2. Optimize context
./scripts/shard.sh src/legacy/payment/

# 3. Start Workflow
*start
*analyze-problem context: "Checkout bug. See src/legacy/payment/checkout.js.sharded.md"
```

## Win Condition
You are successful if:
1.  Agents **read** legacy code (via shards) but **write** clean code.
2.  You don't break existing functionality.
3.  You generate a `03-implementation.md` that clearly marks legacy touchpoints.
