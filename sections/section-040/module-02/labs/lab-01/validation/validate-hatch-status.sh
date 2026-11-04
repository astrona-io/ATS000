#!/usr/bin/env bash
# Check: a running hatch pod holds the file /usr/share/nginx/html/status.txt with the text "docked".
# The student writes it with kubectl exec. A pod restart removes the file.
set -uo pipefail

content="$(kubectl -n bay-lab exec deploy/hatch -- cat /usr/share/nginx/html/status.txt 2>/dev/null | tr -d '[:space:]')"

if [ "$content" != "docked" ]; then
  echo "FAIL: /usr/share/nginx/html/status.txt in the hatch pod does not say docked (found: '$content')"
  exit 1
fi
echo "PASS: the hatch pod holds status.txt with the text docked"
