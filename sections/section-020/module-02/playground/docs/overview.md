# Overview: Find Why Ships Will Not Fly (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system with two broken fleets, and then waits. There is no task, no `astrona submit` and no pass or fail.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet (namespace) `rescue-lab`, with two fleet orders (Deployments):

  | Deployment | What is wrong |
  | --- | --- |
  | `hauler` | Its container asks for `512Gi` of memory, so no launch pad can take the pod and it stays `Pending` |
  | `flicker` | Its container command exits at once with an error, so the pod crashes again and again |

## Practice tasks

- Read the `Pending` reason in the Events of the `hauler` pod, and find the word `Insufficient`.
- Lower the memory request of `hauler` and watch the pod start.
- Read the log of the `flicker` pod with `kubectl logs`, and the previous log with `--previous`.
- Find the exit code in `kubectl describe pod`.
- Remove the bad `command` from `flicker` with `kubectl edit` and watch it run.
