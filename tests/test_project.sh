#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for f in "$ROOT/providers/versions.tf" "$ROOT/modules/aws/main.tf" "$ROOT/modules/azure/main.tf" "$ROOT/modules/gcp/main.tf" "$ROOT/examples/aws/main.tf" "$ROOT/examples/azure/main.tf" "$ROOT/examples/gcp/main.tf"; do test -s "$f"; done
for f in "$ROOT/scripts"/*.sh; do bash -n "$f"; done
grep -q 'version = "6.60.0"' "$ROOT/providers/versions.tf"
grep -q 'version = "5.0.1"' "$ROOT/providers/versions.tf"
grep -q 'version = "7.44.0"' "$ROOT/providers/versions.tf"
grep -q 'allowed_ssh_cidr' "$ROOT/modules/aws/variables.tf"
grep -q 'azurerm_linux_virtual_machine' "$ROOT/modules/azure/main.tf"
grep -q 'google_compute_network' "$ROOT/modules/gcp/main.tf"
! grep -R '|| true' "$ROOT/scripts" >/dev/null
printf '%s\n' 'Project 21 structural tests passed.'
