#!/usr/bin/env bash
# Starting state: engine runs release one (revision 1), then release two is applied
# and cannot start (revision 2). The student rolls back to revision 1.
set -euo pipefail
lab_directory="$(cd "$(dirname "$0")/.." && pwd)"
kubectl apply -f "$lab_directory/bootstrap/manifests/00-namespace.yaml"
kubectl apply -f "$lab_directory/bootstrap/manifests/10-engine-v1.yaml"
kubectl -n release-lab rollout status deployment/engine --timeout=180s
kubectl apply -f "$lab_directory/bootstrap/manifests/20-engine-v2.yaml"
