---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, the planet (namespace) `console-lab` will fail inspection as it stands.

What is on the planet `console-lab`:

* `panel`: a Deployment with `replicas: 1`. Its container is named `web`.
* `dial`: a Deployment with `replicas: 1`. Its container is named `web` and should run `nginx:1.27-alpine`.

**Time:** about 15 minutes. **Weight:** module 01 of section 040.

In the namespace `console-lab`:

1.  Run `astrona submit` once now and read the failed checks and their hints.
2.  Make `panel` run **3** replicas, and give the Deployment `panel` the label `tier=ops`.
3.  Make `dial` run the image `nginx:1.27-alpine`.

Keep to these rules:

* Fix the Deployments, not the pods.
* Do not delete the namespace.

You are done when:

* `kubectl get deployments -n console-lab` shows `3/3` for `panel` and `1/1` for `dial`.
* `astrona submit` reports every check as passed.
