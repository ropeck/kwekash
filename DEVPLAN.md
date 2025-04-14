# `kpod` and `kwekash` Integration Plan

## Overview
This document outlines the plan to generalize `kwekash` into a broader utility called `kpod`. `kpod` will provide flexible access to run arbitrary commands in matching Kubernetes pods, while `kwekash` will remain as a specialized wrapper for WEKA use cases.

## Goals
- Create a general-purpose tool (`kpod`) to exec into matching pods.
- Maintain `kwekash` as a specialized wrapper using `kpod weka`.
- Integrate `kpod` into VS Code as a Task or Command Palette entry.

---

## Tool Definitions

### `kpod`
A CLI utility to execute commands in a pod that matches certain criteria:

#### Features:
- Pod name substring matching (e.g., `-m drive`)
- Namespace specification (e.g., `-n weka-operator-system`)
- Container name override (optional)
- Support for arbitrary commands after `--`
- Optional: label selector (`-l key=value`)

#### Example Usage:
```bash
# Run bash shell in matching pod
kpod -n prod -m api -- bash

# Echo something in a staging pod
kpod -n staging -m spark-driver -- echo "hello"
```

### `kwekash`
A wrapper script that runs `kpod` with WEKA-specific defaults:
```bash
kpod -n weka-operator-system -m drive -- bash -c "weka version"
```

#### Example Wrapper Script (Python):
```python
#!/usr/bin/env python3
import subprocess

subprocess.run([
    "kpod",
    "-n", "weka-operator-system",
    "-m", "drive",
    "--", "bash", "-c", "weka version"
])
```

---

## VS Code Integration

### Option 1: VS Code Task
Define `.vscode/tasks.json`:
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Run kwekash",
      "type": "shell",
      "command": "kwekash",
      "problemMatcher": [],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    },
    {
      "label": "Run kpod api",
      "type": "shell",
      "command": "kpod -n prod -m api -- bash",
      "problemMatcher": []
    }
  ]
}
```

### Option 2: Custom VS Code Extension
- Register commands in Command Palette
- Use `child_process` in Node.js to run CLI
- Show output in a terminal pane
- Optionally use `QuickPick` to select pod or namespace

---

## Stretch Goals
- Parallel pod exec support
- Pod selection with interactive `fzf`
- Tmux/multipane execution
- Integration with `kubectl logs`, `kubectl cp`
- YAML context parsing in open editor to auto-fill match criteria

---

## Next Steps
1. Build MVP of `kpod` in Python (reusing `kwekash` logic).
2. Refactor `kwekash` to use `kpod weka`.
3. Add VS Code `tasks.json` entries for both tools.
4. Optionally start a minimal VS Code extension.


