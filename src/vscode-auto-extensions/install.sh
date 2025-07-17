#!/bin/bash
set -e

echo "[vscode-auto-extensions] Installing dependencies..."
apt-get update && apt-get install -y jq curl

echo "[vscode-auto-extensions] Installing entrypoint..."
mkdir -p /usr/local/bin
cp vscode-auto-extensions-entrypoint.sh /usr/local/bin/
chmod +x /usr/local/bin/vscode-auto-extensions-entrypoint.sh
