# Case study: a new app with no fleet order

A team wants a small web app called `relay` on the planet `launch-lab`. Nothing exists yet. They want three ships, a label that marks them as the front line, and one call sign that other ships can use.

## Things worth knowing before you start

- A **Deployment** file has `apiVersion`, `kind`, `metadata` and `spec`. The design of one pod is in `spec.template`.
- `spec.selector.matchLabels` says which pods belong to the Deployment. `spec.template.metadata.labels` gives those labels to new pods. The two must match.
- A **Service** has a `selector` that picks pods by label, and a `port` it listens on.
- `kubectl apply -f <file>` gives a file to Kubernetes. `kubectl get endpoints <name>` shows which pods a Service found.

## What to do

Write two files, one for the Deployment and one for the Service. Apply both. Check that the Service found three pods, then submit.
