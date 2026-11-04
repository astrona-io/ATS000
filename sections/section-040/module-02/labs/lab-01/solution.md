# Solution Walkthrough

Mission debrief, astronaut. This lab uses a namespace search and `kubectl exec`. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-040/module-02/lab-01
$ astrona shell
```

## Step 2: Find drone

```console
$ kubectl get deployments -A
```

The `NAMESPACE` column shows that `drone` is on the planet `outpost`. `hatch` is on `bay-lab`.

## Step 3: Scale drone

```console
$ kubectl scale deployment/drone --replicas=2 -n outpost
```

## Step 4: Write the note inside hatch

```console
$ kubectl exec deploy/hatch -n bay-lab -- sh -c 'echo docked > /usr/share/nginx/html/status.txt'
```

The command after `--` runs inside the container. The part in quotes is one command for the shell in the pod.

## Step 5: Check it worked

```console
$ kubectl exec deploy/hatch -n bay-lab -- cat /usr/share/nginx/html/status.txt
$ kubectl get deployments -n outpost
```

The first command prints `docked`. The second shows `drone` with `2/2` after a few seconds.

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-040/module-02/lab-01
$ astrona destroy ats-000-lab-040-02-01
```

The Proctor checks the replicas and ready count of `drone`, that `hatch` still has 1 replica, and runs a script that reads the note from the `hatch` pod.

## What you practised

- Finding an object in another namespace with `-A`.
- Running a command inside a container with `kubectl exec`.
- Scaling with `-n`.
