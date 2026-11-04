---
estimated_duration: 15m
---

# Read The Examiner's Hints

Graded lab for the Astrona workflow module. The starting state fails several checks on purpose, so the student reads the feedback. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-040/module-01/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-040/module-01/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-lab-040-01-01
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on `panel` | 3 replicas, 3 ready (2 points) and the label `tier=ops` |
| `jsonpath` checks on `dial` | The image `nginx:1.27-alpine` and 1 ready (2 points) |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
