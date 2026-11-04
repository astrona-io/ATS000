---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, the ships of `frontend` fly, but the beacon `front` reaches none of them.

What is on the planet (namespace) `mixed-lab`:

* `frontend`: a Deployment with `replicas: 2`. Its pods carry the label `app: frontend` and listen on port **80**.
* `front`: a Service on port **80**.

**Time:** about 15 minutes. **Weight:** module 01 of section 060.

In the namespace `mixed-lab`:

1.  Find out why the Service `front` has no endpoints.
2.  Fix the Service so that it reaches the `frontend` pods on their port.

Keep to these rules:

* Fix the Service, not the Deployment.
* Keep the Service port at **80**. Do not delete the namespace.

You are done when:

* `kubectl get endpoints front -n mixed-lab` lists two addresses.
* `astrona submit` reports every check as passed.
