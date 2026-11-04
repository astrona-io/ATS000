# A Troubleshooting Method - Playground

- **ID:** PLAYGROUND
- **Slug:** ats-000-playground-060-01
- **Author:** Paris Nakita Kejser
- **Type:** Astrona playground - clean environment, no task, no grading

A single-node kind cluster with the namespace `clinic-lab` and one fault for each common status: a wrong image tag, a memory request that is too big, a crash, a missing ConfigMap and a Service with the wrong selector. Nothing to submit.

## Run it

```sh
astrona run -c .
astrona destroy ats-000-playground-060-01
```

`astrona destroy` takes the environment name (`metadata.name`), not the config
path. `astrona submit` and `astrona test` do not apply: there is no grading.

## Layout

| Path | Purpose |
| --- | --- |
| `config.yaml` | Environment definition |
| `manifests/` | The starting objects |
| `docs/overview.md` | What the environment contains and ideas to try |
