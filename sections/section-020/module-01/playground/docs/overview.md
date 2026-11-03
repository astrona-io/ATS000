# Overview: Scale, Label And Launch From A File (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system with two healthy fleets, and then waits. There is no task, no `astrona submit` and no pass or fail.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet (namespace) `fleet-lab`, with two fleet orders (Deployments):

  | Deployment | Replicas | Pod label |
  | --- | --- | --- |
  | `crew` | 1 | `app=crew` |
  | `cargo` | 2 | `app=cargo` |

## Practice tasks

- Scale `crew` to 3 with `kubectl scale`, and watch the new pods appear.
- Show the labels of every pod with `--show-labels`, and pick one fleet with `-l app=cargo`.
- Add a label to one pod with `kubectl label`, then remove it again.
- Write a Deployment file, apply it, change the replica count in the file and apply it again.
- Create a Service for `crew` and check that it finds the pods.
