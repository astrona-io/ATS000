---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, a new web app called `relay` must fly on the planet (namespace) `launch-lab`. The planet is empty. You write the fleet order and its call sign yourself, in files.

**Time:** about 15 minutes. **Weight:** module 01 of section 020.

In the namespace `launch-lab`:

1.  Create a Deployment named `relay` with **3** replicas. Its container is named `web`, runs the image `nginx:1.27-alpine` and opens port `80`.
2.  Give the pods the labels `app: relay` and `tier: front`. The Deployment must select its pods with `app: relay`.
3.  Create a Service named `relay` that listens on port `80` and sends traffic to the pods with the label `app: relay`.

Keep to these rules:

* Write the objects in YAML files and apply them with `kubectl apply -f`.
* Do not create anything in other namespaces.

You are done when:

* All 3 `relay` pods show `Running` and `1/1`.
* `kubectl get endpoints relay -n launch-lab` lists three addresses.
* `astrona submit` reports every check as passed. The grader checks the live Deployment and the live Service.
