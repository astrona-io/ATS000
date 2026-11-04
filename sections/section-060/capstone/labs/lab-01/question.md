---
estimated_duration: 30m
---

# Question

Solve this question on: `terminal`

Astronaut, the planet (namespace) `drill-lab` has four faults. Find each one and fix it.

What is on the planet `drill-lab`:

* `alpha`, `beta` and `gamma`: Deployments with `replicas: 1`, container `web`, image `nginx:1.27-alpine`. None of them is ready.
* `delta-web`: a healthy Deployment with `replicas: 1`.
* `delta`: a Service on port 80 that should reach the `delta-web` pods.

**Time:** about 30 minutes. **Weight:** capstone of section 060.

In the namespace `drill-lab`:

1.  Make `alpha`, `beta` and `gamma` ready, each with the smallest fix. Keep the image `nginx:1.27-alpine` and 1 replica. For `gamma`, keep its start command.
2.  Make the Service `delta` reach the `delta-web` pod.

Keep to these rules:

* Fix Deployments and the Service, not pods.
* Do not delete the namespace.

You are done when:

* All Deployments are `1/1` and `kubectl get endpoints delta -n drill-lab` lists an address.
* `astrona submit` reports every check as passed.
