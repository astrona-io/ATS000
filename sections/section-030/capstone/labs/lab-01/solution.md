# Solution Walkthrough

Mission debrief, astronaut. This capstone joins the terminal and YAML skills: one repair and one new file. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-030/capstone/lab-01
$ astrona shell
```

## Step 2: Roll call with a filter

```console
$ kubectl get deployments -n deck-lab
```

`lamp` shows `0/1`. Look at its pod:

```console
$ kubectl get pods -n deck-lab | grep lamp
$ kubectl describe pod <LAMP_POD_NAME> -n deck-lab
```

The Events show that the image `nginx:1.27-alpne` could not be pulled.

## Step 3: Fix lamp

```console
$ kubectl set image deployment/lamp web=nginx:1.27-alpine -n deck-lab
$ kubectl scale deployment/lamp --replicas=2 -n deck-lab
```

## Step 4: Write gauge

Save this as `gauge.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gauge
  namespace: deck-lab
spec:
  replicas: 2
  selector:
    matchLabels:
      app: gauge
  template:
    metadata:
      labels:
        app: gauge
        tier: ops
    spec:
      containers:
        - name: web
          image: nginx:1.27-alpine
          ports:
            - containerPort: 80
          env:
            - name: UNIT
              value: metric
```

Check it, then apply it:

```console
$ kubectl apply --dry-run=client -f gauge.yaml
$ kubectl apply -f gauge.yaml
```

## Step 5: Check it worked

```console
$ kubectl get deployments -n deck-lab
```

After a few seconds, both show `2/2`.

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-030/capstone/lab-01
$ astrona destroy ats-000-capstone-030
```

The Proctor checks the image, replicas and ready count of `lamp`, and the ready count, the `tier` label and the `UNIT` variable of `gauge`.

## What you practised

- Using a pipe to find the broken ship.
- Fixing an image and a replica count.
- Writing, checking and applying a Deployment file.
