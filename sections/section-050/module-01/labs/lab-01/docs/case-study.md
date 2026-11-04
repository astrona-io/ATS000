# Case study: a gate that cannot read its settings

The `gate` ship is built but cannot start. Its fleet order points to a ConfigMap and a Secret, and nobody created them.

## Things worth knowing before you start

- A ConfigMap holds plain settings. A Secret holds private values. Both are objects in a namespace.
- `kubectl describe pod` shows the status `CreateContainerConfigError` and an event that names the missing object.
- `kubectl create configmap <name> --from-literal=KEY=value -n <namespace>` makes a ConfigMap.
- `kubectl create secret generic <name> --from-literal=KEY=value -n <namespace>` makes a Secret.

## What to do

Read the event, create the two objects the Deployment names, and watch the pod start. Then submit.
