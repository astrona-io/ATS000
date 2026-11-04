# Solution Walkthrough

Mission debrief, astronaut. This lab creates the two objects a Deployment already points to. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-050/module-01/lab-01
$ astrona shell
```

## Step 2: Look at the pod

```console
$ kubectl get pods -n vault-lab
$ kubectl describe pod <GATE_POD_NAME> -n vault-lab
```

The status is `CreateContainerConfigError`. The Events say that the ConfigMap `gate-config` (or the Secret `gate-secret`) was not found.

## Step 3: Create the ConfigMap

```console
$ kubectl create configmap gate-config --from-literal=GREETING=welcome -n vault-lab
```

## Step 4: Create the Secret

```console
$ kubectl create secret generic gate-secret --from-literal=TOKEN=orbit-77 -n vault-lab
```

## Step 5: Check it worked

```console
$ kubectl get pods -n vault-lab
```

The kubelet retries on its own. Within a minute the pod is `1/1` and `Running`. If you do not want to wait, run `kubectl rollout restart deployment/gate -n vault-lab`.

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-050/module-01/lab-01
$ astrona destroy ats-000-lab-050-01-01
```

The Proctor checks the two stored values, that `gate` has one ready pod, and that it still reads `GREETING` from `gate-config`.

## What you practised

- Reading `CreateContainerConfigError` and the event behind it.
- Creating a ConfigMap and a Secret from the command line.
- Fixing a pod by creating what it asks for.
