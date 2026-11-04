# Solution Walkthrough

Mission debrief, astronaut. This capstone sweeps three planets with three different faults. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-040/capstone/lab-01
$ astrona shell
```

## Step 2: Sweep every planet

```console
$ kubectl get pods -A
```

Ignore the system planets. In `deck-a` the pod is fine. In `deck-b` the pod is `Error` or `CrashLoopBackOff`. In `deck-c` the pod is `Pending`.

## Step 3: Scale relay-a

```console
$ kubectl scale deployment/relay-a --replicas=3 -n deck-a
```

## Step 4: Read the log of relay-b

```console
$ kubectl logs <RELAY_B_POD_NAME> -n deck-b
```

The log says `MODE is not set to on`. Set the variable in the Deployment:

```console
$ kubectl set env deployment/relay-b MODE=on -n deck-b
```

## Step 5: Read why relay-c is Pending

```console
$ kubectl describe pod <RELAY_C_POD_NAME> -n deck-c
```

The Events show a `FailedScheduling` event with `Insufficient memory`. Lower the request:

```console
$ kubectl set resources deployment/relay-c --requests=memory=64Mi -n deck-c
```

## Step 6: Check it worked

```console
$ kubectl get deployments -A
```

After a few seconds, all three Deployments are ready.

## Step 7: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-040/capstone/lab-01
$ astrona destroy ats-000-capstone-040
```

The Proctor checks the replicas and ready count of `relay-a`, the `MODE` variable and ready count of `relay-b`, and the ready count and image of `relay-c`.

## What you practised

- Sweeping every namespace with `-A`.
- Choosing the right clue: Events or logs.
- Fixing a replica count, an environment variable and a memory request.
