# Overview: The kubectl Toolkit (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system and then waits. There is no task, no `astrona submit` and no pass or fail.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet `harbor`: `beacon` (2 healthy replicas, label `tier=front`, with a Service of the same name) and `stutter` (its container prints `engine is cold` and exits).
- The planet `harbor-b`: `buoy` (1 healthy replica).

## Practice tasks

- List namespaces and use `-n` and `-A`.
- Try `-o wide`, `-o name`, `-o yaml` and `-o jsonpath` on `beacon`.
- Read the log of `stutter`, and the log of its previous run with `--previous`.
- Open a shell in a `beacon` pod with `kubectl exec -it`, and read its web page with `wget -qO- localhost`.
- Forward port 8080 to the `beacon` Service and open `http://127.0.0.1:8080`.
