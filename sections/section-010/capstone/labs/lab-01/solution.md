# Solution Walkthrough

Mission debrief, astronaut. This capstone uses the whole loop twice: look, read the events, fix, then check. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown here. Describe what you see in your own words, and compare it with the text below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-010/capstone/lab-01
$ astrona shell
```

The second command opens a lab shell. In it, `kubectl` talks to this lab's cluster only.

## Step 2: Roll call on both planets

```console
$ kubectl get pods -n dock
$ kubectl get pods -n hangar
```

Every pod is `0/1`. The status is `ErrImagePull` or `ImagePullBackOff`. The kubelet could not pull the image.

## Step 3: Read why, on each planet

Copy a pod name from each roll call and open its flight record:

```console
$ kubectl describe pod <SCOUT_POD_NAME> -n dock
$ kubectl describe pod <CARGO_POD_NAME> -n hangar
```

In the Events at the bottom, the `dock` pod names the image `nginx:1.27-alpne`. The tag is misspelled: it should be `alpine`. The `hangar` pod names the image `ngnix:1.27-alpine`. This time the name is misspelled: it should be `nginx`.

## Step 4: Fix both fleet orders

```console
$ kubectl set image deployment/scout web=nginx:1.27-alpine -n dock
$ kubectl set image deployment/cargo web=nginx:1.27-alpine -n hangar
```

`web` is the name of the container inside the pod. Do not scale the Deployments or delete the pods.

## Step 5: Check it worked

```console
$ kubectl get pods -n dock
$ kubectl get pods -n hangar
```

After a few seconds, two `scout` pods and three `cargo` pods show `1/1` and `Running`. Their names are new, because they belong to the fixed Deployments.

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-010/capstone/lab-01
$ astrona destroy ats-000-capstone-010
```

The Proctor checks four things on the live cluster: both images, and that each Deployment has all of its replicas ready.

## What you practised

- Reading a roll call and the Events on more than one namespace with `-n`.
- Telling a wrong tag from a wrong image name.
- Fixing the Deployment, so the pods are rebuilt for you.
