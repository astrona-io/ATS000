# Solution Walkthrough

Mission debrief, astronaut. This capstone joins a rollback and a missing Secret. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-050/capstone/lab-01
$ astrona shell
```

## Step 2: Roll call

```console
$ kubectl get pods -n cargo-lab
```

Two `hold` pods are `Running`, one new `hold` pod shows an image pull error, and the `lock` pod shows `CreateContainerConfigError`.

## Step 3: Roll back hold

```console
$ kubectl rollout history deployment/hold -n cargo-lab
$ kubectl rollout undo deployment/hold -n cargo-lab
```

## Step 4: Create the Secret for lock

```console
$ kubectl describe pod <LOCK_POD_NAME> -n cargo-lab
$ kubectl create secret generic lock-key --from-literal=PIN=4721 -n cargo-lab
```

The Events name the missing Secret `lock-key`. The kubelet retries on its own.

## Step 5: Check it worked

```console
$ kubectl rollout status deployment/hold -n cargo-lab
$ kubectl get deployments -n cargo-lab
```

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-050/capstone/lab-01
$ astrona destroy ats-000-capstone-050
```

The Proctor checks the image, the `RELEASE` value, the updated and ready counts of `hold`, the stored `PIN` and the ready count of `lock`.

## What you practised

- Rolling back a Deployment.
- Creating a Secret that a pod waits for.
- Telling the two faults apart from the roll call.
