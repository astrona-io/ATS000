# Solution Walkthrough

Mission debrief, astronaut. This lab applies the troubleshooting method to a Service. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-060/module-01/lab-01
$ astrona shell
```

## Step 2: Observe

```console
$ kubectl get deployments,pods,services -n mixed-lab
$ kubectl get endpoints front -n mixed-lab
```

The pods are `Running`. The endpoints list for `front` has no address.

## Step 3: Compare the selector and the labels

```console
$ kubectl describe service front -n mixed-lab
$ kubectl get pods -n mixed-lab --show-labels
```

The Service selector is `app=front`. The pods have `app=frontend`. The `Target Port` of the Service is `8080`, but the container listens on `80`.

## Step 4: Fix the Service

```console
$ kubectl patch service front -n mixed-lab --type=merge -p '{"spec":{"selector":{"app":"frontend"},"ports":[{"port":80,"targetPort":80}]}}'
```

Alternatively use `kubectl edit service front -n mixed-lab` and change the two values.

## Step 5: Check it worked

```console
$ kubectl get endpoints front -n mixed-lab
```

Two addresses are listed.

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-060/module-01/lab-01
$ astrona destroy ats-000-lab-060-01-01
```

The Proctor checks the selector, the target port and the port of the Service, and that `frontend` still has two ready pods.

## What you practised

- Looking before changing.
- Comparing a Service selector with pod labels.
- Checking the target port against the container port.
