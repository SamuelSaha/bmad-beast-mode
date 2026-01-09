# Beast Mode Bootstrap (<60 seconds)

## Install
```bash
npx bmad-method@alpha install
# Select: BMM + custom module → /Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode
```

## Verify
```bash
ls _bmad/beast-mode/agents/core/  # Should list 9 agents
ls _bmad/bmm/                      # Should exist if BMM installed
```

## Setup Folders
```bash
mkdir -p _bmad-output/planning-artifacts _bmad-output/implementation-artifacts docs
```

## First Command
```bash
# In IDE: /beast-analyst or /bmad to list all agents
# Then: *beast-analyze context: 'your issue'
```

## Switch Rule
| Goal | Install |
|------|---------|
| Full PRD/Architecture/Stories | **BMM** + Beast Mode |
| Quick fixes only | BMB + Beast Mode |

## Source of Truth
**Never edit `_bmad/`** → Edit `/Users/samuelsaha/Library/BMAD/modules/bmad-beast-mode/` then reinstall.
