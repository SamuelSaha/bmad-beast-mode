# AI Prompt Specification Template
# File: docs/bmad/{slug}/ai-01-prompt-spec.md

---
slug: "{slug}"
type: ai-prompt-spec
status: draft | approved
created: "{date}"
author: Beast Mode Prompt Engineer
model: gpt-4 | gpt-3.5-turbo | claude-3 | ...
---

# 🤖 Prompt Spec: {Feature Title}

## 1. Task Definition
<!-- What should the AI do? Be extremely specific. -->

### Input
<!-- What does the prompt receive? -->

### Output
<!-- What format should the response be? -->
```json
{
  "field1": "string",
  "field2": "number"
}
```

### Constraints
- Max tokens: ...
- Temperature: ...
- Response format: JSON / Text / Markdown

## 2. System Prompt
```
You are a [role]. Your task is to [task].

Rules:
1. ...
2. ...
3. ...

Output format:
...
```

## 3. User Prompt Template
```
Given the following context:
{context}

Perform the following task:
{task}

Requirements:
- ...
```

## 4. Few-Shot Examples

### Example 1: Standard Case
**Input:**
```
...
```
**Expected Output:**
```json
...
```

### Example 2: Edge Case
**Input:**
```
...
```
**Expected Output:**
```json
...
```

### Example 3: Adversarial Case
**Input:**
```
[Jailbreak attempt or confusing input]
```
**Expected Output:**
```json
{
  "error": "Unable to process request"
}
```

## 5. Guardrails

### Content Filtering
- Block: [Categories to reject]
- Allow: [Acceptable content types]

### Hallucination Prevention
- Require sources/citations: Yes/No
- Confidence threshold: ...
- Fallback response: ...

### Token Limits
- Max input tokens: ...
- Max output tokens: ...
- Truncation strategy: ...

## 6. Error Handling
| Scenario | Response |
|----------|----------|
| Invalid input format | ... |
| Token limit exceeded | ... |
| Model refuses | ... |
| Timeout | ... |

## 7. Versioning
| Version | Date | Changes |
|---------|------|---------|
| v1.0.0 | ... | Initial version |

---
**Gate Check:** [ ] Examples tested [ ] Guardrails defined [ ] Error handling complete
