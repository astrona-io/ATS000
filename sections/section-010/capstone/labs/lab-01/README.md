---
estimated_duration: 15m
---

# Capstone: First Flight Check

Graded capstone for section 010. Two planets each hold a fleet order that never started, and each has a different mistake in its image. Use the whole loop: run, look, fix, submit. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-010/capstone/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-010/capstone/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-capstone-010
```

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
