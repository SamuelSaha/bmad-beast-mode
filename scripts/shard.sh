#!/bin/bash

# Beast Mode Sharding Utility
# Usage: ./shard.sh <file_or_directory>
# Generates .sharded.md files with summarized context to save tokens.

set -e

# Ensure python environment
if ! python3 -c "import yaml" > /dev/null 2>&1; then
    echo "⚠️  PyYAML not found. Installing..."
    pip3 install pyyaml --user > /dev/null 2>&1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_PATH="$SCRIPT_DIR/../config/sharding.yaml"

python3 - "$1" "$CONFIG_PATH" << 'EOF'
import sys
import os
import yaml
import re

target_path = sys.argv[1]
config_path = sys.argv[2]
if not os.path.exists(target_path):
    print(f"❌ Error: Path not found {target_path}")
    sys.exit(1)

# Load config
try:
    with open(config_path) as f:
        config = yaml.safe_load(f)
except Exception as e:
    print(f"⚠️  Config load error: {e}. Using defaults.")
    config = {"rules": []}

def get_strategy(filename):
    # Default
    strategy = "full"
    
    # Check rules
    for rule in config.get('rules', []):
        pattern = rule.get('pattern')
        # Simple glob-like conversion to regex
        # This is a basic approximation for the script
        regex = pattern.replace('.', '\.').replace('*', '.*').replace('?', '.')
        if '{' in regex:
            # Handle {ts,tsx} style
            # {ts,tsx} -> (ts|tsx)
            regex = re.sub(r'\{([^}]+)\}', r'(\1)', regex)
            regex = regex.replace(',', '|')
            
        if re.search(regex + '$', filename):
            strategy = rule.get('strategy', 'full')
            return strategy, rule
            
    return strategy, {}

def process_file(filepath):
    filename = os.path.basename(filepath)
    strategy, rule = get_strategy(filepath)
    
    print(f"📄 Processing {filename} with strategy: {strategy}")
    
    if strategy == 'ignore':
        print("   Skipping (ignore strategy)")
        return
        
    try:
        with open(filepath, 'r', errors='ignore') as f:
            content = f.read()
    except Exception as e:
        print(f"   Error reading file: {e}")
        return

    output_content = f"# SHARD: {filename}\n"
    output_content += f"# Strategy: {strategy}\n"
    output_content += f"# Original Size: {len(content)} chars\n\n"
    
    if strategy == 'interface-only':
        # Naive extraction for demo purposes
        # In a real tool, use tree-sitter or similar
        lines = content.split('\n')
        for line in lines:
            line = line.strip()
            if line.startswith('import ') or line.startswith('export '):
                output_content += line + "\n"
            elif line.startswith('function ') or line.startswith('class '):
                output_content += line + " { ... }\n"
            elif line.startswith('interface ') or line.startswith('type '):
                 output_content += line + "\n"
    
    elif strategy == 'summary':
        # First 50 lines + stats
        output_content += "## Summary Preview\n"
        output_content += "\n".join(content.split('\n')[:50])
        output_content += "\n\n... (file truncated) ...\n"
        
    elif strategy == 'split-by-header':
        # Just outline headers
        output_content += "## Document Structure\n"
        for line in content.split('\n'):
            if line.strip().startswith('#'):
                output_content += line + "\n"
                
    else: # full or unknown
        output_content += content

    output_path = filepath + ".sharded.md"
    with open(output_path, 'w') as f:
        f.write(output_content)
    print(f"   ✅ Created {output_path}")

if os.path.isfile(target_path):
    process_file(target_path)
elif os.path.isdir(target_path):
    for root, dirs, files in os.walk(target_path):
        for file in files:
            full_path = os.path.join(root, file)
            # Skip existing shards and hidden files
            if file.endswith('.sharded.md') or file.startswith('.'):
                continue
            process_file(full_path)
EOF
