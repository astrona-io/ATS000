---
estimated_duration: 10m
---

# Question

Solve this question on: `terminal`

Astronaut, your first mission is a rescue. A small web app called `hello` runs on the planet (namespace) `first-lab`. Its fleet order (the Deployment `hello`) asks for two ships (pods), but neither of them has started.

What is on the planet `first-lab`:

* `hello`: a Deployment with `replicas: 2`. Each of its pods has one container, named `web`, that should run the nginx web server on port `80`.

**Time:** about 10 minutes. **Weight:** getting started.

In the namespace `first-lab`:

1.  Find out why the `hello` pods are not running.
2.  Fix the `hello` Deployment so it runs the image `nginx:1.27-alpine`.

Keep to these rules:

* Keep `hello` at **2** replicas.
* Do not delete and recreate the namespace.

You are done when:

* Both `hello` pods show `Running` and `1/1` in `kubectl get pods -n first-lab`.
* `astrona submit` reports every check as passed. The grader checks the live Deployment: its image is `nginx:1.27-alpine`, it still asks for 2 replicas, and 2 of its pods are ready.
