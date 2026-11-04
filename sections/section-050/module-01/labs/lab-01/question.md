---
estimated_duration: 15m
---

# Question

Solve this question on: `terminal`

Astronaut, the ship `gate` on the planet (namespace) `vault-lab` cannot start. It needs a setting and a private value that do not exist yet.

What is on the planet `vault-lab`:

* `gate`: a Deployment with `replicas: 1`. It reads the variable `GREETING` from the ConfigMap `gate-config` (key `GREETING`) and the variable `TOKEN` from the Secret `gate-secret` (key `TOKEN`).

**Time:** about 15 minutes. **Weight:** module 01 of section 050.

In the namespace `vault-lab`:

1.  Find out why the `gate` pod does not start.
2.  Create the ConfigMap `gate-config` with the key `GREETING` set to `welcome`.
3.  Create the Secret `gate-secret` with the key `TOKEN` set to `orbit-77`.

Keep to these rules:

* Do not edit the Deployment `gate`.
* Do not delete the namespace.

You are done when:

* The `gate` pod shows `Running` and `1/1`.
* `astrona submit` reports every check as passed.
