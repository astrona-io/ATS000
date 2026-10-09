# Task: Bring A Deployment Back To Life

**Time:** about 10 minutes · **Weight:** Getting started

## Scenario

A small web app called `hello` runs in the namespace `first-lab`. It should
have two copies (pods) running, but neither of them has started.

## Your task

In the namespace `first-lab`:

1. Find out why the `hello` pods are not running.
2. Fix the `hello` Deployment so it runs the image `nginx:1.27-alpine`.

## Constraints

- Keep `hello` at **2** replicas.
- Do not delete and recreate the namespace.

## Done when

- Both `hello` pods show `Running` and `1/1` in `kubectl get pods -n first-lab`.
- `astrona submit` reports every check as passed.
