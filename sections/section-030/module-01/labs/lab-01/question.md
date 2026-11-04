---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, the planet (namespace) `shell-lab` has three fleet orders, and two of them have no ship in flight.

What is on the planet `shell-lab`:

* `north`: a Deployment with `replicas: 2`, healthy.
* `south`: a Deployment with `replicas: 0`.
* `east`: a Deployment with `replicas: 2`. Its container is named `web` and should run `nginx:1.27-alpine`.

**Time:** about 15 minutes. **Weight:** module 01 of section 030.

In the namespace `shell-lab`:

1.  Find the Deployments that have no ready ship. Use a roll call and a pipe if you like.
2.  Make `south` run **2** replicas.
3.  Make `east` run the image `nginx:1.27-alpine`.

Keep to these rules:

* Keep `north` as it is.
* Fix the Deployments, not the pods. Do not delete the namespace.

You are done when:

* `kubectl get deployments -n shell-lab` shows `2/2` for all three.
* `astrona submit` reports every check as passed.
