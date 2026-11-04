---
estimated_duration: 15m
---

# Write A Note Inside A Ship

Graded lab for the kubectl toolkit module. The student writes a file inside a pod with `kubectl exec` and scales a Deployment in another namespace. The task is in `question.md`; the walkthrough is in `solution.md`.

> UNTESTED: this lab was built and checked statically only. It has not been run with `astrona test`.

## Launching the Lab

Sign in with `astrona login` first, then start the lab and read the task:

```sh
astrona run ATS000/section-040/module-02/lab-01
astrona docs question
```

When you think you have finished, send it for grading:

```sh
astrona submit ATS000/section-040/module-02/lab-01
```

When you are done, remove the lab:

```sh
astrona destroy ats-000-lab-040-02-01
```

## Checks

| Check | What it proves |
| --- | --- |
| `jsonpath` checks on `drone` | 2 replicas and 2 ready (2 points) |
| `jsonpath` check on `hatch` | Still 1 replica |
| `validate-hatch-status.sh` | The pod holds `status.txt` with the text `docked` |

For authors: `astrona validate -c .` and `astrona test -c .` (the reference solution in `solution/` must pass every check).
