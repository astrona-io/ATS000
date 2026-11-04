---
estimated_duration: 25m
---

# Question

Solve this question on: `terminal`

Astronaut, three planets report trouble: `deck-a`, `deck-b` and `deck-c`. Each one has one Deployment with a different fault.

What is in the solar system:

* `relay-a` in `deck-a`: a Deployment with `replicas: 1`.
* `relay-b` in `deck-b`: a Deployment with `replicas: 1`. Its pod does not stay up.
* `relay-c` in `deck-c`: a Deployment with `replicas: 1`. Its pod never starts.
* All three run `nginx:1.27-alpine` in a container named `web`.

**Time:** about 25 minutes. **Weight:** capstone of section 040.

Do these three things:

1.  Make `relay-a` run **3** replicas.
2.  Find why the `relay-b` pod keeps stopping and fix the Deployment. Keep its start command.
3.  Find why the `relay-c` pod never starts and fix the Deployment. Keep its image.

Keep to these rules:

* Fix Deployments, not pods.
* Keep `relay-b` and `relay-c` at 1 replica. Do not delete any namespace.

You are done when:

* `kubectl get deployments -A` shows `3/3` for `relay-a` and `1/1` for the other two.
* `astrona submit` reports every check as passed.
