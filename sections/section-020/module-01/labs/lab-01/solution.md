# Solution Walkthrough

Mission debrief, astronaut. This lab builds a fleet from scratch. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-020/module-01/lab-01
$ astrona shell
```

## Step 2: Look at the empty planet

```console
$ kubectl get all -n launch-lab
```

The command reports that no resources were found. The planet exists, and it is empty.

## Step 3: Write the fleet order

Save this as `deployment-relay.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: relay
  namespace: launch-lab
spec:
  replicas: 3
  selector:
    matchLabels:
      app: relay
  template:
    metadata:
      labels:
        app: relay
        tier: front
    spec:
      containers:
        - name: web
          image: nginx:1.27-alpine
          ports:
            - containerPort: 80
```

The selector and the template label `app: relay` must match. The label `tier: front` is extra.

Apply it:

```console
$ kubectl apply -f deployment-relay.yaml
```

## Step 4: Write the call sign

Save this as `service-relay.yaml`:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: relay
  namespace: launch-lab
spec:
  selector:
    app: relay
  ports:
    - port: 80
      targetPort: 80
```

Apply it:

```console
$ kubectl apply -f service-relay.yaml
```

## Step 5: Check it worked

```console
$ kubectl get deployment relay -n launch-lab
$ kubectl get pods -n launch-lab --show-labels
$ kubectl get endpoints relay -n launch-lab
```

After a few seconds, the Deployment shows `3/3` ready, the pods show both labels, and the endpoints list three addresses.

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-020/module-01/lab-01
$ astrona destroy ats-000-lab-020-01-01
```

The Proctor checks nine things on the live cluster: the Deployment's image, replicas, ready count, labels, container name and port, and the Service's selector and port.

## What you practised

- Writing a Deployment and a Service in YAML files and applying them.
- Matching the selector with the pod template labels.
- Checking a Service with `kubectl get endpoints`.
