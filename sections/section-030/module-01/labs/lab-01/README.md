---
estimated_duration: 15m
---

# Find The Silent Ships

Graded lab for the terminal basics module. On the planet `shell-lab`, two Deployments have no ready ship, for two different reasons. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-030/module-01/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-030/module-01/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-lab-030-01-01
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on `south` | It asks for 2 replicas and has 2 ready (2 points) |
| `jsonpath` checks on `east` | It runs `nginx:1.27-alpine` and has 2 ready (2 points) |
| `jsonpath` check on `north` | It still has 2 replicas |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
