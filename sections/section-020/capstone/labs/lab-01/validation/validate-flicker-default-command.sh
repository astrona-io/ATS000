#!/usr/bin/env bash
# Check: the flicker container has no command or args override, so it runs the
# image's own start command. Replacing the broken command with another one
# (for example `sleep`) would make the pod ready but is not the fix.
set -uo pipefail

command_value="$(kubectl -n orbit-lab get deploy flicker -o jsonpath='{.spec.template.spec.containers[0].command}' 2>/dev/null)"
args_value="$(kubectl -n orbit-lab get deploy flicker -o jsonpath='{.spec.template.spec.containers[0].args}' 2>/dev/null)"

if [ -n "$command_value" ]; then
  echo "FAIL: the flicker container still sets a command: $command_value"
  exit 1
fi
if [ -n "$args_value" ]; then
  echo "FAIL: the flicker container sets args: $args_value"
  exit 1
fi
echo "PASS: flicker runs the image's own start command"
