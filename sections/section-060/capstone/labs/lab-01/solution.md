# Solution Walkthrough

Mission debrief, astronaut. This drill has four faults on one planet. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-060/capstone/lab-01
$ astrona shell
```

## Step 2: Roll call

```console
$ kubectl get pods -n drill-lab
```

`alpha` shows an image pull error, `beta` is `Pending`, `gamma` is `Error` or `CrashLoopBackOff`, and `delta-web` is `Running`.

## Step 3: Fix alpha

```console
$ kubectl describe pod <ALPHA_POD_NAME> -n drill-lab
$ kubectl set image deployment/alpha web=nginx:1.27-alpine -n drill-lab
```

## Step 4: Fix beta

```console
$ kubectl describe pod <BETA_POD_NAME> -n drill-lab
$ kubectl set resources deployment/beta --requests=memory=64Mi -n drill-lab
```

The Events show `Insufficient memory`.

## Step 5: Fix gamma

```console
$ kubectl logs <GAMMA_POD_NAME> -n drill-lab
$ kubectl set env deployment/gamma MODE=on -n drill-lab
```

The log says `MODE is not set to on`.

## Step 6: Fix delta

```console
$ kubectl get endpoints delta -n drill-lab
$ kubectl get pods -n drill-lab --show-labels
$ kubectl patch service delta -n drill-lab --type=merge -p '{"spec":{"selector":{"app":"delta-web"}}}'
```

## Step 7: Check it worked

```console
$ kubectl get deployments -n drill-lab
$ kubectl get endpoints delta -n drill-lab
```

## Step 8: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-060/capstone/lab-01
$ astrona destroy ats-000-capstone-060
```

The Proctor checks the image and ready count of `alpha`, the ready count of `beta`, the `MODE` variable and ready count of `gamma`, and the selector of `delta`.

## What you practised

- Choosing the right clue for each fault.
- Making the smallest change and checking it.
- Working through several faults in a row.
