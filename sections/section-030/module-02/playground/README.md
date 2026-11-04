# Read And Write YAML - Playground

- **ID:** PLAYGROUND
- **Slug:** ats-000-playground-030-02
- **Author:** Paris Nakita Kejser
- **Type:** Astrona playground - clean environment, no task, no grading

A single-node kind cluster with the namespace `draft-lab` and one healthy Deployment, `sample`, that has a label, a port and an environment variable. Nothing to submit.

## Run it

```sh
astrona run -c .
astrona destroy ats-000-playground-030-02
```

`astrona destroy` takes the environment name (`metadata.name`), not the config
path. `astrona submit` and `astrona test` do not apply: there is no grading.

## Layout

| Path | Purpose |
| --- | --- |
| `config.yaml` | Environment definition |
| `manifests/` | The starting objects |
| `docs/overview.md` | What the environment contains and ideas to try |
