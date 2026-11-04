# Solution Walkthrough

Mission debrief, astronaut. This lab has two silent fleets, and each has its own cause. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-030/module-01/lab-01
$ astrona shell
```

## Step 2: Roll call

```console
$ kubectl get deployments -n shell-lab
```

`north` shows `2/2`. `south` shows `0/0`, and `east` shows `0/2`. To keep only the lines with a zero, use a pipe:

```console
$ kubectl get deployments -n shell-lab | grep 0/
```

## Step 3: Fix south

`south` was asked for no ships, so nothing is wrong with its image. Scale it:

```console
$ kubectl scale deployment/south --replicas=2 -n shell-lab
```

## Step 4: Find the fault in east

```console
$ kubectl get pods -n shell-lab | grep east
$ kubectl describe pod <EAST_POD_NAME> -n shell-lab
```

The pod status is `ErrImagePull` or `ImagePullBackOff`. The Events say the image `nginx:1.27-alpne` was not found: the tag is missing a letter.

## Step 5: Fix east

```console
$ kubectl set image deployment/east web=nginx:1.27-alpine -n shell-lab
```

## Step 6: Check it worked

```console
$ kubectl get deployments -n shell-lab
```

After a few seconds, all three Deployments show `2/2`.

## Step 7: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-030/module-01/lab-01
$ astrona destroy ats-000-lab-030-01-01
```

The Proctor checks the replicas and the ready count of `south`, the image and the ready count of `east`, and that `north` still has 2 replicas.

## What you practised

- Reading the `READY` column of a roll call.
- Filtering output with a pipe and `grep`.
- Telling a fleet asked for no ships from a fleet whose ships will not start.
