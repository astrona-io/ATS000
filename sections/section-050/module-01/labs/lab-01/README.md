---
estimated_duration: 15m
---

# Give The Gate Its Settings

Graded lab for the ConfigMaps and Secrets module. `gate` cannot start until the student creates the ConfigMap and the Secret it names. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-050/module-01/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-050/module-01/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-lab-050-01-01
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on the two objects | `GREETING=welcome` and `TOKEN` (stored as base64) |
| `jsonpath` checks on `gate` | 1 ready pod (2 points) and the reference to `gate-config` is unchanged |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
