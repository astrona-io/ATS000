---
estimated_duration: 25m
---

# Capstone: Mission Control Sweep

Capstone for section 040. Three planets, three faults: a scale, a crash that the log explains, and a Pending pod. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-040/capstone/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-040/capstone/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-capstone-040
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on `relay-a` | 3 replicas and 3 ready (2 points) |
| `jsonpath` checks on `relay-b` | `MODE=on` and 1 ready (2 points) |
| `jsonpath` checks on `relay-c` | 1 ready (2 points) and the image is unchanged |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
