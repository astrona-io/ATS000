# Scale, Label And Launch From A File

Astronaut, your first mission fixed one broken fleet order. Real missions ask for more: add ships to a fleet, find the right ships among many, and write a whole new fleet order yourself. This module teaches those three moves.

A fleet order is a Deployment. You will change how many ships it keeps in flight, use labels to pick ships out of a crowd, and describe a new fleet in a file that you give to Kubernetes. You will also give the fleet one call sign, called a Service, so other ships can reach it.

## Learning objectives

After this module you can:

- Change the number of pods of a Deployment with `kubectl scale`, and check the result with `kubectl get deployment`.
- Read the labels of pods, and pick pods with `-l`, a label selector.
- Explain how a Deployment finds its own pods with `selector.matchLabels` and the pod template's labels.
- Write a Deployment in a YAML file, apply it with `kubectl apply -f`, and change it by applying the file again.
- Create a Service that sends traffic to the pods with a given label, and check that it found them.

## Before you start

You should know what a namespace, a pod and a Deployment are, and how to read `kubectl get pods`. Your playground is a single-node `kind` cluster with the planet (namespace) `fleet-lab`. It has two healthy fleet orders:

| Deployment | Replicas | Pod label |
| --- | --- | --- |
| `crew` | 1 | `app=crew` |
| `cargo` | 2 | `app=cargo` |

Launch your playground now, and keep it running next to you while you read the parts:

<!-- astrona:playground -->

## The parts of this module

Read the parts in this order. Each one takes about 10 minutes with the playground.

| Part | What you learn |
| --- | --- |
| [Scale And Label The Fleet](./course-01-scale-and-label-the-fleet.md) | `kubectl scale`, the READY column of a Deployment, labels and selectors |
| [Describe A Fleet In A File](./course-02-describe-a-fleet-in-a-file.md) | The parts of a Deployment file, `kubectl apply`, applying again, and a Service; then your graded mission |
| [Summary: Fleet Orders On Paper](./course-03-summary.md) | What you learned, a short self-check and cleaning up |

## Why this matters

Almost every real change to a cluster is one of these moves. You scale because traffic grows, you label so that tools can find things, and you keep the fleet in a file so the same fleet can be launched again and again.
