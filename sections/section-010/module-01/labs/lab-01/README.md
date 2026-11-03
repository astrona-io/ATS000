---
estimated_duration: 10m
---

# Your First Lab: Bring A Deployment Back To Life

Welcome to your first mission, astronaut. A two-pod Deployment never starts because its image tag has a typo. This lab teaches the loop every lab uses: `astrona run`, look with `kubectl`, fix, `astrona submit`. It takes about 10 minutes and 1.2 GB of memory.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-010/module-01/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-010/module-01/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ATS000/section-010/module-01/lab-01
```

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
