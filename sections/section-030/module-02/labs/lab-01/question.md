---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, the planet (namespace) `yaml-lab` is empty. Write a fleet order in a YAML file and apply it.

What is on the planet `yaml-lab`:

* Nothing yet. The namespace exists and has no Deployments.

**Time:** about 15 minutes. **Weight:** module 02 of section 030.

In the namespace `yaml-lab`, create one Deployment:

1.  Name: `radar`. Replicas: **2**.
2.  The pod label `app: radar`, and a selector that matches it.
3.  One container named `scanner`, running the image `nginx:1.27-alpine` and listening on port **80**.
4.  One environment variable in that container: `MODE` with the value `scan`.

Keep to these rules:

* Write the Deployment in a YAML file and apply it with `kubectl apply -f`.
* Do not use another namespace.

You are done when:

* `kubectl get deployment radar -n yaml-lab` shows `2/2`.
* `astrona submit` reports every check as passed.
