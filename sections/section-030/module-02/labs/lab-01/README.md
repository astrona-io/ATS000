---
estimated_duration: 15m
---

# Write The Radar Fleet Order

Graded lab for the YAML module. The planet `yaml-lab` is empty, and the student writes the Deployment `radar` in a file. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-030/module-02/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-030/module-02/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-lab-030-02-01
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` check on ready pods | `radar` has 2 ready pods (2 points) |
| `jsonpath` checks on the spec | Replicas, pod label, container name, image, port and the `MODE` variable |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
