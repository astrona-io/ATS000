# Overview: A Troubleshooting Method (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system and then waits. There is no task, no `astrona submit` and no pass or fail.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet `clinic-lab`: `ok` (healthy), `wrong-tag` (image pull error), `too-big` (Pending), `quitter` (crash loop), `needs-config` (`CreateContainerConfigError`) and `lonely` (healthy pods, but its Service selects `app=lone`).

## Practice tasks

- Run `kubectl get pods -n clinic-lab` and write down the status of each pod.
- Pick one pod at a time, find its clue (Events, logs or labels), and say what the fault is before you change anything.
- Fix each one with the smallest change.
- Run `kubectl get events -n clinic-lab --sort-by=.lastTimestamp`.
- Check `kubectl get endpoints lonely -n clinic-lab` before and after your fix.
