# Case study: three ships, two of them silent

The planet `shell-lab` has three fleet orders. One of them looks fine. The other two have no ship in flight, but for two different reasons.

## Things worth knowing before you start

- `kubectl get deployments -n shell-lab` shows a `READY` column. Read it as ships in flight over ships asked for.
- A pipe sends the output of one command into another. For example `kubectl get deployments -n shell-lab | grep 0/` keeps only the lines that contain `0/`.
- A Deployment with `0/0` was asked for no ships. A Deployment with `0/2` was asked for two and has none ready.
- `kubectl scale` changes the number of replicas. `kubectl set image` changes the image.

## What to do

Find out which Deployment is which kind of silent, fix both, and leave the healthy one alone. Then submit.
