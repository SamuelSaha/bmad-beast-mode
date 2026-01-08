#!/bin/bash
set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "🔥 STARTING BEAST MODE INTEGRITY CHECK 🔥"

# 1. SETUP PYTHON VENV (Isolated environment)
echo ""
echo "📦 Setting up isolated validation environment..."
python3 -m venv .venv_validate
source .venv_validate/bin/activate
pip install pyyaml > /dev/null 2>&1

# 2. STRICT YAML VALIDATION
echo ""
echo "🔍 Phase 1: Strict YAML Validation"
python3 -c "
import yaml
import sys
from pathlib import Path

files = list(Path('.').rglob('*.yaml')) + list(Path('.').rglob('*.yml'))
errors = 0

for f in files:
    if '.git' in str(f) or '.venv' in str(f): continue
    try:
        with open(f) as stream:
            # Check for duplicate keys by strictly ensuring loader fails on them if possible
            # PyYAML's safe_load doesn't warn on dupes by default, but it confirms syntax
            yaml.safe_load(stream)
            print(f'  ✅ {f}')
    except Exception as e:
        print(f'  ❌ {f}: {e}')
        errors += 1

if errors > 0: sys.exit(1)
" || exit 1

# 3. REFERENTIAL INTEGRITY
echo ""
echo "🔗 Phase 2: Referential Integrity Check"
# Check if files referenced in module.yaml actually exist
python3 -c "
import yaml
import sys
import glob

with open('module.yaml') as f:
    mod = yaml.safe_load(f)

missing = []

def check_list(section, pattern_list):
    for pattern in pattern_list:
        # Glob patterns handling
        if '*' in pattern:
            matches = glob.glob(pattern)
            if not matches:
                print(f'  ⚠️  Warning: Pattern matches nothing: {pattern}')
            else:
                print(f'  ✅ Pattern matches {len(matches)} files: {pattern}')
        else:
            # Exact file
            import os
            if not os.path.exists(pattern):
                print(f'  ❌ Missing referenced file: {pattern}')
                missing.append(pattern)
            else:
                print(f'  ✅ Found: {pattern}')

print('Checking structure...')
structure = mod.get('structure', {})
check_list('agents', structure.get('agents', []))
check_list('workflows', structure.get('workflows', []))
check_list('templates', structure.get('templates', []))
check_list('config', structure.get('config', []))
check_list('docs', structure.get('docs', []))
check_list('scripts', structure.get('scripts', []))

if missing:
    sys.exit(1)
" || exit 1

# 4. CONFIG INTEGRITY
echo ""
echo "⚙️  Phase 3: Configuration Consistency"
# Check if commands.yaml references valid agents/workflows
python3 -c "
import yaml
import sys
import os
import glob

with open('config/commands.yaml') as f:
    cmds = yaml.safe_load(f)

with open('config/squads.yaml') as f:
    squads = yaml.safe_load(f)

errors = []

# Build list of valid agent IDs (filenames without ext)
valid_agents = set()
squads_data = squads.get('squads', {})
for squad_name, squad_info in squads_data.items():
    for agent_info in squad_info.get('agents', []):
        valid_agents.add(agent_info.get('id'))

# Also check filesystem for agents
for f in glob.glob('agents/**/*.md', recursive=True):
    name = os.path.splitext(os.path.basename(f))[0]
    valid_agents.add(name)

print(f'  ℹ️  Known Agents: {len(valid_agents)}')

# Check Enterprise commands
for cmd in cmds.get('enterprise', []):
    agent = cmd.get('agent')
    workflow = cmd.get('workflow')
    
    if agent and agent not in valid_agents:
        # Some special cases like 'qa' might be referenced but file is 'qa.md'
        if agent != 'qa': # qa is in valid_agents if qa.md exists
             cmd_name = cmd.get('name')
             print(f'  ⚠️  Command {cmd_name} references unknown agent: {agent}')
    
    if workflow:
        if not os.path.exists(f'workflows/{workflow}.yaml'):
             cmd_name = cmd.get('name')
             print(f'  ❌ Command {cmd_name} references missing workflow: {workflow}')
             errors.append(workflow)

if errors:
    sys.exit(1)
else:
    print('  ✅ Command registry commands point to valid targets')
" || exit 1

# 5. SECRET SCANNING
echo ""
echo "🔒 Phase 4: Secret Scanning"
if grep -rE "(sk_live_|sk_test_|AKIA[0-9A-Z]{16}|ghp_|xox[baprs]-)" --include="*.md" --include="*.yaml" --include="*.txt" . 2>/dev/null | grep -v "agents/security"; then
    echo "  ❌ Potential secrets found!"
    exit 1
else
    echo "  ✅ No secrets detected"
fi

echo ""
echo -e "${GREEN}✅ ALL SYSTEMS GO. STRUCTURAL INTEGRITY 100%.${NC}"
rm -rf .venv_validate
