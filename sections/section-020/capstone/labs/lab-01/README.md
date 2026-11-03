---
estimated_duration: 25m
---

# Capstone: Fleet Recovery

Graded capstone for section 020. One planet has three fleets that need work: one must be scaled, labelled and given a Service, one is `Pending`, and one is in a crash loop. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-020/capstone/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-020/capstone/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-capstone-020
```

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
