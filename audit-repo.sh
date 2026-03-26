#!/bin/bash

# Repository Audit Script - Simple Static Analysis
# Usage: ./audit-repo.sh /path/to/repo
# See README.md for more hep on usage and setup

TARGET_DIR=${1:-.}

echo "-------------------------------------------------------"
echo "🔍 Auditing Directory: $TARGET_DIR"
echo "-------------------------------------------------------"

# 1. Check for Obfuscated Strings (Long Base64 or Hex blocks)
echo "[!] Searching for potential obfuscation (Long Strings)..."
grep -rE '[A-Za-z0-9+/]{100,}' "$TARGET_DIR" --exclude-dir=.git | head -n 5

# 2. Check for Sensitive Network Calls
echo -e "\n[!] Searching for hardcoded IPs and sensitive URLs..."
grep -rE '((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' "$TARGET_DIR" --exclude-dir=.git
grep -rE "http://|ws://" "$TARGET_DIR" --exclude-dir=.git | grep -v "localhost"

# 3. Check for Execution/Process Injection (Language agnostic)
echo -e "\n[!] Searching for execution commands (eval, system, exec, popen)..."
grep -rE "eval\(|system\(|exec\(|popen\(|subprocess\.|os\.system" "$TARGET_DIR" --exclude-dir=.git

# 4. Check for Hidden Files & Suspicious Binaries
echo -e "\n[!] Checking for hidden files and unexpected binaries..."
find "$TARGET_DIR" -type f -name ".*" -not -path "*/.git/*" -not -name ".gitignore"
find "$TARGET_DIR" -type f -executable -not -path "*/.git/*"

echo -e "\n-------------------------------------------------------"
echo "✅ Audit Complete."
