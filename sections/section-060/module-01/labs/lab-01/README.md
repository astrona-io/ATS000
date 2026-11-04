---
estimated_duration: 15m
---

# The Beacon That Reaches No One

Graded lab for the troubleshooting method module. A healthy Deployment sits behind a Service with the wrong selector and the wrong target port. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-060/module-01/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-060/module-01/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-lab-060-01-01
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on `front` | Selector `app=frontend`, target port 80 (2 points) and port 80 |
| `jsonpath` check on `frontend` | 2 ready pods |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
