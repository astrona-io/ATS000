---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, the fleet order `engine` on the planet (namespace) `release-lab` was updated, and the new release cannot start.

What is on the planet `release-lab`:

* `engine`: a Deployment with `replicas: 2` and a container named `web`. It has two revisions. Revision 1 ran fine; revision 2 is stuck.

**Time:** about 15 minutes. **Weight:** module 02 of section 050.

In the namespace `release-lab`:

1.  Find out why the new release is stuck.
2.  Return `engine` to the last good release, so that both pods are ready on the older template.

Keep to these rules:

* Keep **2** replicas.
* Do not delete the Deployment or the namespace.

You are done when:

* `kubectl rollout status deployment/engine -n release-lab` reports a finished rollout.
* `astrona submit` reports every check as passed.
