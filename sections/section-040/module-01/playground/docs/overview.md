# Overview: The Astrona Workflow (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system and then waits. There is no task, no `astrona submit` and no pass or fail.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet (namespace) `training-lab`, with two fleet orders (Deployments): `probe` with 2 healthy replicas and `drift` with a misspelled image tag.

## Practice tasks

- Run `astrona list`, `astrona status` and `astrona whoami`.
- Open `astrona shell`, run `echo $KUBECONFIG`, and leave with `exit`.
- Read `astrona docs prerequisites` for a catalog lab.
- Fix `drift` with `kubectl set image`.
- Try `astrona reset --soft` and watch the namespace come back in its first state.
