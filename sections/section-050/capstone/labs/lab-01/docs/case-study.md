# Case study: a stuck release and a locked door

Two things are wrong in the cargo hold. The latest release of `hold` cannot start, and `lock` cannot start because its Secret was never created.

## Things worth knowing before you start

- `kubectl rollout history` and `kubectl rollout undo` handle the first fault.
- `kubectl describe pod` names the missing object for the second fault.
- A rollback restores the image and the environment together.
- `kubectl create secret generic <name> --from-literal=KEY=value -n <namespace>` makes a Secret.

## What to do

Fix both, check that every pod is ready and submit.
