# Overview: Roll Out And Roll Back (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system and then waits. There is no task, no `astrona submit` and no pass or fail.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet `rollout-lab`, with one fleet order (Deployment): `shuttle`, 3 replicas, the image `nginx:1.27-alpine` and the variable `RELEASE=one`.

## Practice tasks

- Run `kubectl rollout history deployment/shuttle -n rollout-lab`.
- Change `RELEASE` with `kubectl set env` and watch the new ReplicaSet with `kubectl get replicasets -n rollout-lab`.
- Set a bad image tag, watch the rollout stall, and read `kubectl rollout status`.
- Roll back with `kubectl rollout undo`, and with `--to-revision`.
- Try `kubectl rollout pause`, change two things, then `kubectl rollout resume`.
