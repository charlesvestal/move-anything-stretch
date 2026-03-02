#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DIST_DIR="$REPO_ROOT/dist/stretch"
REMOTE_DIR="/data/UserData/move-anything/modules/tools/stretch"
DEVICE="${1:-move.local}"

if [ ! -d "$DIST_DIR" ]; then
    echo "Error: dist/stretch/ not found. Run scripts/build.sh first."
    exit 1
fi

echo "Installing stretch to $DEVICE..."
ssh root@"$DEVICE" "mkdir -p $REMOTE_DIR"
scp "$DIST_DIR/module.json" root@"$DEVICE":"$REMOTE_DIR/"
scp "$DIST_DIR/ui.js"       root@"$DEVICE":"$REMOTE_DIR/"
scp "$DIST_DIR/dsp.so"      root@"$DEVICE":"$REMOTE_DIR/"
ssh root@"$DEVICE" "chmod +x $REMOTE_DIR/dsp.so"
echo "Done. Restart move-anything to pick up the new tool."
