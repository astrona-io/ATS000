# Case study: a planet with three problems

The planet `orbit-lab` hosts three small services, and all three need attention after a busy week. One needs more ships and a label, plus a call sign. One never started. One starts and stops.

## Things worth knowing before you start

- `kubectl scale deployment/<name> --replicas=<n>` changes the number of ships.
- Labels on the pod template (`spec.template.metadata.labels`) end up on every pod. Add a label there with `kubectl edit` or `kubectl patch`.
- A Service picks pods by label. `kubectl get endpoints <name>` shows which pods it found.
- `Pending` means no node was found: read the Events. A crash loop means the container stops: read `kubectl logs`.

## What to do

Start with a roll call. Then work on one fleet at a time and check it before you move on. Submit when every pod is `1/1` and `Running`.
