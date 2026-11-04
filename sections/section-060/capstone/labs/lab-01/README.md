---
estimated_duration: 30m
---

# Capstone: The Four-Fault Drill

Capstone for section 060. Four faults on one planet: an image tag, a Pending pod, a crash with a clue in the log and a Service selector. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-060/capstone/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-060/capstone/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-capstone-060
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on `alpha` and `beta` | The image, and 1 ready each (2 points each) |
| `jsonpath` checks on `gamma` | `MODE=on` and 1 ready (2 points) |
| `jsonpath` check on `delta` | Selector `app=delta-web` (2 points) |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
