# Case study: three planets, three faults

Mission control reports trouble on three planets, but not what kind. You sweep the whole solar system and read the right place for each fault.

## Things worth knowing before you start

- `kubectl get pods -A` shows every planet at once. Read the `STATUS` and `RESTARTS` columns.
- `Pending` is read in the Events of `kubectl describe pod`. A crash loop is read in `kubectl logs`.
- `kubectl set env deployment/<name> KEY=value -n <namespace>` adds a variable to a Deployment.
- `kubectl set resources deployment/<name> --requests=memory=64Mi -n <namespace>` changes a memory request.

## What to do

Sweep the planets, read the right clue for each fault, fix the three Deployments and submit.
