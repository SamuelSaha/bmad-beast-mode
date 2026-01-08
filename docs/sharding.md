# 📊 Beast Mode Context Sharding
**Iterate faster by ignoring 90% of the noise.**

## The Problem
Context Sharding solves "Context Explosion".
- **Symptom:** AI forgets instructions, hallucinates, or responds slowly.
- **Cause:** Dumping entire files (implementation details, tests, docs) into the prompt.
- **Solution:** Send only the *semantic shape* (interfaces, headers, signatures).

## How to Use

### 1. Run the Sharder
Use `scripts/shard.sh` to generate optimized views of your files.

```bash
# Shard a single file
./scripts/shard.sh src/utils/api.ts
# Generates: src/utils/api.ts.sharded.md

# Shard an entire directory
./scripts/shard.sh src/
# Generates .sharded.md for every matching file
```

### 2. Reference Shards in Prompts
Instead of asking the LLM to read the huge file, point it to the shard first.

**❌ Bad Prompt:**
> "Read `src/heavy-logic.ts` (2000 lines) and tell me how to call the auth function."

**✅ Beast Mode Prompt:**
> "Read `src/heavy-logic.ts.sharded.md` and tell me the signature of the auth function."

### 3. Configure Rules
Edit `config/sharding.yaml` to define strategies.

| Strategy | Best For | Output |
|----------|----------|--------|
| `interface-only` | Source Code | Exports, types, signatures ONLY. |
| `split-by-header` | Documentation | Table of contents / structure. |
| `summary` | Tests, Migrations | First 50 lines / intent. |
| `full` | Configs | Entire content (if small). |
| `ignore` | Assets, Locks | Nothing. |

## Strategy Examples

### Source Code (`interface-only`)
Input:
```typescript
export function complexAlgo(data: any) {
  // 500 lines of implementation
}
```

Output:
```typescript
export function complexAlgo(data: any) { ... }
```

### Documentation (`split-by-header`)
Input:
```markdown
# Title
## Section 1
(Lots of text)
## Section 2
(Lots of text)
```

Output:
```markdown
# Title
## Section 1
## Section 2
```
