#!/usr/bin/env bash
set -euo pipefail
for dir in examples/aws examples/azure examples/gcp; do
  echo "Initializing ${dir}"
  (cd "$dir" && terraform init -backend=false)
done
