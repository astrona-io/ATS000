# Services And Endpoints

A **Service** is a stable address that sends traffic to pods. It finds the pods with a label **selector**. If nothing matches, the Service has no one to send to, even when the pods are healthy.

## How a Service finds pods

The Service has two things that must match the pods: the selector and the target port.

### The two matches

```yaml
spec:
  selector:
    app: frontend
  ports:
    - port: 80
      targetPort: 80
```

`selector` must equal a label on the pods. `targetPort` must be the port the container listens on. `port` is the port of the Service itself.

## Check the endpoints

The **endpoints** are the addresses of the pods that the Service found.

### Read them

```sh
kubectl get endpoints lonely -n clinic-lab
kubectl get pods -n clinic-lab --show-labels
kubectl get service lonely -n clinic-lab -o jsonpath='{.spec.selector}'
```

Newer versions of `kubectl` may print a note that Endpoints are deprecated in favour of EndpointSlices. The command still works. Empty endpoints mean the selector matched no pod, or the pods are not ready. Compare the selector with the pod labels: in `clinic-lab`, the Service `lonely` selects `app=lone`, but the pods carry another label.

### Fix the Service

```sh
kubectl edit service lonely -n clinic-lab
```

Change the selector to the real label, or the `targetPort` to the real port. Then read the endpoints again. They should list one address for each ready pod.

## Your mission: The Beacon That Reaches No One

Pause the playground, then start the mission:

```sh
astrona stop ats-000-playground-060-01
astrona run ATS000/section-060/module-01/lab-01
```

Read the task in [`question.md`](./labs/lab-01/question.md), work in `astrona shell`, then submit. When it passes:

```sh
astrona destroy ats-000-lab-060-01-01
astrona start ats-000-playground-060-01
```

## Common pitfalls

> [!WARNING]
> - **Fixing the Deployment when the Service is wrong.** Check which one the task allows.
> - **A selector with a typo.** Compare it letter by letter with the pod labels.
> - **A wrong `targetPort`.** The endpoints may show addresses, but traffic fails.
> - **Not-ready pods.** They are left out of the endpoints.
> - **Checking in the wrong namespace.** A Service only selects pods in its own namespace.

> *Empty endpoints mean the selector or the pod readiness is wrong.*
