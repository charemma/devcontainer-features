# DevContainer Features

This repository provides reusable [Dev Container Features](https://containers.dev/implementors/features/) compatible with Visual Studio Code, GitHub Codespaces, and remote dev environments like [Coder](https://coder.com/).

## 📦 Feature: `vscode-auto-extensions`

Automatically installs VSCode extensions listed in `.devcontainer/devcontainer.json`, but **only** when the container is started from a VSCode Remote connection. This solves a known issue where extensions defined in `customizations.vscode.extensions` are ignored in setups like [envbuilder](https://github.com/coder/envbuilder/issues/43) by Coder.com.

### ✅ Why use this?

- Ensures your expected extensions are available when editing remotely
- Works **even when `envbuilder` or Coder skips native VSCode extension install**
- Skips install during SSH-only or CI usage
- One-time install per container, with marker file for performance

## 🔧 Example devcontainer.json

```json
{
  "name": "my-container",
  "features": {
    "ghcr.io/charemma/devcontainer-features/vscode-auto-extensions:1.0.0": {}
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-vscode.cpptools",
        "ms-vscode.cmake-tools",
        "llvm-vs-code-extensions.vscode-clangd"
      ]
    }
  }
}
```

---

MIT © 2025 charemma
