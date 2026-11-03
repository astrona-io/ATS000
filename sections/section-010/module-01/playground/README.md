# The Lab Loop — Playground

- **ID:** PLAYGROUND
- **Slug:** ats-000-playground-010-01
- **Author:** Paris Nakita Kejser
- **Type:** Astrona playground — clean environment, no task, no grading

A single-node kind cluster with the namespace `first-lab`. It holds a healthy
Deployment `hello` and a Deployment `relay` whose image tag has a typo.
Nothing to submit.

## Run it

```sh
astrona run -c .
astrona destroy ats-000-playground-010-01
```

`astrona destroy` takes the environment name (`metadata.name`), not the config
path. `astrona submit` and `astrona test` do not apply: there is no grading.

## Layout

| Path | Purpose |
| --- | --- |
| `config.yaml` | Environment definition (runtime, preloaded image, starting manifests) |
| `manifests/` | The namespace, `hello` and `relay` |
| `docs/overview.md` | What the environment contains and ideas to try |
