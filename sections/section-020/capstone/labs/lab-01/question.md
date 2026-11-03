---
estimated_duration: 25m
---

# Question

Solve this question on: `terminal`

Astronaut, the planet (namespace) `orbit-lab` is in trouble. Three fleets need your help, and each one needs a different kind of fix.

What is on the planet `orbit-lab`:

* `crew`: a Deployment with `replicas: 1`. Its pods carry the label `app: crew`. There is no Service for it.
* `hauler`: a Deployment with `replicas: 1`. Its pod does not start.
* `flicker`: a Deployment with `replicas: 1`. Its pod starts and stops again and again.
* Every container is named `web` and runs `nginx:1.27-alpine`.

**Time:** about 25 minutes. **Weight:** section 020 capstone.

In the namespace `orbit-lab`:

1.  Scale `crew` to **3** replicas, and add the pod label `tier: front` (keep `app: crew`).
2.  Create a Service named `crew` that listens on port `80` and sends traffic to the pods with the label `app: crew`. Write it in a file and apply it.
3.  Find out why the `hauler` pod does not start, and fix its Deployment.
4.  Find out why the `flicker` pod keeps stopping, and fix its Deployment. The container must run the image's own start command.

Keep to these rules:

* Keep `hauler` and `flicker` at **1** replica and on the image `nginx:1.27-alpine`.
* Fix the Deployments, not the pods. Do not delete the namespace.

You are done when:

* All pods show `Running` and `1/1` in `kubectl get pods -n orbit-lab`.
* `kubectl get endpoints crew -n orbit-lab` lists three addresses.
* `astrona submit` reports every check as passed.
