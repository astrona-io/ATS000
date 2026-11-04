# ConfigMaps And Secrets - Playground

- **ID:** PLAYGROUND
- **Slug:** ats-000-playground-050-01
- **Author:** Paris Nakita Kejser
- **Type:** Astrona playground - clean environment, no task, no grading

A single-node kind cluster with the namespace `config-lab`: the ConfigMap `site-config` (keys `colour` and `mode`), the Secret `site-secret` (key `key`) and the Deployment `site`, which uses them as variables and as files. Nothing to submit.

## Run it

```sh
astrona run -c .
astrona destroy ats-000-playground-050-01
```

`astrona destroy` takes the environment name (`metadata.name`), not the config
path. `astrona submit` and `astrona test` do not apply: there is no grading.

## Layout

| Path | Purpose |
| --- | --- |
| `config.yaml` | Environment definition |
| `manifests/` | The starting objects |
| `docs/overview.md` | What the environment contains and ideas to try |
