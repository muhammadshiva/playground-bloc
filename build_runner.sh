#!/bin/bash

# Flutter Build Runner Script
# Ensures we use the same Flutter (FVM if available) to avoid SDK mismatches

set -euo pipefail

FLUTTER_CMD="flutter"
if command -v fvm >/dev/null 2>&1; then
  FLUTTER_CMD="fvm flutter"
fi

echo "Using: $($FLUTTER_CMD --version | head -n 1)"
echo "Running Flutter build runner..."
$FLUTTER_CMD pub run build_runner build --delete-conflicting-outputs

echo "Build runner completed!"
