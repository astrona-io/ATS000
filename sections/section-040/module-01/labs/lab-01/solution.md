# Solution Walkthrough

Mission debrief, astronaut. This lab teaches you to use the examiner's feedback as a to-do list. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-040/module-01/lab-01
$ astrona shell
```

## Step 2: Submit before you fix anything

```console
$ exit
$ astrona submit ATS000/section-040/module-01/lab-01
$ astrona shell
```

Every failed check shows its name and a hint. Write the failed names down: they are your to-do list.

## Step 3: Scale and label panel

```console
$ kubectl scale deployment/panel --replicas=3 -n console-lab
$ kubectl label deployment/panel tier=ops -n console-lab
```

## Step 4: Fix dial

```console
$ kubectl set image deployment/dial web=nginx:1.27-alpine -n console-lab
```

## Step 5: Check it worked

```console
$ kubectl get deployments -n console-lab
```

After a few seconds, `panel` shows `3/3` and `dial` shows `1/1`.

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-040/module-01/lab-01
$ astrona destroy ats-000-lab-040-01-01
```

The Proctor checks the replicas, the ready count and the label of `panel`, and the image and ready count of `dial`.

## What you practised

- Reading the failed checks and hints of `astrona submit`.
- Fixing one thing at a time and submitting again.
- Scaling, labelling and fixing an image in one session.
