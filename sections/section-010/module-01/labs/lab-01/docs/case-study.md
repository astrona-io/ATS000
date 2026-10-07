# Case study: the app that never started

Someone deployed a tiny web app, `hello`, into the namespace `first-lab` and
went for lunch. Nothing has been reachable since. They are sure the app is
fine — "it's just nginx".

Things worth knowing before you start:

- A **pod** is one running copy of an app. A **Deployment** keeps the right
  number of pods running and replaces them when they break.
- `kubectl get pods -n first-lab` lists the pods and their **status**. Anything
  other than `Running` is a clue.
- `kubectl describe pod <name> -n first-lab` prints a pod's details. The
  **Events** list at the bottom is where Kubernetes says what went wrong.
- A container image name has two parts: the name and the **tag** after the
  colon, e.g. `nginx:1.27-alpine`. If the tag does not exist, Kubernetes cannot
  download (pull) it.

Find what the events say, then change the Deployment so it uses an image that
exists. The task asks for `nginx:1.27-alpine`.
