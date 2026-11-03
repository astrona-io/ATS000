# Solution Walkthrough

Mission debrief, astronaut. This capstone mixes the moves of the whole section. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab and take a roll call

```console
$ astrona run ATS000/section-020/capstone/lab-01
$ astrona shell
$ kubectl get pods -n orbit-lab
```

You should see one healthy `crew` pod, one `hauler` pod that is `Pending`, and one `flicker` pod in `Error` or `CrashLoopBackOff`.

## Step 2: Scale crew and add the label

```console
$ kubectl scale deployment/crew --replicas=3 -n orbit-lab
$ kubectl patch deployment/crew -n orbit-lab --type=merge -p '{"spec":{"template":{"metadata":{"labels":{"tier":"front"}}}}}'
```

The patch adds `tier: front` to the pod template and keeps `app: crew`. The Deployment builds new pods with both labels. You can also use `kubectl edit deployment/crew -n orbit-lab` and add the label by hand.

## Step 3: Give crew a Service

Save this as `service-crew.yaml`:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: crew
  namespace: orbit-lab
spec:
  selector:
    app: crew
  ports:
    - port: 80
      targetPort: 80
```

Apply it and check that it found the pods:

```console
$ kubectl apply -f service-crew.yaml
$ kubectl get endpoints crew -n orbit-lab
```

After the new pods are ready, the endpoints list three addresses.

## Step 4: Fix hauler

```console
$ kubectl describe pod <HAULER_POD_NAME> -n orbit-lab
$ kubectl set resources deployment/hauler --requests=memory=64Mi -n orbit-lab
```

The Events show `FailedScheduling` with `Insufficient memory`. The new request is small enough to fit.

## Step 5: Fix flicker

```console
$ kubectl logs <FLICKER_POD_NAME> -n orbit-lab
$ kubectl patch deployment/flicker -n orbit-lab --type=json -p='[{"op":"remove","path":"/spec/template/spec/containers/0/command"}]'
```

The log says a file is missing; the Deployment overrides the start command with one that exits. The patch removes that command. `kubectl edit` works too.

## Step 6: Check, submit and clean up

```console
$ kubectl get pods -n orbit-lab
$ exit
$ astrona submit ATS000/section-020/capstone/lab-01
$ astrona destroy ats-000-capstone-020
```

After a few seconds, every pod is `1/1` and `Running`. The Proctor checks the replicas and ready counts, the label, the Service, and that `flicker` has no command override.

## What you practised

- Scaling, labelling and writing a Service for one fleet.
- Reading `Pending` from the Events and a crash from the log.
- Fixing the cause in the Deployment each time.
