---
estimated_duration: 15m
---

# Launch A Fleet From A File

Graded lab for the module on scaling, labels and files. The planet `launch-lab` starts empty. You write a Deployment and a Service in files, apply them and submit. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-020/module-01/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-020/module-01/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-lab-020-01-01
```

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
