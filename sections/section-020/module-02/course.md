# Find Why Ships Will Not Fly

Astronaut, a ship that does not fly leaves clues. Your first mission showed one kind of stuck ship: the blueprint could not be fetched. This module teaches two more. Some ships never leave the hangar because no launch pad has room. Others launch, fail at once and keep restarting.

You will learn to read these two failures from the roll call, the Events and the ship's own log, and to fix each one in the fleet order.

## Learning objectives

After this module you can:

- Explain what the status `Pending` means and find its reason in the Events of `kubectl describe pod`.
- Read a memory request, and lower it with `kubectl set resources` so that a pod can be placed.
- Explain what `CrashLoopBackOff` means, and how it differs from `ImagePullBackOff`.
- Read a container's log with `kubectl logs`, including the log of the run before with `--previous`.
- Find the exit code of a crashed container in `kubectl describe pod`.
- Fix a bad container command in a Deployment with `kubectl edit`.

## Before you start

You should know how to read `kubectl get pods` and `kubectl describe pod`, and that you fix a Deployment, not its pods. Your playground is a single-node `kind` cluster with the planet (namespace) `rescue-lab`. It has two broken fleet orders:

| Deployment | What is wrong |
| --- | --- |
| `hauler` | Its container asks for a huge amount of memory, so its pod cannot be placed |
| `flicker` | Its container command exits at once, so its pod crashes again and again |

Launch your playground now, and keep it running next to you while you read the parts:

<!-- astrona:playground -->

## The parts of this module

Read the parts in this order. Each one takes about 10 minutes with the playground.

| Part | What you learn |
| --- | --- |
| [Pending Ships: No Room On The Launch Pad](./course-01-pending-ships-no-room-on-the-launch-pad.md) | The scheduler, resource requests, the `Pending` status and the `FailedScheduling` event |
| [Crashing Ships And Their Logs](./course-02-crashing-ships-and-their-logs.md) | `CrashLoopBackOff`, `kubectl logs`, exit codes and `kubectl edit`; then your graded mission |
| [Summary: Two More Ways To Get Stuck](./course-03-summary.md) | What you learned, a short self-check and cleaning up |

## Why this matters

A stuck pod is the most common problem you will meet in Kubernetes. The status in the roll call tells you which kind of stuck it is, and each kind has its own place to look. Learn the three signatures, and you find most faults in minutes.
