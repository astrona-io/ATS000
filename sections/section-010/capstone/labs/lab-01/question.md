---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, two fleet orders on two different planets never launched their ships. You are the only pilot on duty.

What is in the solar system:

* Planet (namespace) `dock`: the Deployment `scout` with `replicas: 2`.
* Planet (namespace) `hangar`: the Deployment `cargo` with `replicas: 3`.
* Each pod has one container, named `web`, that should run the nginx web server on port `80`.

**Time:** about 15 minutes. **Weight:** section 010 capstone.

1.  Find out why the `scout` pods in `dock` are not running, and fix the Deployment so it runs the image `nginx:1.27-alpine`.
2.  Find out why the `cargo` pods in `hangar` are not running, and fix the Deployment so it runs the image `nginx:1.27-alpine`.

Keep to these rules:

* Keep `scout` at **2** replicas and `cargo` at **3** replicas.
* Fix the Deployments, not the pods. Do not delete the namespaces.

You are done when:

* All pods in `dock` and `hangar` show `Running` and `1/1`.
* `astrona submit` reports every check as passed. The grader checks both live Deployments: the image, the replica count and the ready count.
