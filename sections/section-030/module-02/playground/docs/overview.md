# Overview: Read And Write YAML (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system and then waits. There is no task, no `astrona submit` and no pass or fail.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet (namespace) `draft-lab`, with one fleet order (Deployment) called `sample`. It has 1 replica, the label `tier: demo`, port `80` and the variable `LEVEL=low`.

## Practice tasks

- Print the object as YAML with `kubectl get deployment sample -n draft-lab -o yaml` and find the maps and the lists.
- Write your own file, `copy.yaml`, with another name, and check it with `kubectl apply --dry-run=client -f copy.yaml`.
- Break the indentation on purpose and read the error.
- Use `kubectl explain deployment.spec.replicas`.
- Apply the fixed file and delete it again with `kubectl delete -f copy.yaml`.
