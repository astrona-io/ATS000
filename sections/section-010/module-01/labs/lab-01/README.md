# Your First Lab: Bring A Deployment Back To Life

The first Astrona lab: a two-pod Deployment never starts because its image tag
has a typo. It teaches the loop every lab uses — `astrona run`, look with
`kubectl`, fix, `astrona submit` — in about 10 minutes and 1.2 GB of memory.

```sh
astrona run ATS000/section-010/module-01/lab-01
astrona docs question
```

For authors: `astrona validate -c .` and `astrona test -c .` (the reference
solution in `solution/` must pass every check).
