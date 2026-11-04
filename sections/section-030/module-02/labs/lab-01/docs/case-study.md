# Case study: a fleet order written from nothing

The planet `yaml-lab` exists and is empty. Mission control wants one fleet order for a ship design called `radar`, and nobody has written the file yet.

## Things worth knowing before you start

- A fleet order file starts with `apiVersion: apps/v1` and `kind: Deployment`, then `metadata` and `spec`.
- Indentation uses spaces, never tabs. Children sit two spaces to the right of their parent.
- `spec.selector.matchLabels` must match the labels in `spec.template.metadata.labels`.
- `kubectl apply --dry-run=client -f radar.yaml` reads the file and reports mistakes without changing the cluster.
- `kubectl explain deployment.spec.template.spec.containers` lists the fields of a container.

## What to do

Write the file, check it with a dry run, apply it, and watch the ships start. Then submit.
