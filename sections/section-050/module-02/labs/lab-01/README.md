---
estimated_duration: 15m
---

# Undo The Bad Release

Graded lab for the rollouts module. `engine` has a stuck second revision, and the student rolls back to the first. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-050/module-02/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-050/module-02/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-lab-050-02-01
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on the template | The image `nginx:1.27-alpine` and `RELEASE=stable` |
| `jsonpath` checks on the counts | 2 updated and 2 ready (2 points each) |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
