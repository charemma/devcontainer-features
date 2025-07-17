# vscode-auto-extensions

This DevContainer Feature automatically installs VSCode extensions specified in your `.devcontainer/devcontainer.json` **when a VSCode Remote Container connection is detected**.

## Why?

The standard `customizations.vscode.extensions` block in `devcontainer.json` is ignored by some tools like [envbuilder](https://github.com/coder/envbuilder), or not consistently respected in certain remote setups. This feature ensures your extensions are always installed, but only when relevant.

## Behavior

- ✅ Triggers when `VSCODE_REMOTE_CONTAINERS=1`
- 🛑 Skips installation during SSH-only or CI runs
- 🧠 Installs extensions using `code` or `code-server` CLI
- 💾 Only runs once (marker file: `~/.vscode-extensions-installed`)

## Example extensions block

```json
"customizations": {
  "vscode": {
    "extensions": [
      "ms-vscode.cpptools",
      "ms-vscode.cmake-tools",
      "llvm-vs-code-extensions.vscode-clangd"
    ]
  }
}
```

## Notes

- Requires `jq` and `curl`, installed automatically
- Can be combined with any DevContainer base image

---

MIT © charemma
