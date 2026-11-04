---
estimated_duration: 25m
---

# Capstone: The Deck Check

Capstone for section 030. The planet `deck-lab` has one broken Deployment, `lamp`, and needs a new one, `gauge`. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-030/capstone/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-030/capstone/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-capstone-030
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on `lamp` | Image, 2 replicas and 2 ready (2 points) |
| `jsonpath` checks on `gauge` | 2 ready (2 points), the `tier=ops` label and the `UNIT` variable |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
