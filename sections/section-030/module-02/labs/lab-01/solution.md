# Solution Walkthrough

Mission debrief, astronaut. This lab builds one fleet order from an empty planet. Type the commands after the `$`; do not type the `$` itself. This lab was built and checked statically only. It has not been run, so no command output is shown. Compare what you see with the words below.

---

## Step 1: Start the lab

```console
$ astrona run ATS000/section-030/module-02/lab-01
$ astrona shell
```

## Step 2: Save the file

Save this as `radar.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: radar
  namespace: yaml-lab
spec:
  replicas: 2
  selector:
    matchLabels:
      app: radar
  template:
    metadata:
      labels:
        app: radar
    spec:
      containers:
        - name: scanner
          image: nginx:1.27-alpine
          ports:
            - containerPort: 80
          env:
            - name: MODE
              value: scan
```

## Step 3: Check the file without changing anything

```console
$ kubectl apply --dry-run=client -f radar.yaml
```

A good file prints a line that says the Deployment was created in dry run mode. A bad file prints the line and the problem.

## Step 4: Apply it

```console
$ kubectl apply -f radar.yaml
```

## Step 5: Check it worked

```console
$ kubectl get deployment radar -n yaml-lab
$ kubectl get pods -n yaml-lab
```

After a few seconds, the Deployment shows `2/2`.

## Step 6: Submit and clean up

```console
$ exit
$ astrona submit ATS000/section-030/module-02/lab-01
$ astrona destroy ats-000-lab-030-02-01
```

The Proctor checks the ready count, the replicas, the pod label, the container name, the image, the port and the `MODE` variable.

## What you practised

- Writing maps, lists and strings in YAML with the right indentation.
- Checking a file with a dry run before applying it.
- Matching a selector to the labels of the pod template.
