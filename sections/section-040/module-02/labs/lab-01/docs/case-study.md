# Case study: a note for a ship in another bay

Two ships need attention. One of them, `hatch`, must carry a note that you write inside it. The other, `drone`, is not on the planet you would expect.

## Things worth knowing before you start

- `kubectl get deployments -A` lists Deployments in every namespace.
- `kubectl exec` runs a command inside a container. After `--`, everything is the command.
- The web server in the `hatch` pod serves files from `/usr/share/nginx/html`.
- A file written inside a pod is lost if the pod is replaced. Do not delete the pod after you write the note.

## What to do

Write the note, find and scale `drone`, and submit.
