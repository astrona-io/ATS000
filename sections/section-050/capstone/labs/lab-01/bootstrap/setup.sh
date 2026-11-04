#!/usr/bin/env bash
# Starting state: hold has a good revision 1 and a stuck revision 2; lock needs a Secret that does not exist.
set -euo pipefail
lab_directory="$(cd "$(dirname "$0")/.." && pwd)"
kubectl apply -f "$lab_directory/bootstrap/manifests/00-namespace.yaml"
kubectl apply -f "$lab_directory/bootstrap/manifests/10-hold-v1.yaml"
kubectl apply -f "$lab_directory/bootstrap/manifests/15-lock.yaml"
kubectl -n cargo-lab rollout status deployment/hold --timeout=180s
kubectl apply -f "$lab_directory/bootstrap/manifests/20-hold-v2.yaml"
