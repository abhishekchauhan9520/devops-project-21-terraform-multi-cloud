#!/usr/bin/env bash
set -euo pipefail
case "${1:-}" in
  aws) dir="examples/aws" ;;
  azure) dir="examples/azure" ;;
  gcp) dir="examples/gcp" ;;
  *) echo "Usage: $0 <aws|azure|gcp>" >&2; exit 2 ;;
esac
(cd "$dir" && terraform plan)
