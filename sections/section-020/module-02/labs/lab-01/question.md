---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, two ships on the planet (namespace) `rescue-lab` are not flying. Each one is stuck in a different way.

What is on the planet `rescue-lab`:

* `hauler`: a Deployment with `replicas: 1`. Its container is named `web` and runs `nginx:1.27-alpine`.
* `flicker`: a Deployment with `replicas: 1`. Its container is named `web` and runs `nginx:1.27-alpine`.

**Time:** about 15 minutes. **Weight:** module 02 of section 020.

In the namespace `rescue-lab`:

1.  Find out why the `hauler` pod is not running, and fix the Deployment so the pod starts. Keep its image.
2.  Find out why the `flicker` pod keeps crashing, and fix the Deployment so the pod stays up. The container must run the image's own start command.

Keep to these rules:

* Keep both Deployments at **1** replica and on the image `nginx:1.27-alpine`.
* Fix the Deployments, not the pods. Do not delete the namespace.

You are done when:

* Both pods show `Running` and `1/1` in `kubectl get pods -n rescue-lab`.
* `astrona submit` reports every check as passed. The grader checks the live Deployments: the ready count, the replicas, the image, and that `flicker` has no command override.
