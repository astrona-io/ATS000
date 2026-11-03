# Overview: The Lab Loop (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system with two small apps, and then waits. There is no task, no `astrona submit` and no pass or fail. Look around, break things, `astrona destroy`, start over.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet (namespace) `first-lab`, with two fleet orders (Deployments):

  | Deployment | Replicas | What it is |
  | --- | --- | --- |
  | `hello` | 2 | A healthy web app on `nginx:1.27-alpine` |
  | `relay` | 1 | A web app with a typo in its image tag (`nginx:1.27-alpne`), so its pod cannot start |

## Practice tasks

- Run a roll call with `kubectl get pods -n first-lab` and tell the healthy pods from the broken one.
- Open the flight record of the broken pod with `kubectl describe pod` and find the Events line that names the missing image.
- Fix `relay` with `kubectl set image deployment/relay web=nginx:1.27-alpine -n first-lab` and watch the pod get replaced.
- Delete one `hello` pod and watch the Deployment build a new one.
- Run `kubectl get pods` without `-n` and see why nothing shows up.
