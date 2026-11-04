---
estimated_duration: 25m
---

# Question

Solve this question on: `terminal`

Astronaut, the planet (namespace) `cargo-lab` has two ships that cannot start.

What is on the planet `cargo-lab`:

* `hold`: a Deployment with `replicas: 2`. Revision 1 was fine; revision 2 is stuck.
* `lock`: a Deployment with `replicas: 1`. It reads the variable `PIN` from the Secret `lock-key` (key `PIN`).

**Time:** about 25 minutes. **Weight:** capstone of section 050.

In the namespace `cargo-lab`:

1.  Return `hold` to its last good release, so both pods are ready on the older template.
2.  Make the `lock` pod start by creating the Secret `lock-key` with the key `PIN` set to `4721`.

Keep to these rules:

* Keep `hold` at 2 replicas and `lock` at 1.
* Do not edit the Deployment `lock`. Do not delete the namespace.

You are done when:

* `hold` shows `2/2` and `lock` shows `1/1`.
* `astrona submit` reports every check as passed.
