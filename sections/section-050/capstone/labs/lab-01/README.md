---
estimated_duration: 25m
---

# Capstone: Cargo Hold Recovery

Capstone for section 050. `hold` has a stuck second revision to roll back, and `lock` waits for a Secret. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-050/capstone/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-050/capstone/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-capstone-050
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on `hold` | Image, `RELEASE=steady`, 2 updated and 2 ready (2 points each) |
| `jsonpath` checks on `lock-key` and `lock` | `PIN` stored, and 1 ready pod (2 points) |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
