# Case study: the app that never started

Someone deployed a tiny web app, `hello`, into the namespace `first-lab` and went for lunch. Nothing has been reachable since. They are sure the app is fine: "it's just nginx".

## Things worth knowing before you start

These facts are all you need for this mission. Each one comes with a space picture you can keep for every later lab.

- A **namespace** is a named area of the cluster, like a planet in a solar system. Here the planet is `first-lab`, so add `-n first-lab` to your `kubectl` commands.
- A **pod** is one running copy of an app: a spaceship. A **Deployment** is the fleet order that keeps the right number of pods running and replaces them when they break.
- `kubectl get pods -n first-lab` is a roll call: it lists the pods and their **status**. Anything other than `Running` is a clue.
- `kubectl describe pod <name> -n first-lab` prints a pod's full flight record. The **Events** list at the bottom is where Kubernetes says what went wrong.
- A container image is the ship's blueprint. Its name has two parts: the name and the **tag** after the colon, for example `nginx:1.27-alpine`. If the tag does not exist, Kubernetes cannot download (pull) it, and the ship never launches.

## What to do

Find what the events say, then change the Deployment so it uses an image that exists. The task asks for `nginx:1.27-alpine`. Fix the Deployment, not the pods: the Deployment builds new pods from its own order.
