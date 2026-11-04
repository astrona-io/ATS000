# Rollouts And Rollback

Astronaut, a release is a change to a fleet order. Kubernetes replaces ships a few at a time, and it remembers earlier releases. This module shows how to watch a rollout, read its history, and go back when a release goes wrong.

## Learning objectives

After this module you can:

- Explain what a rollout is, and how a Deployment uses ReplicaSets.
- Change an image or a variable with `kubectl set image` and `kubectl set env`.
- Watch a rollout with `kubectl rollout status`.
- Read revisions with `kubectl rollout history`.
- Go back with `kubectl rollout undo`, and to a given revision with `--to-revision`.
- Use `rollout pause`, `rollout resume` and `rollout restart`, and recognise a stuck rollout.

## Before you start

You should know the kubectl toolkit and how a Deployment is written. Your playground has the planet `rollout-lab` with the Deployment `shuttle`: 3 replicas, the image `nginx:1.27-alpine` and the variable `RELEASE=one`. Launch it now and keep it running:

<!-- astrona:playground -->

## The parts of this module

Read the parts in this order. Each one takes about 10 minutes.

| Part | What you learn |
| --- | --- |
| [How A Rollout Works](./course-01-how-a-rollout-works.md) | ReplicaSets, rolling update, what triggers a rollout |
| [Change A Release And Watch It](./course-02-change-a-release-and-watch-it.md) | `set image`, `set env`, `rollout status`, `rollout history` |
| [Undo A Bad Release](./course-03-undo-a-bad-release.md) | `rollout undo`, `--to-revision`, why `set image` is not a rollback |
| [Pause, Restart And Stuck Rollouts](./course-04-pause-restart-and-stuck-rollouts.md) | `pause`, `resume`, `restart`; then your graded mission |
| [Summary: Safe Releases](./course-05-summary.md) | What you learned, a short self-check and cleaning up |

## Why this matters

Every change to a live app is a release. Knowing how to watch one and how to reverse it turns a scary moment into a routine one.
