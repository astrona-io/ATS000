---
estimated_duration: 15m
---

# Rescue Two Stuck Ships

Graded lab for the module on stuck pods. On the planet `rescue-lab`, one pod is `Pending` and another is in a crash loop. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-020/module-02/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-020/module-02/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-lab-020-02-01
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on `hauler` | One replica, the image `nginx:1.27-alpine`, and the pod is ready (2 points) |
| `jsonpath` checks on `flicker` | One replica, the image `nginx:1.27-alpine`, and the pod is ready (2 points) |
| `validate-flicker-default-command.sh` | The container has no `command` or `args` override |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
