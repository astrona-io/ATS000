---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, two ships on two planets need you. One needs a note written inside it, and the other needs more crew.

What is in the solar system:

* `hatch`: a Deployment with `replicas: 1` on the planet `bay-lab`.
* `drone`: a Deployment with `replicas: 1`, on a planet you must find.

**Time:** about 15 minutes. **Weight:** module 02 of section 040.

Do these two things:

1.  Inside the `hatch` pod, create the file `/usr/share/nginx/html/status.txt` with the text `docked`.
2.  Find the planet that holds `drone`, and make it run **2** replicas.

Keep to these rules:

* Use `kubectl exec` for the file. Do not restart or delete the `hatch` pod after you write it.
* Keep `hatch` at 1 replica. Do not delete any namespace.

You are done when:

* `kubectl exec deploy/hatch -n bay-lab -- cat /usr/share/nginx/html/status.txt` prints `docked`.
* `astrona submit` reports every check as passed.
