# A Troubleshooting Method

Astronaut, a broken ship is not a mystery. It leaves clues, and the clues follow a pattern. This module gives you one method to use every time, and a table that links each pod status to the likely fault.

## Learning objectives

After this module you can:

- Follow the same four steps for any fault: look, narrow, read the clue, make the smallest fix.
- Read a pod status and name the likely cause.
- Explain how a Service finds pods, and what an empty endpoints list means.
- Fix a Service selector or port that does not match.
- Keep short notes and habits that make the next fault faster.

## Before you start

You should know the kubectl toolkit, ConfigMaps and rollouts. Your playground has the planet `clinic-lab` with six Deployments, each with a different fault, and one healthy one. Launch it now and keep it running:

<!-- astrona:playground -->

## The parts of this module

Read the parts in this order. Each one takes about 10 minutes.

| Part | What you learn |
| --- | --- |
| [The Four-Step Method](./course-01-the-four-step-method.md) | Look, narrow, read the clue, smallest fix |
| [Read The Pod Status](./course-02-read-the-pod-status.md) | `ImagePullBackOff`, `Pending`, `CrashLoopBackOff`, `CreateContainerConfigError` |
| [Services And Endpoints](./course-03-services-and-endpoints.md) | Selectors, ports, `get endpoints`; then your graded mission |
| [Notes And Habits](./course-04-notes-and-habits.md) | Write the fault down, change one thing, verify |
| [Summary: A Calm Mind](./course-05-summary.md) | What you learned, a short self-check and cleaning up |

## Why this matters

Most time lost in a Kubernetes fault is lost guessing. A method turns guessing into reading.
