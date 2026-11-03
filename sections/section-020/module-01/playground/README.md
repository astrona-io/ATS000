# Scale, Label And Launch From A File — Playground

- **ID:** PLAYGROUND
- **Slug:** ats-000-playground-020-01
- **Author:** Paris Nakita Kejser
- **Type:** Astrona playground — clean environment, no task, no grading

A single-node kind cluster with the namespace `fleet-lab` and two healthy
Deployments: `crew` (1 replica) and `cargo` (2 replicas). Nothing to submit.

## Run it

```sh
astrona run -c .
astrona destroy ats-000-playground-020-01
```

`astrona destroy` takes the environment name (`metadata.name`), not the config
path. `astrona submit` and `astrona test` do not apply: there is no grading.

## Layout

| Path | Purpose |
| --- | --- |
| `config.yaml` | Environment definition |
| `manifests/` | The namespace and the two Deployments |
| `docs/overview.md` | What the environment contains and ideas to try |
