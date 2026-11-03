# Find Why Ships Will Not Fly — Playground

- **ID:** PLAYGROUND
- **Slug:** ats-000-playground-020-02
- **Author:** Paris Nakita Kejser
- **Type:** Astrona playground — clean environment, no task, no grading

A single-node kind cluster with the namespace `rescue-lab` and two broken
Deployments: `hauler` (its pod stays `Pending`) and `flicker` (its pod ends in
`CrashLoopBackOff`). Nothing to submit.

## Run it

```sh
astrona run -c .
astrona destroy ats-000-playground-020-02
```

`astrona destroy` takes the environment name (`metadata.name`), not the config
path. `astrona submit` and `astrona test` do not apply: there is no grading.

## Layout

| Path | Purpose |
| --- | --- |
| `config.yaml` | Environment definition |
| `manifests/` | The namespace and the two broken Deployments |
| `docs/overview.md` | What the environment contains and ideas to try |
