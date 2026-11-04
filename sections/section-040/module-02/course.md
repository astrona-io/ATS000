# The kubectl Toolkit

Astronaut, `kubectl` is your radio to the cluster. Almost every mission uses the same six or seven calls. This module teaches them one by one, so you can ask any cluster what is going on.

## Learning objectives

After this module you can:

- List namespaces, and choose one with `-n` or all of them with `-A`.
- Shape the output of `kubectl get` with `-o wide`, `-o name`, `-o yaml` and `-o jsonpath`.
- Filter with a label selector (`-l`).
- Explain a ship with `kubectl describe` and read its events.
- Read logs, including the log of the previous run with `--previous`.
- Run a command inside a pod with `kubectl exec`.
- Reach a Service from your computer with `kubectl port-forward`.

## Before you start

You should know the Astrona workflow from the previous module and be able to read YAML. Your playground has two planets. On `harbor` there are `beacon` (healthy, with a Service) and `stutter` (a ship that starts and exits). On `harbor-b` there is `buoy`. Launch it now and keep it running:

<!-- astrona:playground -->

## The parts of this module

Read the parts in this order. Each one takes about 10 minutes.

| Part | What you learn |
| --- | --- |
| [Planets And Namespaces](./course-01-planets-and-namespaces.md) | `get namespaces`, `-n`, `-A`, `kubectl config` basics |
| [Shape The Output With -o](./course-02-shape-the-output-with-o.md) | `-o wide`, `name`, `yaml`, `jsonpath`, labels and `-l` |
| [Describe, Events And Logs](./course-03-describe-events-and-logs.md) | `describe`, `get events`, `logs`, `--previous` |
| [Exec And Port-Forward](./course-04-exec-and-port-forward.md) | `exec`, `port-forward`; then your graded mission |
| [Summary: Your Radio Is Tuned](./course-05-summary.md) | What you learned, a short self-check and cleaning up |

## Why this matters

When something breaks, you do not guess. You ask the cluster, with the right call, and read what it says. These seven calls answer most questions.
