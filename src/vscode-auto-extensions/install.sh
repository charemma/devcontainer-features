#!/bin/bash
set -e

echo "[vscode-auto-extensions] Installing dependencies..."
apt-get update && apt-get install -y jq curl

echo "[vscode-auto-extensions] Installing extensions..."

MARKER="/home/vscode/.vscode-extensions-installed"

if [ ! -f "$MARKER" ]; then
  echo "[vscode-auto-extensions] VSCode detected. Installing extensions..."

  CODE_CLI=code
  if command -v code-server &>/dev/null; then
    CODE_CLI=code-server
  fi

  mkdir -p ~/.vscode-server/extensions

  extensions=$(sed 's/\/\/.*$//g' .devcontainer/devcontainer.json | jq -r -M '[.customizations.vscode.extensions[]?, .extensions[]?] | .[]')

  for ext in $extensions; do
    $CODE_CLI --extensions-dir ~/.vscode-server/extensions --install-extension "$ext"
  done

  touch "$MARKER"
else
  echo "[vscode-auto-extensions] Skipped extension install: not VSCode or already installed."
fi

