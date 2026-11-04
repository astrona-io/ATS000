# Solution Walkthrough

Mission debrief, astronaut. This lab rolls a Deployment back. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-050/module-02/lab-01
$ astrona shell
```

## Step 2: Look at the rollout

```console
$ kubectl get pods -n release-lab
$ kubectl rollout status deployment/engine -n release-lab --timeout=20s
```

Two old pods are `Running`. A new pod shows `ErrImagePull` or `ImagePullBackOff`. The rollout status command waits, then stops with a timeout message.

## Step 3: Read the history

```console
$ kubectl rollout history deployment/engine -n release-lab
```

Two revisions are listed, `1` and `2`.

## Step 4: Roll back

```console
$ kubectl rollout undo deployment/engine -n release-lab
```

## Step 5: Check it worked

```console
$ kubectl rollout status deployment/engine -n release-lab
$ kubectl get deployment engine -n release-lab -o jsonpath='{.spec.template.spec.containers[0].image}'
```

The rollout finishes, and the image is `nginx:1.27-alpine` again. The history now shows revisions `2` and `3`: the old template came back as the newest revision.

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-050/module-02/lab-01
$ astrona destroy ats-000-lab-050-02-01
```

The Proctor checks the image, the `RELEASE` value, the updated count and the ready count of `engine`.

## What you practised

- Reading `kubectl rollout status` and `kubectl rollout history`.
- Rolling back with `kubectl rollout undo`.
- Seeing that a revision is the whole pod template.
