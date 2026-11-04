---
estimated_duration: 25m
---

# Question

Solve this question on: `terminal`

Astronaut, the planet (namespace) `deck-lab` needs one repair and one new fleet order.

What is on the planet `deck-lab`:

* `lamp`: a Deployment with `replicas: 1`. Its container is named `web` and should run `nginx:1.27-alpine`.
* No `gauge` yet.

**Time:** about 25 minutes. **Weight:** capstone of section 030.

In the namespace `deck-lab`:

1.  Make `lamp` run the image `nginx:1.27-alpine` and **2** replicas, so that both pods are ready.
2.  Write a new Deployment `gauge` in a YAML file and apply it: **2** replicas, image `nginx:1.27-alpine`, port **80**, pod labels `app: gauge` and `tier: ops`, and one environment variable `UNIT` with the value `metric`.

Keep to these rules:

* Fix and create Deployments, not pods.
* Do not delete the namespace.

You are done when:

* Both Deployments show `2/2` in `kubectl get deployments -n deck-lab`.
* `astrona submit` reports every check as passed.
