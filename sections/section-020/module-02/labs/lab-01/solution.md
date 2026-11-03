# Solution Walkthrough

Mission debrief, astronaut. This lab has two different stuck ships. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-020/module-02/lab-01
$ astrona shell
```

## Step 2: Roll call

```console
$ kubectl get pods -n rescue-lab
```

One pod, `hauler`, is `0/1` and `Pending`, with `0` restarts. The other, `flicker`, shows `Error` or `CrashLoopBackOff` and has restarts above `0`.

## Step 3: Read why hauler is Pending

```console
$ kubectl describe pod <HAULER_POD_NAME> -n rescue-lab
```

In the Events, a `FailedScheduling` event says `Insufficient memory`. The container asks for `512Gi` of memory, which no node has.

## Step 4: Fix hauler

```console
$ kubectl set resources deployment/hauler --requests=memory=64Mi -n rescue-lab
```

The Deployment builds a new pod with the smaller request. After a few seconds, it is `1/1` and `Running`.

## Step 5: Read why flicker crashes

```console
$ kubectl logs <FLICKER_POD_NAME> -n rescue-lab
```

The log says that the file `/etc/app/app.conf` is missing. The cause is not nginx: the Deployment replaces the container's start command with a `command` that prints this message and exits.

## Step 6: Fix flicker

```console
$ kubectl edit deployment/flicker -n rescue-lab
```

Delete the `command` key and its lines under the container `web`, save and close the editor. The same fix without an editor is:

```console
$ kubectl patch deployment/flicker -n rescue-lab --type=json -p='[{"op":"remove","path":"/spec/template/spec/containers/0/command"}]'
```

## Step 7: Check it worked

```console
$ kubectl get pods -n rescue-lab
```

After a few seconds, both pods are `1/1` and `Running`.

## Step 8: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-020/module-02/lab-01
$ astrona destroy ats-000-lab-020-02-01
```

The Proctor checks the ready count, the replicas and the image of both Deployments, and that `flicker` no longer overrides its command.

## What you practised

- Telling `Pending` from a crash loop with the roll call and the `RESTARTS` column.
- Reading Events for a placement problem and the log for a crash.
- Fixing the cause in the Deployment.
